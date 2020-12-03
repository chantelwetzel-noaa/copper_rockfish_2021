##################################################################################################
#
#	PacFIN Data Exploration for Copper Rockfish
# 		
#		Written by Chantel Wetzel
#
##################################################################################################

devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/PacFIN.Utilities")
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/HandyCode")
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/dataModerate_2021")
library(ggplot2)
options(stringsAsFactors = TRUE)


dir = "N://Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/"
setwd(dir)

load(file.path(getwd(), "commercial_comps", "PacFIN.COPP.bds.13.Aug.2020.RData"))
#load(file.path(getwd(), "commercial_comps", "PacFIN.COPP.bds.16.Oct.2020.RData"))
#pacfin = out
# Hand remove puget sound records - this needs to be added to the cleanPacFIN function
#remove = which(pacfin$PSMFC_CATCH_AREA_CODE %in% c("4A", "_PS"))
#pacfin = pacfin[-remove, ]
#pacfin_convert = cleanColumns(data = pacfin, use = 'vdrfd')
## Add some required columns for cleanPacFIN function
#pacfin_convert$INPFC_AREA = 'all'
#

pacfin = PacFIN.COPP.bds.13.Aug.2020

# Load in the current weight-at-length estimates by sex
femalea = 9.56e-6; femaleb = 3.19 
malea   = 1.08e-5; maleb = 3.15    
unsexa  = (femalea + malea)/2;  unsexb = (femaleb + maleb)/2        

catch.file = read.csv(file.path(getwd(), "catches", "commercial_catch_by_state.csv"))
colnames(catch.file) = c("Year", "SOUTH.ALL", "NORTH.ALL", "OR.ALL", "WA.ALL")

# Add default age data column in order to make code work 
# Must remove once data are re-pulled!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
pacfin$FISH_AGE_YEARS_FINAL = NA

table(pacfin$FISH_LENGTH_TYPE)

# May want to evaluat the data by state and the sample quality code to identify special projects data
table(pacfin$SOURCE_AGID, pacfin$SAMPLE_QUALITY)
table(pacfin$SAMPLE_TYPE,pacfin$SOURCE_AGID)

Pdata = cleanPacFIN(Pdata = pacfin, 
					keep_length_type = c("", "A", "F", "U", "T", NA),
					keep_missing_lengths = FALSE,
					keep_INPFC = c("VUS","CL","VN","COL","NC","SC","EU","CP","EK","MT","PS"))

#  Removal Report
#  
#  Records in input:                  8798 
#  Records not in USINPFC             0 
#  Records not in INPFC_AREA:         351 
#  Records in bad INPFC_AREA:         0 
#  Records in badRecords list:        0 
#  Records with bad SAMPLE_TYPE       0 
#  Records with bad SAMPLE_METHOD     0 
#  Records with no SAMPLE_NO          0 
#  Records with no usable length      225 
#  Records remaining:                 8222 


############################################################################################################
# Create areas based on areas being modeled
##########################################################################################################

south_ca = c("DNA","HNM","LGB","NWB","OBV","OLA","OSD","OXN","SB","SD","SP","TRM","VEN","WLM")
or = c("AST","BDN","BRK","DPO","FLR","GLD","NEW","ORF","PCC","SRV","TLL","WIN","COS")
north_ca = c("ALB","ALM","ARE","AVL", "BCR","BDG","BKL","BOL","BRG","CRS","CRZ","ERK",
			 "FLN","MNT","MOS","MRO","OAK","OCA","OCM","OCN","ODN","OHB","OMD","OSF","OSL","OSM","OWC","PRN","RCH","RYS","SF","SLT","TML","TRN")
wa = unique(Pdata$PCID)[!(unique(Pdata$PCID)) %in% c(south_ca, north_ca, or)]

area_grouping = list(south_ca, north_ca, or, wa)
area_names = c("SOUTH", "NORTH", "OR", "WA")
Pdata$state_areas <- NA
for (a in 1:length(area_grouping)){
	get <- paste(area_grouping[[a]], collapse = "|")
	find = grep(get, Pdata$PCID, ignore.case = TRUE)
	Pdata$state_areas[find] = area_names[a]
}


############################################################################################################
# Investigate data and create needed columns
##########################################################################################################
aggregate(lengthcm~state_areas, data = Pdata, FUN = quantile)
# state_areas lengthcm.0% lengthcm.25% lengthcm.50% lengthcm.75% lengthcm.100%
#       NORTH        18.0         32.0         38.0         44.0          61.0
#          OR        26.0         38.0         43.0         47.0          60.0
#       SOUTH        19.0         33.0         36.0         40.0          54.0
#          WA        37.0         41.5         44.0         49.5          55.0


MasterPdata = Pdata

Pdata$fleet = "ALL"

Pdata$stratification = paste(Pdata$state_areas, Pdata$fleet, sep=".")

#################################################################################
# Length comp expansions
#################################################################################

# There is one Oregon record where the number of sexes sampled do not add up - 3 fish total
remove = which(Pdata$SAMPLE_NO == "OR1867882") 
Pdata = Pdata[-remove, ]

Pdata =  getExpansion_1(Pdata = Pdata, 
						maxExp = 0.95,
						Exp_WA = TRUE, 
						Indiv_Wgts = TRUE,
						plot = FALSE,
						fa = femalea, fb = femaleb, ma = malea, mb = maleb, ua = unsexa, ub = unsexb)


# The convert input will change the catch from external file into pounds
Pdata = getExpansion_2(Pdata = Pdata, 
					   Catch = catch.file, 
					   Units = "MT",
					   maxExp = 0.80)

Pdata$Final_Sample_Size <- capValues(Pdata$Expansion_Factor_1_L * Pdata$Expansion_Factor_2, maxVal = 0.80)

# Look for consistency between lengths and ages of sampled fish
myLbins = c(seq(10, 54, 2))

Lcomps = getComps(Pdata, defaults = c("fishyr", "fleet", "stratification"), Comps = "LEN")

masterLcomps = Lcomps

Lcomps = doSexRatio(Lcomps, findRatio = TRUE)

writeComps(inComps = Lcomps, 
		   fname = file.path(getwd(), "commercial_comps", "forSS", "Lcomps.COPP.Nov.2020.csv"), 
		   lbins = myLbins, 
		   partition = 0, 
		   sum1 = TRUE,
		   digits = 4)

##############################################################################################################
# Format and rewrite
##############################################################################################################

# The available sex by state really vary:
#           F    M    U
#  NORTH   57   69 4200
#  OR     653  619    4
#  SOUTH    2    7 2602
#  WA       2    4    0

#########################################################################################
# For California North & South use the sexes combined in the model
#########################################################################################
out = read.csv(file.path(getwd(), "commercial_comps", "forSS", "Lcomps.COPP.Nov.2020.csv"), skip = 3, header = TRUE)
start = which(as.character(out[,1]) %in% c(" Sexes combined ")) + 2
end   = which(as.character(out[,1]) %in% c(" Females then males ")) -1 #nrow(out)
cut_out = out[start:end,]

cut_out$fleetnum = 1
cut_out$month = 1

ind = which(colnames(cut_out) %in% "L10"):which(colnames(cut_out) %in% "L54.1")
format = cbind(cut_out$stratification, cut_out$fishyr, cut_out$month, cut_out$fleetnum, cut_out$sex, cut_out$partition, 
			   cut_out$Ntows, cut_out$Nsamps, cut_out$InputN, cut_out[,ind])
colnames(format) = c("strat", "fishyr", "month", "fleet", "sex", "part", "Ntows", "Nsamps", "InputN", colnames(cut_out[ind]))
format = format[format$fishyr != 2021, ]

south_comps = format[format$strat == "SOUTH.ALL", -1]
north_comps = format[format$strat == "NORTH.ALL", -1]
write.csv(south_comps, file = paste0(getwd(), "/commercial_comps/forSS/S_CA_Lcomps_unsexed_10_54_formatted.csv"), row.names = FALSE)
write.csv(north_comps, file = paste0(getwd(), "/commercial_comps/forSS/N_CA_Lcomps_unsexed_10_54_formatted.csv"), row.names = FALSE)

#########################################################################################
# Grabbed the females then males for Oregon & Washington
#########################################################################################
out = read.csv(file.path(getwd(), "commercial_comps", "forSS", "Lcomps.COPP.Nov.2020.csv"), skip = 3, header = TRUE)
start   = which(as.character(out[,1]) %in% c(" Females then males ")) + 2 
end = nrow(out)
cut_out = out[start:end,]

# format the california unsexed length comps
cut_out$fleetnum = 1
cut_out$month = 1

ind = which(colnames(cut_out) %in% "L10"):which(colnames(cut_out) %in% "L54.1")
format = cbind(cut_out$stratification, cut_out$fishyr, cut_out$month, cut_out$fleetnum, cut_out$sex, cut_out$partition, 
			   cut_out$Ntows, cut_out$Nsamps, cut_out$InputN, cut_out[,ind])
colnames(format) = c("strat", "fishyr", "month", "fleet", "sex", "part", "Ntows", "Nsamps", "InputN", colnames(cut_out[ind]))
format = format[format$fishyr != 2021, ]

or = format[format$strat == "OR.ALL", -1]
wa = format[format$strat == "WA.ALL", -1]
write.csv(or, file = paste0(getwd(), "/commercial_comps/forSS/OR_Lcomps_sexed_10_54_formatted.csv"), row.names = FALSE)
write.csv(wa, file = paste0(getwd(), "/commercial_comps/forSS/WA_Lcomps_sexed_10_54_formatted.csv"), row.names = FALSE)


#########################################################################################
# Calculate the number of trips and fish
#########################################################################################

temp = Pdata[!is.na(Pdata$lengthcm) & Pdata$SAMPLE_YEAR < 2021,]

Nfish = table(temp$SAMPLE_YEAR, temp$SEX, temp$stratification)

aa = unique(temp$stratification)
yy = sort(unique(temp$SAMPLE_YEAR))
Ntows = matrix(0, length(yy), length(aa))
for(y in 1:length(yy)){
	for(a in 1:length(aa)){
		ind = which(temp$SAMPLE_YEAR == yy[y] & temp$stratification == aa[a])
		if(length(ind) > 0) {Ntows[y, a] = length(unique(temp$SAMPLE_NO[ind])) }
	}
}
colnames(Ntows) = aa
rownames(Ntows) = yy

keep = Ntows[,"WA.ALL"] != 0
wa_samps = cbind(rownames(Ntows)[keep], Ntows[keep,"WA.ALL"], Nfish[keep,,"WA.ALL"])
keep = Ntows[,"OR.ALL"] != 0
or_samps = cbind(rownames(Ntows)[keep], Ntows[keep,"OR.ALL"], Nfish[keep,,"OR.ALL"])
keep = Ntows[,"NORTH.ALL"] != 0
north_ca_samps = cbind(rownames(Ntows)[keep], Ntows[keep,"NORTH.ALL"], Nfish[keep,,"NORTH.ALL"])
keep = Ntows[,"SOUTH.ALL"] != 0
south_ca_samps = cbind(rownames(Ntows)[keep], Ntows[keep,"SOUTH.ALL"], Nfish[keep,,"SOUTH.ALL"])

colnames(wa_samps) = colnames(or_samps) = colnames(north_ca_samps) = colnames(south_ca_samps) = 
	c("Year", "N_Trips", "N_Fish_Females", "N_Fish_Males", "N_Fish_Unsexed")


write.csv(wa_samps, file = paste0(getwd(), "/commercial_comps/forSS/WA_Samples.csv"), row.names = FALSE)
write.csv(or_samps, file = paste0(getwd(), "/commercial_comps/forSS/OR_Samples.csv"), row.names = FALSE)
write.csv(north_ca_samps, file = paste0(getwd(), "/commercial_comps/forSS/CA_N_Samples.csv"), row.names = FALSE)
write.csv(south_ca_samps, file = paste0(getwd(), "/commercial_comps/forSS/CA_S_Samples.csv"), row.names = FALSE)

