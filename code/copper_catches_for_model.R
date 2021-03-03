##############################################################################################################
#
# 	Purpose: Process Copper Rockfish Landings
# 		into form for use in SS
#
#			  by Chantel Wetzel 
#
##############################################################################################################
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/PacFIN.Utilities")
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/dataModerate_2021")
library(HandyCode)
library(dplyr)
options(stringsAsFactors = FALSE)

dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/catches"
dir.create(file.path(dir, "plots"))

#-----------------------------------------------------------------------------------
# Load the Recreational Data
#-----------------------------------------------------------------------------------

# Based on Miller and Gotshall 1965 estimate
ca_rec_discard_rate = 1.003

# California - start to 1979, split north and south, split aligns with pt. concept.
ca_rec_hist = read.csv(paste0(dir, "/_ca/ca_hist_recreational_1928_1980_ej.csv"))

# California - has both mt and fish numbers (but the fish numbers have decimals)
ca_rec = read.csv(paste0(dir, "/_ca/ca_rec_catch_all_2005-2019_crfs.csv"))
ca_rec = ca_rec[ca_rec$Species.Name == "COPPER ROCKFISH", ]

# California - MRFSS years were 1980 - 1989 split wrong (need to move catches from south to north)
# 1980 should be replaced with historical reconstruction
# Missing 1990-1992 catches - need to linear interpolate
# 1993 - 2004 CRFS years which are split north and south correctly at pt. concep
ca_rec_early = read.csv(paste0(dir, "/_ca/mrfss_catch_estimates_1980_2004_final.csv"))
ca_rec_early = ca_rec_early[ca_rec_early$AGENCY_CODE == 6 & ca_rec_early$SPECIES_NAME == "Copper Rockfish", ]
ca_rec_early = ca_rec_early[ca_rec_early$YEAR_ != 1980, ]
# The column A+B1 should represent retained and discard mortality 


# Oregon
or_rec_disc_rate = 1.00 
# Ali - rockfish bag limits were 10 fish back to the late 90s and 15 prior to that going back to the late 1970s
or_rec = read.csv(paste0(dir, "/_or/or_copper_final_rec_landings_1979_2020.csv"))

# Washington - these files are in numbers of fish
wa_rec = read.csv(file.path(dir, "_wa", "wa_recreational_all_years.csv"))


#-----------------------------------------------------------------------------------
# Load the Commercial Data
#-----------------------------------------------------------------------------------

# PacFIN Commercial
#load(file.path(dir, "COPP.CompFT.17.Aug.2020.RData"))
load(file.path(dir, "COPP.CompFT.21.Feb.2021.RData"))
com = cleanColumns.catch(data)

# Oregon Historical Catches
or_all_ali = read.csv(file.path(dir, "/_or/or_copper_final_commercial_landings_1892_2020.csv"))

# Discard rate to apply to historical catches - calculated based on the average coastwide discarding
# from 2002 - 2018 in WCGOP, 2019 was ommitted since it increased due to reg changes.
com_disc_rate = 1.044

# California Historical Catches
ca_com_hist = read.csv(file.path(dir, "_ca", "ca_hist_commercial_1969_1980_ej.csv"))
ca_com_hist[is.na(ca_com_hist)] = 0
# Convert to mt from pounds
ca_com_hist$catch_mt_south = 0.000453592 * (ca_com_hist$OSB + ca_com_hist$OLA + ca_com_hist$OSD)
ca_com_hist$catch_mt_north = 0.000453592 * ca_com_hist$Grand.Total - ca_com_hist$catch_mt_south 

# Historical commercial not split north and south of pt. concep will need to adjust
ca_com_hist_early = read.csv(file.path(dir, "_ca", "ca_hist_commercial_1916_1968_ej.csv"))
# Fraction of fish by year from area 6 that need to be moved into the south area
ca_com_ratio = read.csv(file.path(dir, "_ca", "historical_landings_tables_2020_revised_Avila_1953.csv"))

# Washingtonhistorical commercial catches
wa_com = read.csv(file.path(dir, "_wa", "Coastal Commercial Rockfish_WithRelaxedBorrowingRules.csv"))
wa_com = wa_com[which(wa_com$SPID == "COPP"), ]

# Grab the WGCOP GEMM data
gemm = read.csv(file.path(dir, "copper_commercial_discard.csv"))

#################################################################################################################
# Evaluate the recreational data first
#################################################################################################################

# California - RecFIN years - These data area split north and south at pt. conception already
ca_rec$areas = recfin_areas(data = ca_rec, 
			  area_grouping = list(c("CHANNEL", "SOUTH"), c("BAY AREA", "WINE", "CENTRAL", "REDWOOD")), 
			  area_names  = c("south", "north"), 
			  column_name = "RecFIN.Port.Name")


# California - MRFSS years 
# The 1981-1989 "south" includes san louis obisbo and those catches need to be moved to the north area.
ca_rec_early$areas = recfin_areas(data = ca_rec_early, 
			  area_grouping = list("Northern California", "Southern California"), 
			  area_names  = c("north", "south"), 
			  column_name = "RECFIN_SUB_REGION_NAME")


# Cut down the data frame to a manageble size of key items
tmp = aggregate(WGT_AB1..mt. ~ YEAR_ + areas, data = ca_rec_early, drop = FALSE, FUN = sum)
colnames(tmp) = c("year", "areas", "orig_catch_mt")
# Move catches in the south to the north for 1980 - 1989: ratio of 0.317 based on Albin et al. 1993 
# See Allocate_MRFSS_1980-1989.xls to see how calculated:
n = which(tmp$year %in% c(1980:1989) & tmp$areas == "north")
s = which(tmp$year %in% c(1980:1989) & tmp$areas == "south")
tmp$catch_mt = NA
tmp$catch_mt[n] = tmp[n, "orig_catch_mt"] + tmp[s, "orig_catch_mt"] * 0.317
tmp$catch_mt[s] = tmp[s, "orig_catch_mt"] - tmp[s, "orig_catch_mt"] * 0.317
tmp$catch_mt[is.na(tmp$catch_mt)] = tmp$orig_catch_mt[is.na(tmp$catch_mt)]
# Need to linear interpolate the missing years 1990-1992
rn = (tmp[which(tmp$year %in% c(1993) & tmp$area == "north"), "catch_mt"] - tmp[which(tmp$year %in% c(1989) & tmp$area == "north"), "catch_mt"]) / 4
rs = (tmp[which(tmp$year %in% c(1993) & tmp$area == "south"), "catch_mt"] - tmp[which(tmp$year %in% c(1989) & tmp$area == "south"), "catch_mt"]) / 4

add = NULL
for (a in c("south", "north")){
	x = ifelse(a == "south", rs, rn)
	z = tmp[which(tmp$year == 1989 & tmp$area == a), "catch_mt"]
	step = 1
	for (y in 1990:1992){
		new = c(y, a, 0, z + step*x)
		add = rbind(add, new)
		step = step + 1
	}
}
add = as.data.frame(add)
colnames(add) = c('year', 'areas', 'orig_catch_mt', 'catch_mt'); rownames(add) = NULL
tmp_early = rbind(tmp, as.data.frame(add))
tmp_early = tmp_early[order(tmp_early$year),]

tmp_late = aggregate(Total.Mortality.MT~RecFIN.Year+areas, data = ca_rec, drop = FALSE, FUN = sum)
colnames(tmp_late) = c('year', 'areas', 'catch_mt')

# Create a single data frame with all the california rec catches
ca_rec_all = merge(tmp_late, tmp_early, by = c("year",  "areas", "catch_mt"), all = TRUE)
ca_rec_all = ca_rec_all[,-4]

# I tried to evaluate the amount of discarding in the historical period 1980-1989 in MRFSS and if I did the 
# comparison correct the average discarding was fairly low ~ 0.03. 
# I am going to add 0.03 discard mortality to all years before 1981 when MRFSS starts.
all_rec_ca = data.frame(year = 1928:2020,
						catch_s = c(ca_rec_discard_rate * ca_rec_hist[,"SOUTH"], tmp_early[which(tmp_early$year > 1980 & tmp_early$areas == "south"), "catch_mt"], tmp_late[tmp_late$areas == "south", "catch_mt"], 0),
						catch_n = c(ca_rec_discard_rate * ca_rec_hist[,"NORTH"], tmp_early[which(tmp_early$year > 1980 & tmp_early$areas == "north"), "catch_mt"], tmp_late[tmp_late$areas == "north", "catch_mt"], 0))

#-----------------------------------------------------------------------------------------------------
# Oregon
#-----------------------------------------------------------------------------------------------------
or_rec_catch = or_rec[,c('Year', 'TOTAL_REC')]
or_rec_catch$total_mt = NA
or_rec_catch$total_mt[which(or_rec_catch$Year > 2000)] = or_rec_catch[which(or_rec_catch$Year > 2000), "TOTAL_REC"]
or_rec_catch$total_mt[which(or_rec_catch$Year < 2001)] = or_rec_disc_rate * or_rec_catch[which(or_rec_catch$Year < 2001), "TOTAL_REC"]

#-----------------------------------------------------------------------------------------------------
# Washington 
#----------------------------------------------------------------------------------------------------
wa_rec_catch = wa_rec[, c("Year", "Total.removal_.")]
colnames(wa_rec_catch) = c("Year", 'Total')
wa_rec_catch[,"Total.removal_."] = wa_rec_catch[,"Total.removal_."] / 1000

#################################################################################################################
# Evaluate the commercial landings
#################################################################################################################

#com$round_mt = com$CATCH.LBS / 2204.623
com$round_mt = com$ROUND_WEIGHT_MTONS

com$area = com$AGENCY_CODE
# All areas south of Point Conception
south_ca = c("DNA","HNM","LGB","NWB","OBV", "OLA","OSD","OXN","SB","SD","SP","TRM","VEN","WLM")
find = which(com$PACFIN_PORT_CODE %in% south_ca)
com$area[find] = "south"
com$area[which(com$area == "C")] = "north"

# quickly look at the live vs. dead by area
# com$cond = 'dead'
# com$cond[com$CONDITION_CODE == "A"] = 'live'
# c = aggregate(round_mt ~ LANDING_YEAR + area + cond, com, FUN = sum, drop = FALSE)
# par(mfrow = c(3,1))
# plot(sort(unique(c$LANDING_YEAR)), c[c$area == 'south' & c$cond == 'dead', 'round_mt'], 
# 	xlim = c(1995, 2020), ylim = c(0, 10), ylab = '', type = 'l', lwd = 2, col = 1)
# lines(sort(unique(c$LANDING_YEAR)), c[c$area == 'south' & c$cond == 'live', 'round_mt'], lwd = 2, col = 2)
# plot(sort(unique(c$LANDING_YEAR)), c[c$area == 'north' & c$cond == 'dead', 'round_mt'], 
# 	xlim = c(1995, 2020), ylim = c(0, 10), ylab = '', type = 'l', lwd = 2, col = 1)
# lines(sort(unique(c$LANDING_YEAR)), c[c$area == 'north' & c$cond == 'live', 'round_mt'], lwd = 2, col = 2)
# plot(sort(unique(c$LANDING_YEAR)), c[c$area == 'O' & c$cond == 'dead', 'round_mt'], 
# 	xlim = c(1995, 2020), ylim = c(0, 5), ylab = '', type = 'l', lwd = 2, col = 1)
# lines(sort(unique(c$LANDING_YEAR)), c[c$area == 'O' & c$cond == 'live', 'round_mt'], lwd = 2, col = 2)


aggregate(round_mt ~ LANDING_YEAR + area, com[com$LANDING_YEAR == 2020,], FUN = sum, drop = FALSE)
tmp_com = aggregate(round_mt ~ LANDING_YEAR + area, data = com[com$area %in% c('north', 'south', 'W'),], FUN = sum, drop = FALSE)
tmp_com[is.na(tmp_com)] = 0
colnames(tmp_com) = c('year', 'area', 'round_mt')

#################################################################################
# Create a data frame without discarding assumptions added (e.g. landings only)
#################################################################################

# Need to adjust the historical catches for north and south
ca_com_hist_early$north_no_disc =  apply(ca_com_hist_early[,c("area0", "area2", "area4", "area5")], 1, sum) + 
							(1 - ca_com_ratio[,"Ratio"]) * ca_com_hist_early[,"area6"]
ca_com_hist_early$south_no_disc = ca_com_hist_early[,"area8"] + ca_com_ratio[,"Ratio"] * ca_com_hist_early[,"area6"]

ca_com_hist$total_south_no_disc = ca_com_hist[,"catch_mt_south"]
ca_com_hist$total_north_no_disc = ca_com_hist[,"catch_mt_north"]


# process wa's provided commercial catches
wa_com$round_mt = wa_com$SpeciesPounds * 0.000453592
wa = aggregate(round_mt~Year, data = wa_com[wa_com$Year > 1950,], FUN = sum)
pac_wa = aggregate(round_mt ~ YEAR, data = com[com$area %in% c('W'),], FUN = sum, drop = FALSE)
colnames(pac_wa) = c("Year", "round_mt")
wa_all = rbind(wa[wa$Year < min(pac_wa$Year), ], pac_wa[,1:2])


# Knit all the data sources together in a ugly fashion
compiled_no_disc = matrix(0, length(1910:2020), 5)
colnames(compiled_no_disc) = c('year', 'south', 'north', 'or', 'wa')
compiled_no_disc[,"year"] = 1910:2020

# California 1916 - 1968
compiled_no_disc[which(compiled_no_disc[,"year"] %in% ca_com_hist_early[,"Year"]), "south"] = ca_com_hist_early[, "south_no_disc"]
compiled_no_disc[which(compiled_no_disc[,"year"] %in% ca_com_hist_early[,"Year"]), "north"] = ca_com_hist_early[, "north_no_disc"]
# California 1969-1980
compiled_no_disc[which(compiled_no_disc[,"year"] %in% ca_com_hist$Year), "south"] = ca_com_hist[, "total_south_no_disc"]
compiled_no_disc[which(compiled_no_disc[,"year"] %in% ca_com_hist$Year), "north"] = ca_com_hist[, "total_north_no_disc"]
# California 1981 - 2020
compiled_no_disc[which(compiled_no_disc[,"year"] %in% tmp_com$year), "south"] = tmp_com[tmp_com$area == "south", "round_mt"]
compiled_no_disc[which(compiled_no_disc[,"year"] %in% tmp_com$year), "north"] = tmp_com[tmp_com$area == "north", "round_mt"]
# Oregon all years
compiled_no_disc[which(compiled_no_disc[,"year"] %in% or_all_ali$Year), "or"] = or_all_ali[which(compiled_no_disc[,"year"] %in% or_all_ali$Year), "Total"]
# Washington all years
compiled_no_disc[which(compiled_no_disc[,"year"] %in% wa_all$Year), 'wa'] = wa_all[, "round_mt"]

write.csv(compiled_no_disc, file = file.path(dir, "commercial_landings_by_state_no_discards.csv"))



#############################################################################################################
# Add discards by year
#############################################################################################################
tmp_com[which(tmp_com$year %in% gemm$Year & tmp_com$area == "north"),'total_mt'] = tmp_com[which(tmp_com$year %in% gemm$Year & tmp_com$area == "north"),'round_mt'] +
	gemm[,"ca_n"]
tmp_com[which(tmp_com$year %in% gemm$Year & tmp_com$area == "south"),'total_mt'] = tmp_com[which(tmp_com$year %in% gemm$Year & tmp_com$area == "south"),'round_mt'] +
	gemm[,"ca_s"]
# Need to get the amount for 2020 from the GMT
tmp_com[which(tmp_com$year == 2020), "total_mt"] =  tmp_com[which(tmp_com$year == 2020), "round_mt"]

# Apply the default discard rate to PacFIN years pre-GEMM
tmp_com[which(tmp_com$year %in% 1981:2001 & tmp_com$area == "south"), 'total_mt'] = 
	com_disc_rate * tmp_com[which(tmp_com$year %in% 1981:2001 & tmp_com$area == "south"), 'round_mt']
tmp_com[which(tmp_com$year %in% 1981:2001 & tmp_com$area == "north"), 'total_mt'] = 
	com_disc_rate * tmp_com[which(tmp_com$year %in% 1981:2001 & tmp_com$area == "north"), 'round_mt']

# Need to adjust the historical catches for north and south
ca_com_hist_early$north = com_disc_rate * (apply(ca_com_hist_early[,c("area0", "area2", "area4", "area5")],1,sum) + 
							(1 - ca_com_ratio[,"Ratio"]) * ca_com_hist_early[,"area6"])
ca_com_hist_early$south = com_disc_rate * (ca_com_hist_early[,"area8"] + ca_com_ratio[,"Ratio"] * ca_com_hist_early[,"area6"])

ca_com_hist$total_south = com_disc_rate * ca_com_hist[,"catch_mt_south"]
ca_com_hist$total_north = com_disc_rate * ca_com_hist[,"catch_mt_north"]

# use ali's for oregon
or_all_ali$total_mt = NA
or_all_ali[which(or_all_ali$Year %in% gemm$Year),'total_mt'] = 
	or_all_ali[which(or_all_ali$Year %in% gemm$Year),'Total'] + gemm[,"or"]
or_all_ali[which(!or_all_ali$Year %in% gemm$Year), "total_mt"] = 
	com_disc_rate * or_all_ali[which(!or_all_ali$Year %in% gemm$Year), "Total"]

# process wa's provided commercial catches
wa_com$round_mt = wa_com$SpeciesPounds * 0.000453592
wa = aggregate(round_mt~Year, data = wa_com[wa_com$Year > 1950,], FUN = sum)
pac_wa = aggregate(round_mt ~ YEAR, data = com[com$area %in% c('W'),], FUN = sum, drop = FALSE)
colnames(pac_wa) = c("Year", "round_mt")
wa_all = rbind(wa[wa$Year < min(pac_wa$Year), ], pac_wa[,1:2])


# Knit all the data sources together in a ugly fashion
all_com = matrix(0, length(1910:2020), 5)
colnames(all_com) = c('year', 'south', 'north', 'or', 'wa')
all_com[,"year"] = 1910:2020

# California 1916 - 1968
all_com[which(all_com[,"year"] %in% ca_com_hist_early[,"Year"]), "south"] = ca_com_hist_early[, "south"]
all_com[which(all_com[,"year"] %in% ca_com_hist_early[,"Year"]), "north"] = ca_com_hist_early[, "north"]
# California 1969-1980
all_com[which(all_com[,"year"] %in% ca_com_hist$Year), "south"] = ca_com_hist[, "total_south"]
all_com[which(all_com[,"year"] %in% ca_com_hist$Year), "north"] = ca_com_hist[, "total_north"]
# California 1981 - 2020
all_com[which(all_com[,"year"] %in% tmp_com$year), "south"] = tmp_com[tmp_com$area == "south", "total_mt"]
all_com[which(all_com[,"year"] %in% tmp_com$year), "north"] = tmp_com[tmp_com$area == "north", "total_mt"]
# Oregon all years
all_com[which(all_com[,"year"] %in% or_all_ali$Year), "or"] = or_all_ali[which(all_com[,"year"] %in% or_all_ali$Year), "total_mt"]
# Washington all years
all_com[which(all_com[,"year"] %in% wa_all$Year), 'wa'] = wa_all[, "round_mt"]

write.csv(all_com, file = file.path(dir, "commercial_catch_by_state.csv"))

#################################################################################################################
# For the catches for SS by each model area:
# Year, Season, Fleet, Catch, Catch SE
#################################################################################################################

south_catch_ss = rbind( cbind(as.numeric(all_com[,"year"]), 1, 1, round(as.numeric(all_com[,"south"]), 2), 0.01),
						cbind(as.numeric(all_rec_ca$year), 1, 2, round(as.numeric(all_rec_ca$catch_s), 2), 0.01))
colnames(south_catch_ss) = c("Year", "Season", "Fleet", "Catch", "SE")

north_catch_ss = rbind( cbind(as.numeric(all_com[,"year"]), 1, 1, round(as.numeric(all_com[,"north"]), 2), 0.01),
						cbind(as.numeric(all_rec_ca$year), 1, 2, round(as.numeric(all_rec_ca$catch_n), 2), 0.01))
colnames(north_catch_ss) = c("Year", "Season", "Fleet", "Catch", "SE")

oregon_catch_ss = rbind( cbind(as.numeric(all_com[,"year"]), 1, 1, round(as.numeric(all_com[,"or"]), 2), 0.01),
						 cbind(as.numeric(or_rec_catch$Year), 1, 2, round(as.numeric(or_rec_catch$total_mt), 2), 0.01))
colnames(oregon_catch_ss) = c("Year", "Season", "Fleet", "Catch", "SE")

washington_catch_ss = rbind( cbind(as.numeric(wa_rec_catch$Year), 1, 1, as.numeric(wa_rec_catch$Total), 0.01),
						 cbind(as.numeric(all_com[which(all_com[,'wa'] > 0), "year"]), 1, 2, as.numeric(all_com[which(all_com[,'wa']> 0), "wa"]), 0.01) )
colnames(washington_catch_ss) = c("Year", "Season", "Fleet", "Catch", "SE")

write.csv(south_catch_ss, file = file.path(dir, "forSS", "south_ca_catches_for_ss.csv"), row.names = FALSE)
write.csv(north_catch_ss, file = file.path(dir, "forSS", "north_ca_catches_for_ss.csv"), row.names = FALSE)
write.csv(oregon_catch_ss, file = file.path(dir, "forSS", "oregon_catches_for_ss.csv"), row.names = FALSE)
write.csv(washington_catch_ss, file = file.path(dir, "forSS", "washington_catches_for_ss.csv"), row.names = FALSE)