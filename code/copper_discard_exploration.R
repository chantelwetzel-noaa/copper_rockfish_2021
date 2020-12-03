##############################################################################################################
#
# 	Purpose: Evaluate copper rockfish discarding
# 		by source, fishery, and across time.
#
#			  by Chantel Wetzel 
#
##############################################################################################################

library(HandyCode)
library(dplyr)
options(stringsAsFactors = FALSE)

dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/catches"

#-----------------------------------------------------------------------------------
# Load the GEMM - the GEMM includes information for commercial 
#-----------------------------------------------------------------------------------

# The gemm splits data north and south of 40 10
gemm_all = read.csv(file.path(dir, "GEMM_2019_8_15_2020.csv"))
gemm = gemm_all[gemm_all$Species == "Copper Rockfish", ]

aggregate(Landings ~ Sector, data = gemm, FUN = sum)
aggregate(Discards ~ Sector, data = gemm, FUN = sum)
aggregate(Discard.Mortality ~ Sector, data = gemm, FUN = sum)

gemm$grouped_sector = NA
gemm$grouped_sector[gemm$Sector == "Washington Recreational"] = "wa_rec"
gemm$grouped_sector[gemm$Sector == "California Recreational"] = "ca_rec"
gemm$grouped_sector[gemm$Sector == "Oregon Recreational"] = "or_rec"
gemm$grouped_sector[is.na(gemm$grouped_sector)] = "commercial"

landings  = aggregate(Landings ~ Year + grouped_sector, data = gemm, drop = FALSE, FUN = sum)
discards  = aggregate(Discards ~ Year + grouped_sector, data = gemm, drop = FALSE, FUN = sum)
disc_mort = aggregate(Discard.Mortality ~ Year + grouped_sector, data = gemm, drop = FALSE, FUN = sum)
all_dead  = aggregate(Mortality..Landings.and.Discard.Mortality. ~ Year + grouped_sector, data = gemm, drop = FALSE, FUN = sum)

all = data.frame(Year = landings$Year,
				 Area = landings$grouped_sector,
				 Landings = landings$Landings,
				 Discard = discards$Discards,
				 Dead_Discard = disc_mort$Discard.Mortality,
				 Tot_Dead = all_dead$Mortality..Landings.and.Discard.Mortality.)

all[is.na(all)] = 0

all$Discard_Mort_Rate = round(all[,"Dead_Discard"] / all[,"Tot_Dead"], 3)
all[is.na(all)] = 0

write.csv(all, file = file.path(dir, "gemm_mortality_and_discard.csv"))

#-----------------------------------------------------------------------------------
# Load the WCGOP discard totals 
# Kayleigh suggested:
# multiply by proportion of catch observed in an area compared to coastwide -- 
# not the proportion discarded in a given area. To do that, I suggest calculating the 
# proportion of observed catch (D+R) within each area (compared to coastwide) in each year. 
# So, for example, for 2018 it might be 5% of observed in WA, 10% observed in OR, 
# 40% observed N of Pt Conc, and 45% observed S of Pont Conc (adding up to 100% coastwide). 
# We could then multiply the total discard from the GEMM by each of those area proportions to
# estimate the discard in each area. We could also explore using the same method but with 
# only observed discard rather than observed discard AND retained together.
#-----------------------------------------------------------------------------------

ncs = read.csv(file.path(dir, "copper_OB_DisRatios_noboot_ncs_Area_2020-09-28.csv"))
cs = read.csv(file.path(dir,  "copper_OB_DisRatios_noboot_cs_Area_2020-09-28.csv"))

ret_ncs = aggregate(Observed_RETAINED.MTS ~ ryear + Lat, data = ncs, drop = FALSE,FUN = sum)
dis_ncs = aggregate(Observed_DISCARD.MTS ~ ryear + Lat, data = ncs, drop = FALSE,FUN = sum)
ret_cs  = aggregate(Observed_RETAINED.MTS ~ ryear + Lat, data = cs, drop = FALSE, FUN = sum)
dis_cs  = aggregate(Observed_DISCARD.MTS ~ ryear + Lat, data = cs, drop = FALSE,FUN = sum)

ret_ncs[is.na(ret_ncs)] = dis_ncs[is.na(dis_ncs)] = ret_cs[is.na(ret_cs)] = dis_cs[is.na(dis_cs)] = 0

tot_obs = data.frame(Year = 2002:2019,
					 ca_s = ret_ncs[which(ret_ncs$Lat == "CA_S"),3] + dis_ncs[which(dis_ncs$Lat == "CA_S"),3],
					 ca_n = ret_ncs[which(ret_ncs$Lat == "CA_N"),3] + dis_ncs[which(dis_ncs$Lat == "CA_N"),3],
					 or = ret_ncs[which(ret_ncs$Lat == "OR"),3] + dis_ncs[which(dis_ncs$Lat == "OR"),3],
					 wa = ret_ncs[which(ret_ncs$Lat == "WA"),3] + dis_ncs[which(dis_ncs$Lat == "WA"),3])

tot_obs[which(tot_obs$Year %in% ret_cs$ryear), "ca_n"] = tot_obs[which(tot_obs$Year %in% ret_cs$ryear), "ca_n"] +  
					ret_cs[which(ret_cs$Lat == "CA_N"), 3] + dis_cs[which(dis_cs$Lat == "CA_N"), 3]
tot_obs[which(tot_obs$Year %in% ret_cs$ryear), "wa"] = tot_obs[which(tot_obs$Year %in% ret_cs$ryear), "wa"] +  
					ret_cs[which(ret_cs$Lat == "WA"), 3] + dis_cs[which(dis_cs$Lat == "WA"), 3]	

ratio = cbind(tot_obs$Year, tot_obs[,-1] / apply(tot_obs[,-1], 1, sum))

all[which(all$Area == "commercial"), "Dead_Discard"]
dead = data.frame(Year = tot_obs$Year,
				  ca_s = ratio$ca_s * all[which(all$Area == "commercial"), "Dead_Discard"],
				  ca_n = ratio$ca_n * all[which(all$Area == "commercial"), "Dead_Discard"],
				  or = ratio$or * all[which(all$Area == "commercial"), "Dead_Discard"],
				  wa = ratio$wa * all[which(all$Area == "commercial"), "Dead_Discard"] ) 

write.csv(dead, file = file.path(dir, "copper_commercial_discard.csv"), row.names = FALSE)



#---------------------------------------------------------------------------------------------
# Squarespt rockfish in the GEMM data
#---------------------------------------------------------------------------------------------
dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/Squarespot_Rockfish/data/PacFIN Catch"
gemm = gemm_all[gemm_all$Species == "Squarespot Rockfish", ]

aggregate(Landings~Sector, data = gemm, FUN = sum)
aggregate(Discards~Sector, data = gemm, FUN = sum)
aggregate(Discard.Mortality~Sector, data = gemm, FUN = sum)

gemm$grouped_sector = NA
gemm$grouped_sector[gemm$Sector == "California Recreational"] = "ca_rec"
gemm$grouped_sector[is.na(gemm$grouped_sector)] = "commercial"

landings  = aggregate(Landings ~ Year + grouped_sector, data = gemm, drop = FALSE, FUN = sum)
discards  = aggregate(Discards ~ Year + grouped_sector, data = gemm, drop = FALSE, FUN = sum)
disc_mort = aggregate(Discard.Mortality ~ Year + grouped_sector, data = gemm, drop = FALSE, FUN = sum)
all_dead  = aggregate(Mortality..Landings.and.Discard.Mortality. ~ Year + grouped_sector, data = gemm, drop = FALSE, FUN = sum)

all = data.frame(Year = landings$Year,
				 Area = landings$grouped_sector,
				 Landings = landings$Landings,
				 Discard = discards$Discards,
				 Dead_Discard = disc_mort$Discard.Mortality,
				 Tot_Dead = all_dead$Mortality..Landings.and.Discard.Mortality.)

all[is.na(all)] = 0

all$Discard_Mort_Rate = round(all[,"Dead_Discard"] / all[,"Tot_Dead"], 3)
all[is.na(all)] = 0

write.csv(all, file = file.path(dir, "squarespot_gemm_mortality_and_discard.csv"))
