##################################################################################################
#
#	PacFIN Data Exploration for Copper Rockfish
# 		
#		Written by Chantel Wetzel
#
##################################################################################################

devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/PacFIN.Utilities")
#library(PacFIN.Utilities)
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/HandyCode")
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/dataModerate_2021")
library(ggplot2)
options(stringsAsFactors = TRUE)


dir = "N://Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/"
setwd(dir)

load(file.path(getwd(), "commercial_comps", "PacFIN.COPP.bds.21.Feb.2021.RData"))
pacfin = bds.pacfin
bds.file = "test_4kelli_PacFIN.COPP.bds.21.Feb.2021"


# Load in the current weight-at-length estimates by sex
fa = 9.56e-6; fb = 3.19 
ma = 1.08e-5; mb = 3.15    
ua = (fa + ma)/2;  ub = (fb + mb)/2        

catch.file = read.csv(file.path(getwd(), "catches", "commercial_catch_by_state.csv"))
catch.file = catch.file[,-1]
colnames(catch.file) = c("Year", "SOUTH.ALL", "NORTH.ALL", "OR.ALL", "WA.ALL")

pacfin$age1 <- NA
Pdata = cleanPacFIN(Pdata = pacfin, 
					CLEAN = TRUE,
					verbose = TRUE)

# The table below summarizes the number of records that are outside of
# the area that should be included for US West Coast stock assessments
# by PSMFC area, or some derivative thereof.
# [1] 351
# 
# N SAMPLE_TYPEs changed from M to S for special samples from OR: 0
# N not in keep_sample_type (SAMPLE_TYPE): 212
# N not in keep_sample_method (SAMPLE_METHOD): 0
# N with SAMPLE_NO of NA: 0
# N without length: 280
# N without age: 8946
# N without length and age: 8947
# N records: 9305
# N remaining if CLEAN: 8845
# N records will be removed if CLEAN: 460
# The following are not removed with CLEAN ...
# N sample weights not available for OR: 0
# N sample weights not available for CA: 7434

# Abandoned effort to inclued Oregon Special Samples provided directly from Ali
# or_sp <- read.csv(file.path(getwd(), "commercial_comps", "oregon_copper_special_samples.csv"))
# or_sp$FISH_LENGTH_TYPE <- or_sp$FISH_LENGTH_TYPE_CODE
# Pdata_sp = cleanPacFIN(Pdata = or_sp, 
# 					CLEAN = TRUE,
# 					verbose = TRUE)

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

#################################################################################
# Length comp expansions
#################################################################################

MasterPdata = Pdata
Pdata$fleet = Pdata$state_areas
Pdata$stratification = paste(Pdata$fleet, "ALL", sep=".")

Pdata_exp <- getExpansion_1(Pdata = Pdata,
					   fa = fa, fb = fb, ma = ma, mb = mb, ua = ua, ub = ub)

Pdata_exp <- getExpansion_2(Pdata = Pdata_exp, 
					   Catch = catch.file, 
					   Units = "MT",
					   maxExp = 0.80)

Pdata_exp$Final_Sample_Size <- capValues(Pdata_exp$Expansion_Factor_1_L * Pdata_exp$Expansion_Factor_2, maxVal = 0.80)
# Maximum expansion capped at 0.8 quantile: 77.3078 

# Look for consistency between lengths and ages of sampled fish
myLbins = c(seq(10, 54, 2))

# There are very few sexed fish in CA - set them all to unsexed for simplicity
# table(Pdata_exp$fleet, Pdata_exp$SEX)
#            F    M    U
#   SOUTH    2    7 2656
#   NORTH  107  104 4558
#   OR     714  687    4
#   WA       2    4    0

find = which(Pdata_exp$fleet %in% c("NORTH", "SOUTH"))
Pdata_exp[find, "SEX"] = "U"

Lcomps = getComps(Pdata_exp, 
				  Comps = "LEN")

writeComps(inComps = Lcomps, 
		   fname = file.path(getwd(), "commercial_comps", "forSS", paste0("Lcomps.", bds.file, ".csv")), 
		   lbins = myLbins, 
		   partition = 0, 
		   sum1 = TRUE,
		   digits = 4)

##############################################################################################################
# Format and rewrite
##############################################################################################################
#
# For California North & South use the sexes combined in the model
#########################################################################################
out = read.csv(file.path(getwd(), "commercial_comps", "forSS", paste0("Lcomps.", bds.file, ".csv")), skip = 3, header = TRUE)
start = which(as.character(out[,1]) %in% c(" Usexed only ")) + 2
end   = nrow(out)
cut_out = out[start:end,]

ind = which(colnames(cut_out) %in% "L10"):which(colnames(cut_out) %in% "L54.1")
format = cbind(cut_out$fishyr, cut_out$month, cut_out$fleet, cut_out$sex, cut_out$partition, 
			   cut_out$Ntows, cut_out$Nsamps, cut_out$InputN, cut_out[,ind])
colnames(format) = c("fishyr", "month", "fleet", "sex", "part", "Ntows", "Nsamps", "InputN", colnames(cut_out[ind]))
format = format[format$fishyr != 2021, ]

south_comps = format[format$fleet == "SOUTH", ]
north_comps = format[format$fleet == "NORTH", ]
write.csv(south_comps, file = paste0(getwd(), "/commercial_comps/forSS/S_CA_Lcomps_unsexed_10_54_formatted_Feb21_corrected.csv"), row.names = FALSE)
write.csv(north_comps, file = paste0(getwd(), "/commercial_comps/forSS/N_CA_Lcomps_unsexed_10_54_formatted_Feb21_corrected.csv"), row.names = FALSE)

#########################################################################################
# Grabbed the females then males for Oregon & Washington
#########################################################################################
out = read.csv(file.path(getwd(), "commercial_comps", "forSS", paste0("Lcomps.", bds.file, ".csv")), skip = 3, header = TRUE)
start = 1 #which(as.character(out[,1]) %in% c(" Females then males ")) + 2 
end = which(as.character(out[,1]) %in% c(" Females only ")) - 1 #nrow(out)
cut_out = out[start:end,]

ind = which(colnames(cut_out) %in% "L10"):which(colnames(cut_out) %in% "L54.1")
format = cbind(cut_out$fishyr, cut_out$month, cut_out$fleet, cut_out$sex, cut_out$partition, 
			   cut_out$Ntows, cut_out$Nsamps, cut_out$InputN, cut_out[,ind])
colnames(format) = c("fishyr", "month", "fleet", "sex", "part", "Ntows", "Nsamps", "InputN", colnames(cut_out[ind]))
format = format[format$fishyr != 2021, ]

or = format[format$fleet == "OR", ]
wa = format[format$fleet == "WA", ]
write.csv(or, file = paste0(getwd(), "/commercial_comps/forSS/OR_Lcomps_sexed_10_54_formatted_Feb21_corrected.csv"), row.names = FALSE)
write.csv(wa, file = paste0(getwd(), "/commercial_comps/forSS/WA_Lcomps_sexed_10_54_formatted_Feb21_corrected.csv"), row.names = FALSE)


#########################################################################################
# Calculate the number of trips and fish
#########################################################################################
Pdata = Pdata_exp
temp = Pdata[!is.na(Pdata$lengthcm) & Pdata$SAMPLE_YEAR < 2021,]

Nfish = table(temp$SAMPLE_YEAR, temp$SEX, temp$fleet)

aa = unique(temp$fleet)
yy = sort(unique(temp$SAMPLE_YEAR))
Ntows = matrix(0, length(yy), length(aa))
for(y in 1:length(yy)){
	for(a in 1:length(aa)){
		ind = which(temp$SAMPLE_YEAR == yy[y] & temp$fleet == aa[a])
		if(length(ind) > 0) {Ntows[y, a] = length(unique(temp$SAMPLE_NO[ind])) }
	}
}
colnames(Ntows) = aa
rownames(Ntows) = yy

keep = Ntows[,"WA"] != 0
wa_samps = cbind(rownames(Ntows)[keep], Ntows[keep,"WA"], Nfish[keep,,"WA"])
keep = Ntows[,"OR"] != 0
or_samps = cbind(rownames(Ntows)[keep], Ntows[keep,"OR"], Nfish[keep,,"OR"])
keep = Ntows[,"NORTH"] != 0
north_ca_samps = cbind(rownames(Ntows)[keep], Ntows[keep,"NORTH"], Nfish[keep,,"NORTH"])
keep = Ntows[,"SOUTH"] != 0
south_ca_samps = cbind(rownames(Ntows)[keep], Ntows[keep,"SOUTH"], Nfish[keep,,"SOUTH"])

colnames(wa_samps) = colnames(or_samps) = colnames(north_ca_samps) = colnames(south_ca_samps) = 
	c("Year", "N_Trips", "N_Fish_Females", "N_Fish_Males", "N_Fish_Unsexed")


write.csv(wa_samps, file = paste0(getwd(), "/commercial_comps/forSS/WA_Samples.csv"), row.names = FALSE)
write.csv(or_samps, file = paste0(getwd(), "/commercial_comps/forSS/OR_Samples.csv"), row.names = FALSE)
write.csv(north_ca_samps, file = paste0(getwd(), "/commercial_comps/forSS/CA_N_Samples.csv"), row.names = FALSE)
write.csv(south_ca_samps, file = paste0(getwd(), "/commercial_comps/forSS/CA_S_Samples.csv"), row.names = FALSE)

