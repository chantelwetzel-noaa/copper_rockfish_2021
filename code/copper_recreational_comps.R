############################################################################################
#	  Recreational data-processing for copper rockfish
#
#		          		September, 2020
#
#           			 Chantel Wetzel
############################################################################################

devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/nwfscSurvey")
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/PacFIN.Utilities")
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/dataModerate_2021")

library(ggplot2)

dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish"

len_bin = seq(10, 54, 2)


############################################################################################
#	Load Data
############################################################################################

# California Recreational
#ca_recfin = read.csv(file.path(dir, "data", "recreational_comps", "ca_rec_lengths_2004_2020_updated.csv"))
ca_recfin = read.csv(file.path(dir, "data", "recreational_comps", "ca", "Copper Revised CRFS Lengths No Region SD501-CALIFORNIA-1980-2020.csv"))
ca_recfin =	ca_recfin[ca_recfin$AGENCY_WATER_AREA_NAME != "MEXICO (AREAB AND P1B IMPORT, CPFV)", ]
ca_recfin = rename_budrick_recfin(data = ca_recfin)
ca_recfin_data = rename_recfin(data = ca_recfin,
					      area_grouping = list(c("CHANNEL", "SOUTH"), c("BAY AREA", "WINE", "CENTRAL", "REDWOOD", "NOT KNOWN")),
					      area_names = c("south_pt_concep", "north_pt_concep"),
					      area_column_name = "RECFIN_PORT_NAME",
					      mode_grouping = list(c("BEACH/BANK", "MAN-MADE/JETTY"), c("PARTY/CHARTER BOATS", "PRIVATE/RENTAL BOATS"), "NOT KNOWN"),
					      mode_names = c("rec_shore", "rec_boat", "rec_unknown"),
					      mode_column_name = "RECFIN_MODE_NAME" )
ca_recfin_data$Source = "RecFIN_MRFSS"

find = which(ca_recfin_data$RECFIN_MODE_NAME %in% c("PARTY/CHARTER BOATS", "PRIVATE/RENTAL BOATS") )
tmp = ca_recfin_data[find,]
north = which(tmp$State_Areas == "north_pt_concep")
ggplot(tmp[north, ], aes(Length, fill = RECFIN_MODE_NAME, color = RECFIN_MODE_NAME)) +
  facet_wrap(facets = "Year") +
  ylim(0, 0.25)+
  geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5)
ggplot(tmp[-north, ], aes(Length, fill = RECFIN_MODE_NAME, color = RECFIN_MODE_NAME)) +
  facet_wrap(facets = "Year") +
  ylim(0, 0.25)+
  geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5)


#ca_mrfss = read.csv(file.path(dir, "data", "recreational_comps", "ca_mrfss_bio_1980_2003.csv"))
#old_ca_mrfss = ca_mrfss[ca_mrfss$ST == 6 & ca_mrfss$SP_CODE == 8826010108, ]
ca_mrfss = read.csv(file.path(dir, 'data','recreational_comps', 'ca',  'ca_type3.csv'))
ca_mrfss = ca_mrfss[ca_mrfss$ST == 6 & ca_mrfss$SP_CODE == 8826010108, ]
ca_mrfss = ca_mrfss[!is.na(ca_mrfss$CNTY), ] # remove records without a county
ca_mrfss = ca_mrfss[ca_mrfss$YEAR != 2004, ] # overlap with crfss in 2004
ca_mrfss$STATE_NAME = "CA"
spc = c(37, 59, 73, 37, 111, 83) # 79 is San Luis Obispo which is north
npc = unique(ca_mrfss[!ca_mrfss$CNTY %in% spc, "CNTY"]) 

ca_mrfss_data = rename_mrfss(data = ca_mrfss,
							 len_col = "LNGTH",
							 area_grouping = list(spc, npc), 
							 area_names = c("south_pt_concep", "north_pt_concep"), 
							 area_column_name = "CNTY", 
							 mode_grouping = list(c(1,2), c(6, 7)),
					      	 mode_names = c("rec_shore", "rec_boat"),
					      	 mode_column_name = "MODE_FX" )

# for some reason CNTY 111 is not going to the south
find = which(ca_mrfss_data$CNTY == 111)
ca_mrfss_data[find,"State_Areas"] = "south_pt_concep"

find = which(ca_mrfss_data$MODE_FX %in% c(6,7) )
tmp = ca_mrfss_data[find,]
tmp$MODE_FX = as.factor(tmp$MODE_FX)
north = which(tmp$State_Areas == "north_pt_concep")

ggplot(tmp[north, ], aes(Length, fill = "MODE_FX", color = "MODE_FX")) +
  facet_wrap(facets = "MODE_FX") +
  ylim(0, 0.25)+
  geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5)
ggplot(tmp[-north, ], aes(Length, fill = MODE_FX, color = MODE_FX)) +
  facet_wrap(facets = "MODE_FX") +
  ylim(0, 0.25)+
  geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5)


# Oregon Recreational
or_mrfss = read.csv(file.path(dir, "data", "recreational_comps", "Oregon", "copper_mrfss_bio_1980_2003.csv"))
or_mrfss$STATE_NAME = "OR"
# Ali recommends using fork length (Length column) rather than total length
# The difference between the computed and measured lengths is small < +- 0.5 which should keep lengths in the same bins
# table(or_mrfss$Length_Flag, or_mrfss$Total.Length_Flag)
or_mrfss_data = rename_mrfss(data = or_mrfss,
							 len_col = "Length",
							 area_grouping = list(421), 
							 area_names = c("OR"),
							 area_column_name = "ORBS_SPP_Code", # This is essentially a cheat
							 mode_grouping = list(c(1,2), c(6, 7)),
					      	 mode_names = c("rec_shore", "rec_boat"),
					      	 mode_column_name = "MRFSS_MODE_FX" )

or_recfin_len = read.csv(file.path(dir, "data", "recreational_comps", "oregon", "copper_recfin_bio_lw_2001_2020.csv"), skip = 22)
# Ali recommends using fork length rather than total length
# remove the fish lengths that were sampled for age as well
# or_recfin_len = or_recfin_len[or_recfin_len$Source.Code %in% c("BIO", "CPFV"), ]
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
wa_recfin = read.csv(file.path(dir, "data", "recreational_comps",  "wa_rec_bds_copper_final.csv"))
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

############################################################################################
# Put all the data into one list
############################################################################################
input = list()
input[[1]] = ca_recfin_data
input[[2]] = ca_mrfss_data
input[[3]] = or_mrfss_data
input[[4]] = or_recfin_len_data
input[[5]] = wa_recfin_data


############################################################################################
#	Create data frame with all the input data
############################################################################################
out = create_data_frame(data_list = input)


############################################################################################
# Clean up the data
############################################################################################
# Now lets do a check length check to filter out any anomolysis lengths
remove = which(out$Length > 65 | out$Length < 8)
#     Year Lat Lon State     State_Areas Areas Depth Sex  Length Weight Age Fleet Data_Type       Source Lhat_pred Lhat_low Lhat_high
# 2017  NA  NA    CA north_pt_concep  <NA>    NA   U 66.8000      -  NA  boat  RETAINED       RecFIN        NA       NA        NA
# 2008  NA  NA    CA north_pt_concep  <NA>    NA   U  4.2000   2.34  NA  boat  RETAINED       RecFIN        NA       NA        NA
# 1998  NA  NA    CA south_pt_concep  <NA>    NA   U  0.2649   <NA>  NA  boat      <NA> RecFIN_MRFSS        NA       NA        NA
# 1985  NA  NA    CA south_pt_concep  <NA>    NA   U 80.2000    9.5  NA  boat      <NA> RecFIN_MRFSS        NA       NA        NA
# 2012  NA  NA    OR              OR  <NA>    NA   U 66.8000   3.10  NA  boat  RETAINED       RecFIN        NA       NA        NA

# Looks good - let's remove those few lengths
out = out[-remove, ]

# Remove the released for the rest of the summaries for now:
released = out[which(out$Data_Type == "RELEASED"), ]

out = out[out$Data_Type %in% c("RETAINED", NA), ]



############################################################################################
#	Washington recreational length data
############################################################################################

wa = out[which(out$State == "WA"), ]
wa$Length_cm = wa$Length

# create a table of the samples available by year
wa$Trawl_id = 1:nrow(wa)
GetN.fn(dir = file.path(dir, "data", "recreational_comps"), dat = wa, type = "length", species = 'others')
n = read.csv(file.path(dir, "data", "recreational_comps", "forSS", "length_SampleSize.csv"))
n = n[,c('Year', 'All_Fish', 'Sexed_Fish', 'Unsexed_Fish')]
write.csv(n, file = file.path(dir, "data", "recreational_comps", "forSS", "wa_samples.csv"), row.names = FALSE)

GetN.fn(dir = file.path(dir, "data", "recreational_comps"), dat = wa, 
	type = "age", species = 'others')
n = read.csv(file.path(dir, "data", "recreational_comps", "forSS", "age_SampleSize.csv"))
n = n[,c('Year', 'All_Fish', 'Sexed_Fish', 'Unsexed_Fish')]
write.csv(n, file = file.path(dir, "data", "recreational_comps", "forSS", "wa_age_samples.csv"), row.names = FALSE)


lfs = UnexpandedLFs.fn(dir = file.path(dir, "data", "recreational_comps"), 
                       datL = wa, lgthBins = len_bin,
                       sex = 3,  partition = 0, fleet = 1, month = 1)
file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Survey_notExpanded_Length_comp_Sex_0_bin=10-54.csv"), 
			to= file.path(dir, "data", "recreational_comps", "forSS", "wa_rec_notExpanded_Length_comp_Sex_0_bin=10-54.csv")) 
file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Survey_notExpanded_Length_comp_Sex_3_bin=10-54.csv"), 
			to= file.path(dir, "data", "recreational_comps", "forSS", "wa_rec_notExpanded_Length_comp_Sex_3_bin=10-54.csv")) 

PlotFreqData.fn(dir = file.path(dir, "data", "recreational_comps"), 
    dat = lfs$comps_u, ylim=c(0, max(len_bin)), 
    main = "WA Recreational - Unsexed", yaxs="i", ylab="Length (cm)", dopng = TRUE)


PlotFreqData.fn(dir = file.path(dir, "data", "recreational_comps"), 
    dat = lfs$comps, ylim=c(0, max(len_bin)), 
    main = "WA Recreational - Sexed", yaxs="i", ylab="Length (cm)", dopng = TRUE)

age_bins = 1:50
afs = UnexpandedAFs.fn(dir = file.path(dir, "data", "recreational_comps"), 
                       datA = wa, ageBins = age_bins,
                       sex = 3,  partition = 0, fleet = 1, month = 1)
file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Survey_notExpanded_Age_comp_Sex_0_bin=1-50.csv"), 
			to= file.path(dir, "data", "recreational_comps", "forSS", "wa_rec_notExpanded_Age_comp_Sex_0_bin=1-50.csv")) 
file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Survey_notExpanded_Age_comp_Sex_3_bin=1-50.csv"), 
			to= file.path(dir, "data", "recreational_comps", "forSS", "wa_rec_notExpanded_Age_comp_Sex_3_bin=1-50.csv")) 



############################################################################################
#	Oregon recreational length data
############################################################################################

or = out[which(out$State == "OR"), ]
or$Length_cm = or$Length
or$Trawl_id = 1:nrow(or)

or$block = ifelse(or$Year < 2000, "1980.1999", "2000.2020")
ggplot(or, aes(Length_cm, fill = block, color = block)) +
	facet_wrap(facets = c("block")) +
	geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5)


# create a table of the samples available by year
GetN.fn(dir = file.path(dir, "data", "recreational_comps"), dat = or, type = "length", species = 'others')
n = read.csv(file.path(dir, "data", "recreational_comps", "forSS", "length_SampleSize.csv"))
n = n[,c('Year', 'All_Fish', 'Sexed_Fish', 'Unsexed_Fish')]
write.csv(n, file = file.path(dir, "data", "recreational_comps", "forSS", "or_samples.csv"), row.names = FALSE)

or_age = or_recfin_age_data
or_age$Trawl_id = or_age$SAMPLE_ID
or_age$Length_cm = or_age$Length
GetN.fn(dir = file.path(dir, "data", "recreational_comps"), dat = or_age, 
	type = "age", species = 'others')
n = read.csv(file.path(dir, "data", "recreational_comps", "forSS", "age_SampleSize.csv"))
n = n[,c('Year', 'All_Fish', 'Sexed_Fish', 'Unsexed_Fish')]
write.csv(n, file = file.path(dir, "data", "recreational_comps", "forSS", "or_age_samples.csv"), row.names = FALSE)


lfs = UnexpandedLFs.fn(dir = file.path(dir, "data", "recreational_comps"), 
                       datL = or, lgthBins = len_bin,
                       sex = 3, partition = 0, fleet = 2, month = 1)

file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Survey_notExpanded_Length_comp_Sex_3_bin=10-54.csv"), 
			to= file.path(dir, "data", "recreational_comps", "forSS", "or_rec_notExpanded_Length_comp_Sex_3_bin=10-54.csv")) 
file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Survey_notExpanded_Length_comp_Sex_0_bin=10-54.csv"), 
			to= file.path(dir, "data", "recreational_comps", "forSS", "or_rec_notExpanded_Length_comp_Sex_0_bin=10-54.csv")) 


PlotFreqData.fn(dir = file.path(dir, "data", "recreational_comps"), 
    dat = lfs$comps, ylim=c(0, max(len_bin)+4), 
    main = "OR Recreational - Sexed", yaxs="i", ylab="Length (cm)", dopng = TRUE)

PlotFreqData.fn(dir = file.path(dir, "data", "recreational_comps"), 
    dat = lfs$comps_u, ylim=c(0, max(len_bin)+4), 
    main = "OR Recreational - Unsexed", yaxs="i", ylab="Length (cm)", dopng = TRUE)


or_rel = released[which(released$State == "OR"), ]
or_rel$Length_cm = or_rel$Length
or_rel$Sex = "U"
lfs = UnexpandedLFs.fn(dir = file.path(dir, "data", "recreational_comps"), 
                       datL = or_rel, lgthBins = len_bin,
                       sex = 0, partition = 0, fleet = 2, month = 1)

file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Survey_notExpanded_Length_comp_Sex_0_bin=10-54.csv"), 
			to= file.path(dir, "data", "recreational_comps", "forSS", "released_or_rec_notExpanded_Length_comp_Sex_0_bin=10-54.csv")) 

afs = UnexpandedAFs.fn(dir = file.path(dir, "data", "recreational_comps"), 
                       datA = or_age, ageBins = age_bins,
                       sex = 3, partition = 0, fleet = 2, month = 1)

file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Survey_notExpanded_Age_comp_Sex_3_bin=1-50.csv"), 
			to= file.path(dir, "data", "recreational_comps", "forSS", "or_rec_notExpanded_Age_comp_Sex_3_bin=1-50.csv")) 
file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Survey_notExpanded_Age_comp_Sex_0_bin=1-50.csv"), 
			to= file.path(dir, "data", "recreational_comps", "forSS", "or_rec_notExpanded_Age_comp_Sex_0_bin=1-50.csv")) 




############################################################################################
#	North of Pt. Conception - California recreational length data
############################################################################################

nca = out[which(out$State_Areas == "north_pt_concep"), ]
nca$Length_cm = nca$Length

# create a table of the samples available by year
nca$Length_cm = nca$Length
nca$Trawl_id = 1:nrow(nca)
GetN.fn(dir = file.path(dir, "data", "recreational_comps"), dat = nca, type = "length", species = 'others')
n = read.csv(file.path(dir, "data", "recreational_comps", "forSS", "length_SampleSize.csv"))
n = n[,c('Year', 'All_Fish', 'Sexed_Fish', 'Unsexed_Fish')]
write.csv(n, file = file.path(dir, "data", "recreational_comps", "forSS", "n_ca_rec_len_samples_may2021.csv"), row.names = FALSE)


# There are only 10 fish sexed - change them to unsexed
nca$Sex = "U"

lfs = UnexpandedLFs.fn(dir = file.path(dir, "data", "recreational_comps"), 
                       datL = nca, lgthBins = len_bin,
                       sex = 0, partition = 0, fleet = 2, month = 1)

file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Survey_notExpanded_Length_comp_Sex_0_bin=10-54.csv"), 
			to= file.path(dir, "data", "recreational_comps", "forSS", "nca_rec_notExpanded_Length_comp_Sex_0_bin=10-54_may2021.csv")) 

PlotFreqData.fn(dir = file.path(dir, "data", "recreational_comps"), 
    dat = lfs$comps, ylim=c(0, max(len_bin) + 4), 
    main = "CA N. Pt. Conception Recreational - Unsexed", yaxs="i", ylab="Length (cm)", dopng = TRUE)


rel = released[which(released$State_Area == "north_pt_concep"), ]
rel$Length_cm = rel$Length
rel$Sex = "U"
lfs = UnexpandedLFs.fn(dir = file.path(dir, "data", "recreational_comps"), 
                       datL = rel, lgthBins = len_bin,
                       sex = 0, partition = 0, fleet = 2, month = 1)

file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Survey_notExpanded_Length_comp_Sex_0_bin=10-54.csv"), 
			to= file.path(dir, "data", "recreational_comps", "forSS", "released_nca_rec_notExpanded_Length_comp_Sex_0_bin=10-54_mar2021.csv")) 

############################################################################################
#	South of Pt. Conception - California recreational length data
############################################################################################

sca = out[which(out$State_Areas == "south_pt_concep"), ]
sca$Length_cm = sca$Length

# create a table of the samples available by year
sca$Length_cm = sca$Length
sca$Trawl_id = 1:nrow(sca)
GetN.fn(dir = file.path(dir, "data", "recreational_comps"), dat = sca, type = "length", species = 'others')
n = read.csv(file.path(dir, "data", "recreational_comps", "forSS", "length_SampleSize.csv"))
n = n[,c('Year', 'All_Fish', 'Sexed_Fish', 'Unsexed_Fish')]
write.csv(n, file = file.path(dir, "data", "recreational_comps", "forSS", "s_ca_rec_len_samples_may2021.csv"), row.names = FALSE)


# There are only 2 fish sexed - change them to unsexed
sca$Sex = "U"


lfs = UnexpandedLFs.fn(dir = file.path(dir, "data", "recreational_comps"), 
                       datL = sca, lgthBins = len_bin,
                       sex = 0, partition = 0, fleet = 2, month = 1)

file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Survey_notExpanded_Length_comp_Sex_0_bin=10-54.csv"), 
			to= file.path(dir, "data", "recreational_comps", "forSS", "sca_rec_notExpanded_Length_comp_Sex_0_bin=10-54_may2021.csv")) 

PlotFreqData.fn(dir = file.path(dir, "data", "recreational_comps"), 
    dat = lfs$comps, ylim=c(0, max(len_bin) + 4), 
    main = "CA S. Pt. Conception Recreational - Unsexed", yaxs="i", ylab="Length (cm)", dopng = TRUE)

rel = released[which(released$State_Area == "south_pt_concep"), ]
rel$Length_cm = rel$Length
rel$Sex = "U"
lfs = UnexpandedLFs.fn(dir = file.path(dir, "data", "recreational_comps"), 
                       datL = rel, lgthBins = len_bin,
                       sex = 0, partition = 0, fleet = 2, month = 1)

file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Survey_notExpanded_Length_comp_Sex_0_bin=10-54.csv"), 
			to= file.path(dir, "data", "recreational_comps", "forSS", "released_sca_rec_notExpanded_Length_comp_Sex_0_bin=10-54_mar2021.csv")) 


############################################################################################
# Additional California CPFV data
############################################################################################
ca_cpfv_1970 = read.csv(file.path(dir, "data", "recreational_comps", "ca", "copper_rockfish_qry_70slengthdata_sca_cpfv.csv"))
ca_cpfv_1980 = read.csv(file.path(dir, "data", "recreational_comps", "ca", "copper_rockfish_qry_80slengthdata_sca_cpfv.csv"))
nca_cpfv = read.csv(file.path(dir, "data", "recreational_comps", "ca", "copper_cpfv_ca_central_lengths.csv"))

# Combine the 1970s - 1980s data
sca_cpfv = rbind(ca_cpfv_1970[,c("Year", "Month", "Length", "County")], ca_cpfv_1980[,c("Year", "Month", "Length", "County")])
sca_cpfv$Length_cm = sca_cpfv$Length/10
sca_cpfv$Trawl_id = 1:nrow(sca_cpfv)
sca_cpfv$Sex = "U"
#GetN.fn(dir = file.path(dir, "data", "recreational_comps"), bds = sca_cpfv, species = 'others')

# Lets do the CA CPFV 1980 - 1990s separate
nca_cpfv$Length_cm = nca_cpfv$Total.Length / 10
nca_cpfv$Year = nca_cpfv$YEAR
nca_cpfv$Trawl_id = 1:nrow(nca_cpfv)
nca_cpfv$Sex = "U"
#GetN.fn(dir = file.path(dir, "data", "recreational_comps"), dat = nca, type = "length", species = 'others')
#n = read.csv(file.path(dir, "data", "recreational_comps", "forSS", "length_SampleSize.csv"))
#n = n[,c('Year', 'All_Fish', 'Sexed_Fish', 'Unsexed_Fish')]
#write.csv(n, file = file.path(dir, "data", "recreational_comps", "forSS", "n_ca_rec_len_samples_may2021.csv"), row.names = FALSE)

par(mfrow=c(2,2))
hist(ca_cpfv_1970$Length/10, xlim = c(10, 60))
hist(ca_cpfv_1980$Length/10, xlim = c(10, 60))
find = which(nca_cpfv$Year <= 1989)
hist(nca_cpfv$Length_cm[find], xlim = c(10, 60))
find = which(nca_cpfv$Year > 1989)
hist(nca_cpfv$Length_cm[find], xlim = c(10, 60))

aggregate(Length_cm~Year, sca_cpfv, mean)
aggregate(Length_cm~Year, nca_cpfv, mean)
aggregate(Length_cm~County, sca_cpfv, mean)
aggregate(Length_cm~COUNTY, nca_cpfv, mean)

ggplot(sca_cpfv, aes(Length_cm)) +
  facet_wrap(facets = "Year") +
  geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5)

ggplot(sca_cpfv, aes(Length_cm)) +
  facet_wrap(facets = "County") +
  geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5)

ggplot(sca_cpfv, aes(Length_cm, fill = County, color = County)) +
  facet_wrap(facets = "Year") +
  ylim(c(0, 0.3)) +
  geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5)

ggplot(nca_cpfv, aes(Length_cm)) +
  facet_wrap(facets = "Year") +
  geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5)

ggplot(nca_cpfv, aes(Length_cm)) +
  facet_wrap(facets = "COUNTY") +
  geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5)

ggplot(nca_cpfv, aes(Length_cm, fill = COUNTY, color = COUNTY)) +
  facet_wrap(facets = "Year") +
  ylim(c(0, 0.3)) +
  geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5)

lfs = UnexpandedLFs.fn(dir = file.path(dir, "data", "recreational_comps"), 
                       bds = sca_cpfv, lgthBins = len_bin,
                       sex = 0, partition = 0, fleet = 2, month = 1)

file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Length_notExpanded_Sex_0_bin=10-54.csv"), 
            to= file.path(dir, "data", "recreational_comps", "forSS", "sca_cpfv_Length_notExpanded_Sex_0_bin=10-54.csv")) 

PlotFreqData.fn(dir = file.path(dir, "data", "recreational_comps"), 
                dat = lfs$comps, ylim = c(0, max(len_bin) + 4), 
                main = "CA S. Pt. Conception Recreational - Unsexed (CPFV)", yaxs="i", ylab="Length (cm)", dopng = TRUE)

lfs = UnexpandedLFs.fn(dir = file.path(dir, "data", "recreational_comps"), 
                       bds = nca_cpfv, lgthBins = len_bin,
                       sex = 0, partition = 0, fleet = 2, month = 1)

file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Length_notExpanded_Sex_0_bin=10-54.csv"), 
            to= file.path(dir, "data", "recreational_comps", "forSS", "nca_cpfv_Length_notExpanded_Sex_0_bin=10-54.csv")) 

PlotFreqData.fn(dir = file.path(dir, "data", "recreational_comps"), 
                dat = lfs$comps, ylim = c(0, max(len_bin) + 4), 
                main = "CA N. Pt. Conception Recreational - Unsexed (CPFV)", yaxs="i", ylab="Length (cm)", dopng = TRUE)

#####################################################################
# Compare new data with the original data
#####################################################################
nca_cpfv$Length = nca_cpfv$Length_cm
nca_cpfv$Type = "New_Data"
out$Type = "Original_Data"
nca_all = rbind(nca_cpfv[, c("Year","Length", "Type")],out[out$State_Areas == "north_pt_concep", c("Year","Length", "Type")])
sca_cpfv$Length = sca_cpfv$Length_cm
sca_cpfv$Type = "New_Data"
sca_all = rbind(sca_cpfv[, c("Year","Length", "Type")],out[out$State_Areas == "south_pt_concep", c("Year","Length", "Type")])

wd = 'C:/Assessments/2021/copper_rockfish_2021/write_up/council_requests'
pngfun(wd = wd, file = 'north_data_compare.png', w = 12, h = 12)
ggplot(nca_all[nca_all$Year > 1986 & nca_all$Year < 1999,] , aes(Length, fill = Type, color = Type)) +
  facet_wrap(facets = "Year") +
  geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5)
dev.off()

pngfun(wd = wd, file = 'south_data_compare.png', w = 12, h = 12)
ggplot(sca_all[sca_all$Year < 1990,] , aes(Length, fill = Type, color = Type)) +
  facet_wrap(facets = "Year") +
  geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5)
dev.off()