############################################################################################
#	Biology & Data Exploration for Copper Rockfish
#
#				September, 2020
#
#				 Chantel Wetzel
############################################################################################

devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/nwfscSurvey")
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/PacFIN.Utilities")
#library(PacFIN.Utilities)
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/dataModerate_2021")

library(ggplot2)

dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish"

############################################################################################
#	Load Data
############################################################################################

# Commercial data
load(file.path(dir, "data", "commercial_comps", "PacFIN.COPP.bds.13.Aug.2020.RData"))
load(file.path(dir, "data", "commercial_comps", "PacFIN.COPP.bds.16.Oct.2020.RData"))
orig = PacFIN.COPP.bds.13.Aug.2020
out = out[which(!out$PSMFC_CATCH_AREA_CODE %in% c("4A", "70", "PS")), ]
pacfin = cleanColumns(data = out, use = c("vdrfd", "raw"))
pacfin$INPFC_AREA = 'all'
pacfin$SOURCE_AGID = pacfin$AGID  
# I only have forked length measurements
pacfin$FORK_LENGTH = pacfin$FISH_LENGTH
south_ca = c("DNA","HNM","LGB","NWB","OBV","OLA","OSD","OXN","SB","SD","SP","TRM","VEN","WLM")
or = c("AST","BDN","BRK","DPO","FLR","GLD","NEW","ORF","PCC","SRV","TLL","WIN","COS")
north_ca = c("ALB","ALM","ARE","AVL", "BCR","BDG","BKL","BOL","BRG","CRS","CRZ","ERK",
			 "FLN","MNT","MOS","MRO","OAK","OCA","OCM","OCN","ODN","OHB","OMD","OSF","OSL","OSM","OWC","PRN","RCH","RYS","SF","SLT","TML","TRN")
wa = unique(pacfin$PCID)[!(unique(pacfin$PCID)) %in% c(south_ca, north_ca, or)]
#The "COND" column should indicate if the sample was live or dead.
# table(pacfin$SOURCE_AGID, pacfin$COND) 
#       A    R    U
#  C    0    0 7161
#  O  866  414    0
#  W    0    0  357
# where A = alive, R = round, U = unspecified.
# Emailed Mel about all of California data being set at unspecified (U).
pacfin_data = rename_pacfin(data = pacfin,
					   area_grouping = list(south_ca, north_ca, or, wa),
					   area_names = c("south_pt_concep", "north_pt_concep", "OR", "WA"),
					   fleet_grouping = list("A", c("R", "U")), 
					   fleet_names = c("com_alive", "com_dead_unknown"), 
					   fleet_column_name = "COND")
# Throw out all the weights cause they are weird in the new pull
pacfin_data$Weight = NA

# California Recreational
ca_recfin = read.csv(file.path(dir, "data", "recreational_comps", "ca_rec_lengths_2004_2020_updated.csv"))
ca_recfin = ca_recfin[ca_recfin$Species.Name == "COPPER ROCKFISH", ]
ca_recfin = rename_budrick_recfin(data = ca_recfin)
ca_recfin_data = rename_recfin(data = ca_recfin,
					      area_grouping = list(c("CHANNEL", "SOUTH"), c("BAY AREA", "WINE", "CENTRAL", "REDWOOD", "NOT KNOWN")),
					      area_names = c("south_pt_concep", "north_pt_concep"),
					      area_column_name = "RECFIN_PORT_NAME",
					      mode_grouping = list(c("BEACH/BANK", "MAN-MADE/JETTY"), c("PARTY/CHARTER BOATS", "PRIVATE/RENTAL BOATS"), "NOT KNOWN"),
					      mode_names = c("rec_shore", "rec_boat", "rec_unknown"),
					      mode_column_name = "RecFIN.Mode.Name" )
ca_recfin_data$Source = "RecFIN_MRFSS"


ca_mrfss = read.csv(file.path(dir, "data", "recreational_comps", "ca_mrfss_bio_1980_2003.csv"))
ca_mrfss = ca_mrfss[ca_mrfss$ST == 6 & ca_mrfss$SP_CODE == 8826010108, ]
ca_mrfss = ca_mrfss[!is.na(ca_mrfss$CNTY), ] # remove records without a county
ca_mrfss$STATE_NAME = "CA"
spc = c(59, 73, 37, 111, 83)
npc = unique(ca_mrfss[!ca_mrfss$CNTY %in% spc, "CNTY"]) 
ca_mrfss_data = rename_mrfss(data = ca_mrfss,
							 len_col = "LNGTH",
							 area_grouping = list(spc, npc), 
							 area_names = c("south_pt_concep", "north_pt_concep"), 
							 area_column_name = "CNTY", 
							 mode_grouping = list(c(1,2), c(6, 7)),
					      	 mode_names = c("rec_shore", "rec_boat"),
					      	 mode_column_name = "MODE_FX" )

# Oregon Recreational
or_mrfss = read.csv(file.path(dir, "data", "recreational_comps", "Oregon", "copper_mrfss_bio_1980_2003.csv"))
or_mrfss$STATE_NAME = "OR"
or_mrfss_data = rename_mrfss(data = or_mrfss,
							 len_col = "Total.Length",
							 area_grouping = list(421), 
							 area_names = c("OR"),
							 area_column_name = "ORBS_SPP_Code", # This is essentially a cheat
							 mode_grouping = list(c(1,2), c(6, 7)),
					      	 mode_names = c("rec_shore", "rec_boat"),
					      	 mode_column_name = "MRFSS_MODE_FX" )

or_recfin_len = read.csv(file.path(dir, "data", "recreational_comps", "Oregon", "copper_recfin_bio_lw_2001_2020.csv"), skip = 22)
# remove the fish lengths that were sampled for age as well
or_recfin_len = or_recfin_len[or_recfin_len$Source.Code %in% c("BIO", "CPFV"), ]
or_recfin_len_data = rename_recfin(data = or_recfin_len, 
								   area_column_name = "State.Name",
								   area_grouping = list("Oregon"), 
								   area_names = "OR",
								   mode_grouping = list(c("BEACH/BANK", "MAN-MADE/JETTY"), c("PARTY/CHARTER BOATS", "PRIVATE/RENTAL BOATS"), "NOT KNOWN"),
					      		   mode_names = c("rec_shore", "rec_boat", "rec_unknown"),
					      		   mode_column_name = "RecFIN.Mode.Name" )
or_recfin_len_data$Source = "RecFIN_MRFSS"

or_recfin_age = read.csv(file.path(dir, "data", "recreational_comps", "Oregon", "copper_recfin_bio_age_2005_2019.csv"))
or_recfin_age_data = rename_recfin(data = or_recfin_age, 
								   area_grouping = list("ODFW"), 
								   area_names = c("OR"), 
								   area_column_name = "SAMPLING_AGENCY_NAME",
								   mode_grouping = list( c("PARTY/CHARTER BOATS", "PRIVATE/RENTAL BOATS")),
					      		   mode_names = c("rec_boat"),
					      		   mode_column_name = "RECFIN_MODE_NAME" )
or_recfin_age_data$Source = "RecFIN_MRFSS"

# Washington Recreational
# According to Theresa WA lengths are all FL
wa_recfin = read.csv(file.path(dir, "data", "recreational_comps",  "wa_rec_bds_copper.csv"))
wa_recfin = rename_wa_recfin( data = wa_recfin)
wa_recfin_data = rename_recfin(data = wa_recfin, 
						  area_grouping = list(unique(wa_recfin$RECFIN_PORT_NAME)), 
						  area_names = c("WA"),
						  area_column_name = "RECFIN_PORT_NAME",
						  mode_grouping = list( c("C", "B","\\?", "^$")),
					      mode_names = c("rec_boat"),
					      mode_column_name = "boat_mode_code"  )
wa_recfin_data$State_Areas = "WA"
wa_recfin_data$Source = "RecFIN_MRFSS"


hkl = read.csv(file.path(dir, "data", "survey", "qryGrandUnifiedThru2019_06182020.csv"))
sub_hkl = hkl[hkl$COMNAME == 'Copper Rockfish', ]
sub_hkl = rename_hook_and_line(data = sub_hkl, survey_name = "nwfsc_hkl")

load(file.path(dir, "data", "survey", "wcgbts", "Bio_All_NWFSC.Combo_2020-08-14.rda"))
bio = Data
bio = rename_survey_data(data = bio,
						 area_split = c(34.5, 42, 46), 
						 area_names = c("south_pt_concep", "north_pt_concep", "OR", "WA"),
						 survey_name = "nwfsc_wcgbts" )

############################################################################################
# Put all the data into one list
############################################################################################
input = list()
input[[1]] = bio
input[[2]] = sub_hkl
input[[3]] = pacfin_data
input[[4]] = ca_recfin_data
input[[5]] = wa_recfin_data
input[[6]] = ca_mrfss_data
input[[7]] = or_recfin_len_data
input[[8]] = or_recfin_age_data
input[[9]] = or_mrfss_data

############################################################################################
#	Create data frame with all the input data
############################################################################################
out = create_data_frame(data_list = input)

out$round_length = round(out$Length,0)
############################################################################################
# Evaluate the data with ages,lengths, and weights - look for unusual data points that should 
# be removed from the data set
############################################################################################

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "Length_Weight_All_Sources.png", w = 7, h = 7, pt = 12)
par(mfrow = c(3,2))
for(s in unique(out$Source)){
	plot(out[out$Source == s, "Length"], out[out$Source == s, "Weight"], main = s, 
		xlim = c(0, 60), ylim = c(0,10), xlab = 'Length (cm)', ylab = 'Weight (kg)')
}
dev.off()

# Now lets do a check length check to filter out any anomolysis lengths
remove = which(out$Length > 65 | out$Length < 5)
#     Year Lat Lon State     State_Areas Areas Depth Sex  Length Weight Age Fleet Data_Type       Source Lhat_pred Lhat_low Lhat_high
# 2017  NA  NA    CA north_pt_concep  <NA>    NA   U 66.8000      -  NA  boat  RETAINED       RecFIN        NA       NA        NA
# 2008  NA  NA    CA north_pt_concep  <NA>    NA   U  4.2000   2.34  NA  boat  RETAINED       RecFIN        NA       NA        NA
# 1998  NA  NA    CA south_pt_concep  <NA>    NA   U  0.2649   <NA>  NA  boat      <NA> RecFIN_MRFSS        NA       NA        NA
# 1985  NA  NA    CA south_pt_concep  <NA>    NA   U 80.2000    9.5  NA  boat      <NA> RecFIN_MRFSS        NA       NA        NA
# 2012  NA  NA    OR              OR  <NA>    NA   U 66.8000   3.10  NA  boat  RETAINED       RecFIN        NA       NA        NA

# Looks good - let's remove those few lengths
out = out[-remove, ]


# These parameters were from Lea et al. 1999 - I don't think the L2 value is the right choice 
# because it is Linf not the length at which growth asymptotes
# 2013 XSSS Growth Parameters
# 14.48 # L_at_Amin_Fem_GP_
# 57.2  # L_at_Amax_Fem_GP_1
# 0.13  # VonBert_K_Fem_GP_1
# 9.42  # L_at_Amin_Mal_GP_1
# 51.7  # L_at_Amax_Mal_GP_1
# 0.22  # VonBert_K_Mal_GP_1

out = checkLenAge(Pdata = out, 
   			      Par =  list( 0.17, 50, 12, 0.10, 0.10), 
   			      len_col = "Length", 
   			      age_col = "Age", 
   			      sex_col = "Sex",
   			      mult = 1)

# remove data that are outside the 4*sd interval
remove = which(out$Length < out$Lhat_low | out$Length > out$Lhat_high)

plot(out$Age, out$Length, type = 'p', col = rgb(0,0,0, alpha = 0.1))
points(out$Age[remove], out$Length[remove], col = 'red')

# These are the bad 5 records
#       Year Lat Lon State State_Areas Areas Depth Sex Length Weight Age Fleet Data_Type Source Lhat_pred Lhat_low Lhat_high
# 61577 1999  NA  NA    WA          WA  <NA>    NA   M   23.0   <NA>   6  boat  RETAINED RecFIN        36       24        49
# 62628 2006  NA  NA    WA          WA  <NA>    NA   M   33.8   <NA>  22  boat  RETAINED RecFIN        47       34        60
# 63370 2014  NA  NA    WA          WA  <NA>    NA   F   49.0   <NA>   6  boat  RETAINED RecFIN        36       24        48
# 92283 2018  NA  NA    OR          OR  <NA>    NA   M   52.3   <NA>   7  boat      <NA> RecFIN        38       26        51
# 92433 2019  NA  NA    OR          OR  <NA>    NA   F   52.7   <NA>   7  boat      <NA> RecFIN        38       25        50

# Looks good - let's remove them
out = out[-remove,]

quantile(out$Age, na.rm = TRUE)
# 0%  25%  50%  75% 100% 
#   3    7   10   15   51

# What years have the oldest ages
find = which(out$Age > 45)
# out[find, ]
# Year Lat Lon State State_Areas Areas Depth Sex Length Weight Age Fleet Data_Type Source Lhat_pred Lhat_low Lhat_high
# 2019  NA  NA    WA          WA  <NA>    NA   F   55.0   <NA>  51  boat  RETAINED RecFIN        50       37        62
# 2019  NA  NA    WA          WA  <NA>    NA   F   54.0   <NA>  48  boat  RETAINED RecFIN        50       37        62
# 2007  NA  NA    OR          OR  <NA>    NA   F   44.1   <NA>  51  boat      <NA> RecFIN        50       37        62
# 2010  NA  NA    OR          OR  <NA>    NA   F   58.1   <NA>  47  boat      <NA> RecFIN        50       37        62

# What is the trend in length and age across time
# This figure includes all data -- which may be biased due to selectivity
pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "Data_Summary_Len_Age_by_Year.png", w = 7, h = 7, pt = 12)
par(mfrow = c(2, 1), mar = c(4,4,2,2), oma = c(1,1,1,1))
plot(out$Year, out$Length, ylab = "Length (cm)", xlab = "Year", ylim = c(0, max(out$Length, na.rm = TRUE)))
tmp = aggregate (Length ~ Year, out, FUN = median)
lines(tmp$Year, tmp$Length, lty = 1, col = 'red', lwd = 3)
plot(out$Year, out$Age, ylab = "Age", xlab = "Year", ylim = c(0, max(out$Age, na.rm = TRUE)))
tmp = aggregate (Age ~ Year, out, FUN = median)
lines(tmp$Year, tmp$Age, lty = 1, col = 'red', lwd = 3)
dev.off()

# What area and gear are the ages coming from? 
table(out$Fleet, out$State_Areas, !is.na(out$Age))
# , ,  = TRUE           
#                 north_pt_concep    OR south_pt_concep    WA
#  com_alive                      0     0               0     0
#  com_dead_unknown               0     0               0     0
#  rec_boat                       0  2296               0  1826
#  rec_shore                      0     0               0     0
#  rec_unknown                    0     0               0     0
#  survey                         0     0               0     0



############################################################################################
#	Examined the retained vs. released samples by state
############################################################################################

# How many retained vs. released observations do we have:
#             RELEASED RETAINED
# NWFSC_HKL           0     1117
# NWFSC_WCGBTS        0     1050
# PacFIN              0     8222
# RecFIN            310    65387
# RecFIN_MRFSS        0        0

# table(out[out$Data_Type == "RELEASED", "State_Areas"])
# north_pt_concep   OR south_pt_concep 
#              49   74             187


pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "Retain_vs_Released_Prop.png", w = 7, h = 7, pt = 12)
ggplot(out[which(!is.na(out$Data_Type)), ], aes(Length, fill = Data_Type, color = Data_Type)) +
	facet_wrap(facets = c("State")) +
	geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5)
dev.off()

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "Retained_vs_Released_Lengths.png", w = 7, h = 7, pt = 12)
par(mfrow = c(2,3))
hist(out[out$Data_Type == "RELEASED" & out$State_Areas == "south_pt_concep", "Length"], xlim = c(0, 70), 
	xlab = "Length (cm)", main = "south_pt_concep: Released")
abline(v = mean(out[out$Data_Type == "RELEASED" & out$State_Areas == "south_pt_concep", "Length"], na.rm = TRUE), lty = 2, lwd = 2)

hist(out[out$Data_Type == "RELEASED" & out$State_Areas == "north_pt_concep", "Length"], xlim = c(0, 70), 
	xlab = "Length (cm)", main = "north_pt_concep: Released")
abline(v = mean(out[out$Data_Type == "RELEASED" & out$State_Areas == "north_pt_concep", "Length"], na.rm = TRUE), lty = 2, lwd = 2)

hist(out[out$Data_Type == "RELEASED" & out$State_Areas == "OR", "Length"], xlim = c(0, 70), 
	xlab = "Length (cm)", main = "OR: Released")
abline(v = mean(out[out$Data_Type == "RELEASED" & out$State_Areas == "OR", "Length"], na.rm = TRUE), lty = 2, lwd = 2)

hist(out[out$Data_Type == "RETAINED" & out$State_Areas == "south_pt_concep" & out$Source == "RecFIN", "Length"], 
	xlim = c(0, 70), xlab = "Length (cm)", main = "south_pt_concep: Retained")
abline(v = mean(out[out$Data_Type == "RETAINED" & out$State_Areas == "south_pt_concep" & out$Source == "RecFIN", "Length"], na.rm = TRUE), lty = 2, lwd = 2)

hist(out[out$Data_Type == "RETAINED" & out$State_Areas == "north_pt_concep" & out$Source == "RecFIN", "Length"], 
	xlim = c(0, 70), xlab = "Length (cm)", main = "north_pt_concep: Retained")
abline(v = mean(out[out$Data_Type == "RETAINED" & out$State_Areas == "north_pt_concep" & out$Source == "RecFIN", "Length"], na.rm = TRUE), lty = 2, lwd = 2)

hist(out[out$Data_Type == "RETAINED" & out$State == "OR" & out$Source == "RecFIN", "Length"], 
	xlim = c(0, 70), xlab = "Length (cm)", main = "OR: Retained")
abline(v = mean(out[out$Data_Type == "RETAINED" & out$State == "OR" & out$Source == "RecFIN", "Length"], na.rm = TRUE), lty = 2, lwd = 2)

dev.off()

# Remove the released for the rest of the summaries for now:
out = out[out$Data_Type %in% c("RETAINED", NA), ]

############################################################################################
#	Summarize the remaining data
############################################################################################

data_sum = summarize_data(dir = file.path(dir, "data", "biology"), data = out)
write.csv(data_sum$area_fleet_source_year, file = file.path(dir, "data", "biology", "sample_by_source_area_year.csv"))

############################################################################################
#	Sum total of samples by area and source
############################################################################################

# tmp = aggregate(Length~State_Areas + Source, data = out, FUN = function(x) length(x))
# i = sort(tmp$State_Areas, index.return = TRUE)$ix
# tmp[i,]
#     State_Areas       Source Length
# north_pt_concep NWFSC_WCGBTS   1047
# north_pt_concep       PacFIN   4326
# north_pt_concep       RecFIN  28700
# north_pt_concep RecFIN_MRFSS   6087
#              OR NWFSC_WCGBTS      3
#              OR       PacFIN   1279
#              OR       RecFIN  13506
#              OR RecFIN_MRFSS    902
# south_pt_concep    NWFSC_HKL   1107
# south_pt_concep       PacFIN   2611
# south_pt_concep       RecFIN  21499
# south_pt_concep RecFIN_MRFSS    983
#              WA       PacFIN      6
#              WA       RecFIN   3814

############################################################################################
#	Sex Ratio by Age or Length
############################################################################################


temp = table(out$round_length, out$Sex)
ratioF = temp[,"F"] / (temp[,"M"] + temp[,"F"])
nobs = temp[,"F"] + temp[,"M"]

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "Length_fraction_female.png", w = 7, h = 7, pt = 12)
par(mfrow = c(1,1))
plot(x = names(ratioF), y = ratioF, type="l", col="red", 
	xlab = "Length (cm)", ylab="Fraction female")
abline(h = 0.50, col = "grey", lty = 2, lwd = 2)
symbols(x = names(ratioF), y = ratioF, circles = nobs, 
	inches = 0.1, fg="red", bg = rgb(1,0,0, alpha=0.5), add=T)
dev.off()

temp = table(out$Age, out$Sex)
ratioF = temp[,"F"] / (temp[,"M"] + temp[,"F"])
nobs = temp[,"F"] + temp[,"M"]

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "Age_fraction_female.png", w = 7, h = 7, pt = 12)
par(mfrow = c(1,1))
plot(x = names(ratioF), y = ratioF, type="l", col="red", xlim = c(0, 50),
	xlab = "Age", ylab="Fraction female")
abline(h = 0.50, col = "grey", lty = 2, lwd = 2)
symbols(x = names(ratioF), y = ratioF, circles = nobs, 
	inches = 0.1, fg="red", bg = rgb(1,0,0, alpha=0.5), add=T)
dev.off()

age_tmp = out[which(!is.na(out$Age)), ]
age_tmp$source_state = paste0(age_tmp$State,"_",age_tmp$Source)
tbl = table(age_tmp$Year, age_tmp$source_state)
write.csv(tbl, file = file.path(dir, "data", "biology", "age_samples_by_state_source.csv"),
		  row.names = FALSE)

############################################################################################
#	Quickly look at the commercial samples by gear to see if the amount of data for each
#   and if there looks to be different selectivity by gear type
############################################################################################

hkl = c("HKL", "VHL", "OHL")
lgl = c("LGL")
other = unique(pacfin$GRID)[which(!unique(pacfin$GRID) %in% c(hkl, lgl))]
pacfin$gear[pacfin$GRID %in% hkl] = "hkl"
pacfin$gear[pacfin$GRID %in% c(lgl, other)] = "lgl"
#pacfin$gear[pacfin$GRID %in% other] = "other"
#  gear     State_Areas   Length    N
#   hkl south_pt_concep 38.11708  650
#   lgl south_pt_concep 36.47479 1868
# other south_pt_concep 38.32473   98
################################
#   hkl north_pt_concep 36.71645 1477
#   lgl north_pt_concep 39.71120 2572
# other north_pt_concep 39.68520  277
################################
#   hkl              OR 42.35783  517
#   lgl              OR 43.17607  727
# other              OR 43.71429   35
################################
#   lgl              WA 51.00000    1
# other              WA 44.20000    5

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "Live_vs_Dead.png", w = 7, h = 7, pt = 12)
tmp = out[out$Source == "PacFIN" & out$State != "WA", ]
ggplot(tmp, aes(Length, fill = Fleet, color = Fleet)) +
	facet_wrap(facets = c("State_Areas")) +
	geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5)
dev.off()


pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "Gear_by_Area.png", w = 7, h = 7, pt = 12)
tmp = pacfin[pacfin$gear != "other" & pacfin$State_Areas != "WA", ]
ggplot(tmp, aes(Length, fill = gear, color = gear)) +
	facet_wrap(facets = c("State_Areas"), nrow = 3, ncol = 1) +
	geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5)
dev.off()


pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "Length_Dists_by_Area.png", w = 7, h = 7, pt = 12)
ggplot(out, aes(Length, fill = Source, color = Source)) +
	facet_wrap(facets = c("State_Areas")) +
	geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5)
dev.off()

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "Live_vs_Dead_OR_Prop.png", w = 7, h = 7, pt = 12)
tmp = out[which(out$Source == "PacFIN" & out$State_Areas == "OR"), ]
ggplot(tmp, aes(Length, fill = Fleet, color = Fleet)) +
	#facet_wrap(facets = c("State_Areas")) +
	geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5)
dev.off()

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "RecFIN_vs_MRFSS_Length_Dists_by_Area.png", w = 12, h = 7, pt = 12)
tmp = out[which(out$Source %in% c("RecFIN", "RecFIN_MRFSS") & out$Fleet %in% c("rec_boat")), ]
tmp$source_fleet = paste0(tmp$Source, "_", tmp$Fleet)
ggplot(tmp, aes(Length, fill = source_fleet, color = source_fleet)) +
	facet_wrap(facets = c("State_Areas")) +
	geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5)
dev.off()


or_mrfss_data$water_area = or_mrfss_data$Area_X_Name
or_recfin_len_data$water_area = or_recfin_len_data$Agency.Water.Area.Name
cols = c("State", "State_Areas", "Source", "Fleet", "Length", "water_area")
tmp = rbind(or_recfin_len_data[, cols], or_mrfss_data[,cols], ca_recfin_data[,cols], ca_mrfss_data[,cols])
tmp$water_area[which(tmp$water_area == "Ocean <=3 miles")] = "OCEAN <= 3 MILES"
tmp$water_area[which(tmp$water_area == "Ocean >3 miles")] = "OCEAN > 3 MILES"

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "Recreational_by_Ocean_Area.png", w = 12, h = 7, pt = 12)
tmp = tmp[which(!tmp$water_area %in% c(NA, "UNKNOWN", "NOT KNOWN")),]
ggplot(tmp, aes(Length, fill = water_area, color = water_area)) +
	facet_wrap(facets = c("State_Areas")) + #, "Source")) +
	geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5)
dev.off()

table(tmp$water_area, tmp$State_Areas)
#                  north_pt_concep    OR south_pt_concep
#  ESTUARY                        0    68               0
#  Inland                         0   462               0
#  OCEAN                       3533   275            1903
#  OCEAN <= 3 MILES           27734 11210           17770
#  OCEAN > 3 MILES             3782   256            3020


############################################################################################
#	Plot length-at-weight data by source and year
############################################################################################
length_weight_plot(dir = file.path(dir, "data", "biology"), data = out)


############################################################################################
#	Plot length frequency by sex, data source, and area
############################################################################################

length_freq_plot(dir = file.path(dir, "data", "biology"), data = out)

############################################################################################
# Estimate Growth Using only Survey data
############################################################################################
survey_dat <- out[out$Source %in% c("NWFSC_WCGBTS", "NWFSC_HKL"),]

est_growth <- estimate_length_weight(data = survey_dat)
save(est_growth, file = file.path(dir, "data", "biology", "growth_estimates_survey.Rdat"))

length_weight_plot(dir = file.path(dir, "data", "biology"),
				   nm_append = "Survey", data = survey_dat, ests = est_growth)

############################################################################################
#	Comparison between lengths inside vs. outside of the CCA for the HKL
############################################################################################

compare_length_cca (dir = file.path(dir, "data", "biology"), 
					data = out, file = "hkl_cca_comparison", plot_long = TRUE)


############################################################################################
# Estimate Length-at-Age: These estimates will be based on OR & WA rec boat samples 
############################################################################################

len_age <- estimate_length_age(data = out)

save(len_age, file = file.path(dir, "data", "biology", "length_age_estimates.Rdat"))

length_age_plot(dir = file.path(dir, "data", "biology"), plots = 4, 
				data = out, nm_append = "RecFIN", ests = len_age)


############################################################################################
# Compare the Length of Aged fish to the total lengths
############################################################################################

pngfun(wd = file.path(dir, "data", "biology", "plots"), 
	file = "Compare_Lengths_for_Aged_Fish.png", w = 12, h = 7, pt = 12)
out$type = "length"
out$type[which(!is.na(out$Age))] = "age"
ggplot(out[which(out$Source == "RecFIN" & out$State != "CA"),], aes(Length, fill = type, color = type)) +
	facet_wrap(facets = c("Source", "State")) +
	geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5, bw = 1)
dev.off()

############################################################################################
# Look at length patterns by latitude - this will be based solely on survey data because
# other data does not have latitude (could add something for "area")
############################################################################################

library(plyr)
out$lat_bin = plyr::round_any(out$Lat, 0.5)
pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "Len_by_Latitude_Survey.png", w = 7, h = 7, pt = 12)
par(mfrow = c(2, 1), mar = c(4,4,2,2), oma = c(1,1,1,1))
for (ss in c("F", "M")){
	find = which(out$Sex == ss & out$Source %in% c("NWFSC_WCGBTS", "NWFSC_HKL"))
	col = ifelse(ss == "F", alpha('red', 0.6), alpha('blue', 0.6))
	boxplot(out$Length[find] ~ out$lat_bin[find],  col = col, ylim = c(0, 70),
		ylab = "Length (cm)", xlab = "Latitude", main = ss)
}
dev.off()

############################################################################################
# What do the ages by data source look like?
############################################################################################

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "Age_Dists_by_Source.png", w = 7, h = 7, pt = 12)
out$state_source = paste0(out$Source, "_", out$State)
ggplot(out, aes(Age, fill = state_source, color = state_source)) +
	#facet_wrap(facets = c("State")) +
	geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5)
dev.off()


#---------------------------------------------------------------------------------------------
# Create the length-at-age figure with lit growth estimates added
#---------------------------------------------------------------------------------------------


line_col = c("red", 'blue')
sex_col = alpha(line_col, 0.5)
keep = which(!is.na(out$Age))
tmp = out[keep, ]
lens = 1:max(tmp$Length, na.rm = TRUE)
xmax = max(tmp$Age + 2,    na.rm = TRUE)
ymax = max(tmp$Length + 5, na.rm = TRUE)

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "doc_Length_Age_by_Sex.png", w = 12, h = 7, pt = 12)
par(mfrow = c(1, 1))
plot(tmp[tmp$Sex == "F", "Age"], tmp[tmp$Sex == "F", "Length"], xlab = "Age", ylab = "Length (cm)",
	xaxs = "i", yaxs = "i",ylim = c(0, ymax), xlim = c(0, xmax), pch = 1, col = sex_col[1]) 
points(tmp[tmp$Sex == "M", "Age"], tmp[tmp$Sex == "M", "Length"], pch = 1, col = sex_col[2])
lines(0:ymax, vb_fn(age = 0:ymax, Linf = len_age$all_F[1], L0 = len_age$all_F[2], k = len_age$all_F[3]), 
	col = line_col[1], lty = 1, lwd = 2)
lines(0:ymax, vb_fn(age = 0:ymax, Linf = len_age$all_M[1], L0 = len_age$all_M[2], k = len_age$all_M[3]), 
	col = line_col[2], lty = 1, lwd = 2)	
leg = c(paste0("F : Linf = ", round(len_age$all_F[1], 1),  " L1 = ", round(len_age$all_F[2], 1)," k = ", round(len_age$all_F[3], 3)),
		paste0("M : Linf = ", round(len_age$all_M[1], 1),  " L1 = ", round(len_age$all_M[2], 1)," k = ", round(len_age$all_M[3], 3)))
legend("bottomright", bty = 'n', legend = leg, lty = c(1,1), col = c(rep(line_col,2)), lwd = 2, cex = 1.25)
dev.off()

source_col = c(rgb(red = 0, green = 1, blue= 0, alpha = 0.40),
			   rgb(red = 1, green = 160/255, blue=0, alpha = 0.4),
			   rgb(red = 160/255, green = 32/255, blue=240/255, alpha = 0.4))
pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "doc_Data_Length_Age_by_Sex.png", w = 12, h = 7, pt = 12)
par(mfrow = c(1, 1))
ind = tmp$Source == "PacFIN"
plot(tmp[ind, "Age"], tmp[ind, "Length"], xlab = "Age", ylab = "Length (cm)",
	xaxs = "i", yaxs = "i",ylim = c(0, ymax), xlim = c(0, xmax), pch = 16, col = source_col[1]) 
ind = which(tmp$Source == "RecFIN_MRFSS" & tmp$State == "OR")
points(tmp[ind, "Age"], tmp[ind, "Length"], pch = 16, col = source_col[2])
ind = which(tmp$Source == "RecFIN_MRFSS" & tmp$State == "WA")
points(tmp[ind, "Age"], tmp[ind, "Length"], pch = 16, col = source_col[3])
legend("bottomright", bty = 'n', 
		legend = c('OR - Commercial', 'OR - Recreational', 'WA - Recreational'), 
		col = source_col, pch = c(16, 16, 16), cex = 1.25)
dev.off()


line_col = c("red", 'blue')
sex_col = alpha(line_col, 0.5)
keep = which(!is.na(out$Age))
tmp = out[keep, ]
lens = 1:max(tmp$Length, na.rm = TRUE)
xmax = max(tmp$Age + 2,    na.rm = TRUE)
ymax = max(tmp$Length + 5, na.rm = TRUE)

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "Length_Age_by_Sex_with_Lea_Ests.png", w = 12, h = 7, pt = 12)
par(mfrow = c(1, 1))
plot(tmp[tmp$Sex == "F", "Age"], tmp[tmp$Sex == "F", "Length"], xlab = "Age", ylab = "Length (cm)",
	xaxs = "i", yaxs = "i",ylim = c(0, ymax), xlim = c(0, xmax), pch = 1, col = sex_col[1]) 
points(tmp[tmp$Sex == "M", "Age"], tmp[tmp$Sex == "M", "Length"], pch = 1, col = sex_col[2])
lines(0:ymax, vb_fn(age = 0:ymax, Linf = len_age$RecFIN_F[1], L0 = len_age$RecFIN_F[2], k = len_age$RecFIN_F[3]), 
	col = line_col[1], lty = 1, lwd = 2)
lines(0:ymax, vb_fn(age = 0:ymax, Linf = len_age$RecFIN_M[1], L0 = len_age$RecFIN_M[2], k = len_age$RecFIN_M[3]), 
	col = line_col[2], lty = 1, lwd = 2)	
# Lea 1999 parameters
lines(0:xmax, 57 * (1 - exp(-0.127 * (0:xmax + 1.3))), col = 'red',  lty = 3, lwd = 2)
lines(0:xmax, 52 * (1 - exp(-0.224 * (0:xmax + 0.1))), col = 'blue', lty = 3, lwd = 2) 
# Love unpublished 
lines(0:xmax, 46 * (1 - exp(-0.1 * (0:xmax + 3.7))), col = 'springgreen4',  lty = 4, lwd = 2) 
leg = c(paste0("F : Linf = ", round(len_age$RecFIN_F[1], 1),  " L1 = ", round(len_age$RecFIN_F[2], 1)," k = ", round(len_age$RecFIN_F[3], 3)),
		paste0("M : Linf = ", round(len_age$RecFIN_M[1], 1),  " L1 = ", round(len_age$RecFIN_M[2], 1)," k = ", round(len_age$RecFIN_M[3], 3)),
		"F: Linf = 57, k = 0.13 (Lea 1999)", 
		"M: Linf = 46, k = 0.22 (Lea 1999)", "U: Love (unpublished)")
legend("bottomright", bty = 'n', legend = leg, lty = c(1,1,3,3,4), col = c(rep(line_col,2), "springgreen4"), lwd = 2, cex = 1.25)
dev.off()

# Add the few ages from Budrick and Lea's report
sex_col = alpha(line_col, 0.25)
ca_age = read.csv(file.path(dir, "data", "biology", "ca_copper_budrick_lea_ages.csv"))
pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "Length_Age_by_Sex_with_CA_Age_Points.png", w = 12, h = 7, pt = 12)
par(mfrow = c(1, 1))
plot(ca_age[ca_age$Source == "Budrick", "Age"], ca_age[ca_age$Source == "Budrick", "Length"], pch = 16, col = 'darkslategrey', xlab = "Age", ylab = "Length (cm)",
	xaxs = "i", yaxs = "i",ylim = c(0, 65), xlim = c(0, xmax), cex = 1.5, las = 1) 
#points(tmp[tmp$Sex == "M", "Age"], tmp[tmp$Sex == "M", "Length"], pch = 1, col = sex_col[2])
# add ca age points
#points(ca_age[ca_age$Source == "Budrick", "Age"], ca_age[ca_age$Source == "Budrick", "Length"], pch = 16, col = 'orange', cex = 1.5)
points(ca_age[ca_age$Source == "Lea", "Age"], ca_age[ca_age$Source == "Lea", "Length"], pch = 16, col = 'orange', cex = 1.5)
lines(0:ymax, vb_fn(age = 0:ymax, Linf = len_age$RecFIN_F[1], L0 = len_age$RecFIN_F[2], k = len_age$RecFIN_F[3]), 
	col = line_col[1], lty = 1, lwd = 2)
lines(0:ymax, vb_fn(age = 0:ymax, Linf = len_age$RecFIN_M[1], L0 = len_age$RecFIN_M[2], k = len_age$RecFIN_M[3]), 
	col = line_col[2], lty = 1, lwd = 2)	
# Lea 1999 parameters
lines(0:xmax, 57 * (1 - exp(-0.127 * (0:xmax + 1.3))), col = 'red',  lty = 3, lwd = 2)
lines(0:xmax, 52 * (1 - exp(-0.224 * (0:xmax + 0.1))), col = 'blue', lty = 3, lwd = 2) 
# Love unpublished 
lines(0:xmax, 46 * (1 - exp(-0.1 * (0:xmax + 3.7))), col = 'springgreen4',  lty = 4, lwd = 2) 
leg = c(paste0("F : Linf = ", round(len_age$RecFIN_F[1], 1),  " L1 = ", round(len_age$RecFIN_F[2], 1)," k = ", round(len_age$RecFIN_F[3], 3)),
		paste0("M : Linf = ", round(len_age$RecFIN_M[1], 1),  " L1 = ", round(len_age$RecFIN_M[2], 1)," k = ", round(len_age$RecFIN_M[3], 3)),
		"F: Linf = 57, k = 0.13 (Lea 1999)", 
		"M: Linf = 46, k = 0.22 (Lea 1999)" , "U: Love (unpublished)")
legend("bottomright", bty = 'n', legend = leg, lty = c(1,1,3,3,4), cex = 1.25, col = c(rep(line_col,2), "springgreen4"), lwd = 2)
legend("topleft", bty = 'n', legend = c("Lea Data", "1970s CPFV") , pch = 16, col = c('orange', 'darkslategrey'), cex = 1.25)
dev.off()

############################################################################################
# Look at the length distributions for California
############################################################################################

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "Len_by_Sex_CA_Survey.png", w = 12, h = 7, pt = 12)
par(mfrow = c(1, 2), mar = c(4,4,2,2), oma = c(1,1,1,1))
area = c("S. Pt. Conception", "N. Pt. Conception"); ind = 0
for (ss in c("NWFSC_HKL", "NWFSC_WCGBTS")){
	ind = ind + 1
	find = which(out$Source == ss & out$State == "CA")
	#col = ifelse(ss == "F", alpha('red', 0.6), ifelse(ss == "M", alpha('blue', 0.6), alpha('grey', 0.6)))
	boxplot(out$Length[find] ~ out$Sex[find], ylim = c(0, 70), col = c('red', 'blue', 'grey'), las = 1,
		ylab = "Length (cm)", xlab = "Fish Sex", main = paste0(area[ind],": ", ss))
	legend("topleft", bty = 'n', legend = c(paste0("Female N = ", sum(out$Sex[find] == "F")), 
		paste0("Male N = ", sum(out$Sex[find] == "M")), paste0("Unsexed N = ", sum(out$Sex[find] == "U"))),
	    cex = 1.5)
}
dev.off()

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "Length_by_Sex_All_Data.png", w = 12, h = 7, pt = 12)
#tmp = out[which(out$Source %in% c("NWFSC_WCGBTS", "NWFSC_HKL") & out$State != "OR"),]
ggplot(out, aes(Length, fill = Sex, color = Sex)) +
	facet_wrap(facets = c("State_Areas")) + #, "Source")) +
	#scale_color_manual(values = c("F" = alpha('red',0.5), "M" = alpha('blue', 0.5), "U" = alpha('black', 0.2))) 
	geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5)
dev.off()

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "Length_by_Sex_CA_Survey_Prop.png", w = 12, h = 7, pt = 12)
tmp = out[which(out$Source %in% c("NWFSC_WCGBTS", "NWFSC_HKL") & out$State != "OR" & out$Sex != "U"),]
ggplot(tmp, aes(Length, fill = Sex, color = Sex)) +
	facet_wrap(facets = c("State_Areas", "Source")) + #, "Source")) +
	#scale_color_manual(values = c("F" = alpha('red',0.5), "M" = alpha('blue', 0.5), "U" = alpha('black', 0.2))) 
	geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5)
dev.off()


############################################################################################
# Double check the distribution of all lengths vs. the ages
############################################################################################

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "Compare_Lengths_for_Aged_Unaged_Fish.png", w = 7, h = 7, pt = 12)
par(mfrow = c(2,2))
for(sex in c("F", "M")){
	hist(out[out$Sex == sex, "Length"], xlim = c(0, 60),  xlab = "Length (cm)", 
		col = ifelse(sex == "F", alpha('red', 0.65), alpha('blue', 0.5)), main = paste0("All Fish Lengths: ", sex))
	abline(v = median(out[out$Sex == sex, "Length"], na.rm = TRUE), lty = 2, lwd = 3, col = 1)
}
for(sex in c("F", "M")){
	find = which(!is.na(out$Age) & out$Sex == sex)
	hist(out[find, "Length"], , xlim = c(0, 60), xlab = "Length (cm)", 
		col = ifelse(sex == "F", alpha('red', 0.65), alpha('blue', 0.5)), main = paste0("Aged Fish Lengths: ", sex))
	abline(v = median(out[find, "Length"], na.rm = TRUE), lty = 2, lwd = 3, col = 1)
}
dev.off()

############################################################################################
# Look at lengths by areas
# The estimated length-at-age parameters are fairly different for other studies looking
# at California fish.  What do the CA lengths look like relative to OR and WA?
############################################################################################
check = aggregate(Length~State_Areas + Sex, data = out, FUN = function(x) quantile(x, 0.99, na.rm = TRUE))
check[sort(check$State_Areas, index.return = TRUE)$ix, ]
#     State_Areas Sex   Length
# north_pt_concep   F 52.83200
# north_pt_concep   M 52.00000
# north_pt_concep   U 52.00000
#              OR   F 54.00000
#              OR   M 54.00000
#              OR   U 54.00000
# south_pt_concep   F 49.00000
# south_pt_concep   M 48.00000
# south_pt_concep   U 48.20000
#              WA   F 52.00000
#              WA   M 51.00000
#              WA   U 53.00000

data_hist(dir = file.path(dir, "data", "biology", "plots"), 
		  data = out, 
		  data_type = "Length", 
		  group_column = "State_Areas", 
	 	  fleet_column = "Fleet", 
	 	  ymax = c(0.15, 0.15, 0.10, 0.15), 
	 	  do_abline = TRUE)

##################################################################################
# Plot fecundity at length from Dick et al 2017
#################################################################################

len = 0:60
fecund = 3.36181e-7 * len ^ 3.679

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "Fecundity.png", w = 7, h = 7, pt = 12)
par(mfrow = c(1, 1), oma = c(0, 3, 0, 0))
plot(len, fecund,  xlab = "Length (cm)",
	ylab = "", type = 'l', col = 'red', lwd = 2, las = 1,
	cex.axis = 1.5, cex.lab = 1.5, cex = 1.5, xaxs = 'i', yaxs = 'i')
mtext(side = 2, "Fecundity (millions of eggs)", line = 4, cex = 1.5)
legend('topleft', legend = "Dick et al. 2017", bty = 'n', cex = 1.5)
dev.off()

############################################################################################
# Create a combined length-weight-plot with the Love estimates added
############################################################################################
data = survey_dat
ests = est_growth
lens = 1:max(data$Length, na.rm = TRUE)
ymax = max(data$Weight, na.rm = TRUE)
xmax = max(data$Length, na.rm = TRUE)

line_col = c("red", 'blue', "grey")
sex_col = c(alpha(line_col[1:2], 0.2), alpha(line_col[3], 0.20))

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "Length_Weight_All_w_Lea_Ests.png", w = 7, h = 7, pt = 12)
par(mfrow = c(1, 1) )
plot(data[data$Sex == 'U', "Length"], data[data$Sex == 'U', "Weight"], las = 1,
	cex.lab = 1.5, cex.axis = 1.5, cex = 1.5,
     xlab = "Length (cm)", ylab = "Weight (kg)", main = "", 
     ylim = c(0, ymax), xlim = c(0, xmax), pch = 16, col = sex_col[3]) 
points(data[data$Sex == 'F', "Length"], data[data$Sex == 'F', "Weight"], pch = 16, col = sex_col[1])
points(data[data$Sex == 'M', "Length"], data[data$Sex == 'M', "Weight"], pch = 16, col = sex_col[2])
lines(lens, ests[paste0("all_F")][[1]][1] * lens ^ ests[paste0("all_F")][[1]][2], col = line_col[1], lwd = 3, lty = 1)
lines(lens, ests[paste0("all_M")][[1]][1] * lens ^ ests[paste0("all_M")][[1]][2], col = line_col[2], lwd = 3, lty = 1)
lines(lens, 1.09e-5 * lens ^ 3.1, col = line_col[1], lty = 2, lwd = 3)
lines(lens, 2.10e-5 * lens ^ 2.98, col = line_col[2], lty = 2, lwd = 3)
#lines(lens, 2.99e-5 * lens ^ 2.92, col = line_col[1], lty = 2, lwd = 3)
#lines(lens, 4.6e-5 * lens ^ 2.84, col = line_col[2], lty = 2, lwd = 3)
leg = c(paste0("F: a = ", signif(ests[paste0("all_F")][[1]][1], digits = 3),  
								" b = ", round(ests[paste0("all_F")][[1]][2], 2) ), 
		paste0("M: a = ", signif(ests[paste0("all_M")][[1]][1], digits = 3),  
								" b = ", round(ests[paste0("all_M")][[1]][2], 2) ),
		"F: a = 1.09e-5, b = 3.18 (Lea 1999)",
		"M: a = 2.10e-05, b = 2.98 (Lea 1999)")
legend("topleft", bty = 'n', legend = leg, lty = c(1, 1, 2, 2), col = rep(c(line_col[1], line_col[2]), 2), lwd = 3, cex = 1.25)
dev.off()


data = survey_dat
ests = est_growth
lens = 1:max(data$Length, na.rm = TRUE)
ymax = max(data$Weight, na.rm = TRUE)
xmax = max(data$Length, na.rm = TRUE)
line_col = c("red", 'blue')
sex_col = c(alpha(line_col[1:2], 0.2), alpha(line_col[3], 0.20))

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "doc_Length_Weight_Sex.png", w = 7, h = 7, pt = 12)
par(mfrow = c(1, 1) )
plot(data[data$Sex == 'F', "Length"], data[data$Sex == 'F', "Weight"], las = 1,
	cex.lab = 1.5, cex.axis = 1.5, cex = 1.5,
     xlab = "Length (cm)", ylab = "Weight (kg)", main = "", 
     ylim = c(0, ymax), xlim = c(0, xmax), pch = 16, col = sex_col[1]) 
points(data[data$Sex == 'M', "Length"], data[data$Sex == 'M', "Weight"], pch = 16, cex = 1.5, col = sex_col[2])
lines(lens, ests[paste0("all_F")][[1]][1] * lens ^ ests[paste0("all_F")][[1]][2], col = line_col[1], lwd = 3, lty = 1)
lines(lens, ests[paste0("all_M")][[1]][1] * lens ^ ests[paste0("all_M")][[1]][2], col = line_col[2], lwd = 3, lty = 1)
leg = c(paste0("F: a = ", signif(ests[paste0("all_F")][[1]][1], digits = 3),  
								" b = ", round(ests[paste0("all_F")][[1]][2], 2) ), 
		paste0("M: a = ", signif(ests[paste0("all_M")][[1]][1], digits = 3),  
								" b = ", round(ests[paste0("all_M")][[1]][2], 2) ))
legend("topleft", bty = 'n', legend = leg, lty = c(1, 1), col = rep(c(line_col[1], line_col[2]), 2), lwd = 3, cex = 1.25)
dev.off()

sex_col = c(alpha(c('purple', 'green'), 0.2))
pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "doc_Length_Weight_Source.png", w = 7, h = 7, pt = 12)
par(mfrow = c(1, 1) )
plot(data[data$Source == 'NWFSC_HKL', "Length"], data[data$Source == 'NWFSC_HKL', "Weight"], las = 1,
	cex.lab = 1.5, cex.axis = 1.5, cex = 1.5,
     xlab = "Length (cm)", ylab = "Weight (kg)", main = "", 
     ylim = c(0, ymax), xlim = c(0, xmax), pch = 16, col = sex_col[1]) 
points(data[data$Source == 'NWFSC_WCGBTS', "Length"], 
	   data[data$Source == 'NWFSC_WCGBTS', "Weight"], pch = 16, cex = 1.5, col = sex_col[2])
legend("topleft", bty = 'n', legend = c("NWFSC HKL", "NWFSC WCGBTS"), 
	   pch = 16, col = alpha(sex_col,0.6),  cex = 1.25)
dev.off()

