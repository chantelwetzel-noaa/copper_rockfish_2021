##############################################################################################################
#
# 	Purpose: Summarize Copper Rockfish Landing
#
#			  by Chantel Wetzel 
#
##############################################################################################################

devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/dataModerate_2021")
library(HandyCode)
library(dplyr)
options(stringsAsFactors = FALSE)

dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/catches"
dir.create(file.path(dir, "plots"))

#-----------------------------------------------------------------------------------
# Load the Recreational Data
#-----------------------------------------------------------------------------------

ca_rec_discard_rate = 1.03
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
# The column A+B1 should represent retained and discard mortality 


# Oregon
or_rec = read.csv(paste0(dir, "/_or/or_copper_final_rec_landings_1979_2020.csv"))

# Washington - these files are in numbers of fish
wa_rec = read.csv(file.path(dir, "_wa", "wa_recreational_all_years.csv"))


#-----------------------------------------------------------------------------------
# Load the Commercial Data
#-----------------------------------------------------------------------------------

# PacFIN Commercial
load(file.path(dir, "COPP.CompFT.17.Aug.2020.RData"))
com = COPP.CompFT.17.Aug.2020

# Oregon Historical Catches
or_all_ali = read.csv(file.path(dir, "/_or/or_copper_final_commercial_landings_1892_2020.csv"))

# California Historical Catches
ca_com_hist = read.csv(file.path(dir, "_ca", "ca_hist_commercial_1969_1980_ej.csv"))
ca_com_hist[is.na(ca_com_hist)] = 0
ca_com_hist$catch_mt_south = 0.000453592 * (ca_com_hist$OSB + ca_com_hist$OLA + ca_com_hist$OSD)
ca_com_hist$catch_mt_north = 0.000453592 * ca_com_hist$Grand.Total - ca_com_hist$catch_mt_south 

# Historical commercial not split north and south of pt. concep will need to adjust
ca_com_hist_early = read.csv(file.path(dir, "_ca", "ca_hist_commercial_1916_1968_ej.csv"))
# Fraction of fish by year from area 6 that need to be moved into the south area
ca_com_ratio = read.csv(file.path(dir, "_ca", "historical_landings_tables_2020_revised_Avila_1953.csv"))

# Washington does not have historical commercial catches

# Grab the WGCOP GEMM data
gemm = read.csv(file.path(dir, "gemm_mortality_and_discard.csv"))
wcgop = read.csv("C:/Assessments/WCGOP/2021/copper_rockfish/copper_OB_DisRatios_noboot_ncs_Area_2020-09-28.csv")

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
			  area_names  = c("south", "north"), 
			  column_name = "RECFIN_SUB_REGION_NAME")


# Cut down the data frame to a manageble size of key items
tmp = aggregate(WGT_AB1..mt. ~ YEAR_ + areas, data = ca_rec_early, drop = FALSE, FUN = sum)
colnames(tmp) = c("year", "areas", "orig_catch_mt")
# Move catches in the south to the north for 1980 - 1989: ratio of 0.317 based on Albin et al. 1993 
# See Allocate_MRFSS_1980-1989.xls to see how calculated
n = which(tmp$year %in% c(1980:1989) & tmp$areas == "north")
s = which(tmp$year %in% c(1980:1989) & tmp$areas == "south")
tmp$catch_mt = NA
tmp$catch_mt[n] = tmp[n, "orig_catch_mt"] + tmp[s, "orig_catch_mt"] * 0.317
tmp$catch_mt[s] = tmp[s, "orig_catch_mt"] - tmp[s, "orig_catch_mt"] * 0.317
tmp$catch_mt[is.na(tmp$catch_mt)] = tmp$orig_catch_mt[is.na(tmp$catch_mt)]
# Need to linear interpolate the missing years 1990-992
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

# Plot all the recreational catches for California
# pngfun(wd = file.path(dir, "plots"), file = "CA_Rec_Catch_Area.png", w = 12, h = 7, pt = 12)
# par(mfrow = c(2,1))
# barplot(ca_rec_df[ca_rec_df$areas == "south", "catch_mt"], main = "Recreational - South of Pt. Conception",
# 	col = "red", ylim = c(0, max(ca_rec_df[, "catch_mt"])), 
# 	names.arg = ca_rec_df[ca_rec_df$areas == "south", "year"])
# mtext(side = 1, "Year", line = 2.5)
# mtext(side = 2, "Total Mortality (mt)", line = 2.5)
# 
# barplot(ca_rec_df[ca_rec_df$areas == "north", "catch_mt"], main = "Recreational - North of Pt. Conception",
# 	col = "orange", ylim = c(0, max(ca_rec_df[, "catch_mt"])), 
# 	names.arg = ca_rec_df[ca_rec_df$areas == "north", "year"])
# mtext(side = 1, "Year", line = 2.5)
# mtext(side = 2, "Total Mortality (mt)", line = 2.5)
# dev.off()
# 
write.csv(all_rec_ca, file = file.path(dir,  "copper_ca_recreational_total_mortality.csv"))

#-----------------------------------------------------------------------------------------------------
# Oregon
#-----------------------------------------------------------------------------------------------------
or_rec_catch = or_rec[,1:2]

#pngfun(wd = file.path(dir, "plots"), file = "OR_Rec_Catch.png", w = 12, h = 7, pt = 12)
#par(mfrow = c(1,1))
#barplot(or_rec_catch[,2], main = "Recreational - Oregon",
#	col = "purple", ylim = c(0, ceiling(max(or_rec_catch[,2]))), names.arg = or_rec_catch$Year)
#mtext(side = 1, "Year", line = 2.5)
#mtext(side = 2, "Total Mortality (mt)", line = 2.5)
#dev.off()

#-----------------------------------------------------------------------------------------------------
# Washington 
#----------------------------------------------------------------------------------------------------
wa_rec_catch = wa_rec[, c("Year", "Total.removal_.")]
colnames(wa_rec_catch) = c("Year", 'Total')

#pngfun(wd = file.path(dir, "plots"), file = "WA_Rec_Catch.png", w = 12, h = 7, pt = 12)
#par(mfrow = c(1,1))
#barplot(wa_rec_catch[,"Total"], main = "Recreational - Washigton",
#	col = "blue", ylim = c(0, ceiling(max(wa_rec_catch$Total))), names.arg = wa_rec_catch$Year)
#mtext(side = 1, "Year", line = 2.5)
#mtext(side = 2, "Catches (numbers)", line = 2.5)
#dev.off()

#---------------------------------------------------------------------------------------------------
# Show the catches from each area
#----------------------------------------------------------------------------------------------------

#pngfun(wd = file.path(dir, "plots"), file = "Rec_Catch_All_Areas.png", w = 12, h = 7, pt = 12)
#par(mfrow = c(2,2))
#barplot(ca_rec_df[ca_rec_df$areas == "south", "catch_mt"], main = "Recreational - South of Pt. Conception",
#	col = "red", ylim = c(0, max(ca_rec_df[, "catch_mt"])), 
#	names.arg = ca_rec_df[ca_rec_df$areas == "south", "year"])
#mtext(side = 1, "Year", line = 2.5)
#mtext(side = 2, "Total Mortality (mt)", line = 2.5)
#
#barplot(ca_rec_df[ca_rec_df$areas == "north", "catch_mt"], main = "Recreational - North of Pt. Conception",
#	col = "orange", ylim = c(0, max(ca_rec_df[, "catch_mt"])), 
#	names.arg = ca_rec_df[ca_rec_df$areas == "north", "year"])
#mtext(side = 1, "Year", line = 2.5)
#mtext(side = 2, "Total Mortality (mt)", line = 2.5)
#
#barplot(or_rec_catch[,2], main = "Recreational - Oregon",
#	col = "purple", ylim = c(0, 15), names.arg = or_rec_catch$Year)
#mtext(side = 1, "Year", line = 2.5)
#mtext(side = 2, "Total Mortality (mt)", line = 2.5)
#
#barplot(wa_rec_catch[,"Total"], main = "Recreational - Washigton",
#	col = "blue", ylim = c(0, ceiling(max(wa_rec_catch$Total) + 200)), names.arg = wa_rec_catch$Year)
#mtext(side = 1, "Year", line = 2.5)
#mtext(side = 2, "Total Mortality (numbers)", line = 2.5)
#dev.off()


#################################################################################################################
# Evaluate the commercial landings
#################################################################################################################

com$round_mt = com$CATCH.LBS / 2204.62262

#DISPOSITION  A      animal food                                                                     
#             B      bait                                                                            
#             C      human food (canned)                                                             
#             D      discard (shoreside discard; spoiled)                                            
#             F      landed live (human food eventually)                                             
#             H      human food                                                                      
#             I      investigation (research)                                                        
#             L      live (aquarium use)                                                             
#             O      other known dispositions                                                        
#             P      personal use                                                                    
#             R      reduction                                                                       
#             S      seized (illegal)                                                                
#             T      tagged fish                                                                     
#             U      unspecified                                                                     
#             W      confiscated "overage" catch that was sold (revenues forwarded to the state)     
#             X      discard (at sea)        

# According to Ali - the live vs. dead fishery are catching the same fish and there will
# likely be no difference in selectivity.
com$fleet = NA
com$fleet[which(com[,"AGID"] == "O")] = 'both'
com$fleet[which(com[,"AGID"] == "W")] = 'dead'
com$fleet[which(com[, "DISP"] == "F" & com[,"AGID"] == "C")] = "alive"
com$fleet[which(com[, "DISP"] != "F" & com[,"AGID"] == "C")] = "dead"


twl = c('FFT', 'FTS', "GFL", 'GFS', 'GFT', 'MDT', 'RLT', 'SST')
longline = c('LGL')
pole = c('POL')
hkl = c('OHL', 'VHL')
net = c('DGN', 'DNT', 'DPN', 'GLN', 'SEN', 'STN')
#other = unique(com$GRID[!(unique(com$GRID) %in% c(twl, longline, pole, hkl, net))])
com$gear = NA
com$gear[which(com$GRID %in% twl)] = 'twl'
com$gear[which(com$GRID %in% longline)] = 'longline'
com$gear[which(com$GRID %in% pole)] = 'pole'
com$gear[which(com$GRID %in% hkl)] = 'hkl'
com$gear[which(com$GRID %in% net)] = 'net'
com$gear[which(is.na(com$gear))] = 'other'

com$area = com$AGID
# All areas south of Point Conception
south_ca = c("DNA","HNM","LGB","NWB","OBV", "OLA","OSD","OXN","SB","SD","SP","TRM","VEN","WLM")
find = which(com$PCID %in% south_ca)
com$area[find] = "south_ca"

table(com$GRGROUP)
#   HKL    MSC    NET    POT    TLS    TWL    TWS 
#188613     32   6771    940    107   5245     52
tmp = aggregate(round_mt ~ YEAR + area + fleet, data = com, FUN = sum, drop = FALSE)
catch_state_dead_alive_df = data.frame(year = sort(unique(tmp$YEAR)),
						               s_ca_dead = tmp[tmp$area == "south_ca" &tmp$fleet == "dead", "round_mt"],
						               n_ca_dead = tmp[tmp$area == "C" &tmp$fleet == "dead", "round_mt"],
						               s_ca_alive = tmp[tmp$area == "south_ca" &tmp$fleet == "alive", "round_mt"],
						               n_ca_alive = tmp[tmp$area == "C" &tmp$fleet == "alive", "round_mt"],
						               or = tmp[tmp$area == "O" & tmp$fleet == "both", "round_mt"],
						               wa = tmp[tmp$area == "W" & tmp$fleet == "dead", "round_mt"])
catch_state_dead_alive_df[is.na(catch_state_dead_alive_df)] = 0


# Knit all the data sources together in a ugly fashion
#---------------------------------------------------------------------------------------------------
all_dead_alive = matrix(0, length(1910:2020), 7)
colnames(all_dead_alive) = colnames(catch_state_dead_alive_df)
all_dead_alive[,"year"] = 1910:2020
all_dead_alive[which(all_dead_alive[,"year"] %in% catch_state_dead_alive_df$year), "s_ca_dead"] = catch_state_dead_alive_df[, "s_ca_dead"]
all_dead_alive[which(all_dead_alive[,"year"] %in% ca_com_hist$Year), "s_ca_dead"] = ca_com_hist[, "catch_mt_south"]
all_dead_alive[which(all_dead_alive[,"year"] %in% catch_state_dead_alive_df$year), "s_ca_alive"] = catch_state_dead_alive_df[, "s_ca_alive"]
all_dead_alive[which(all_dead_alive[,"year"] %in% catch_state_dead_alive_df$year), "n_ca_dead"] = catch_state_dead_alive_df[, "n_ca_dead"]
all_dead_alive[which(all_dead_alive[,"year"] %in% ca_com_hist$Year), "n_ca_dead"] = ca_com_hist[, "catch_mt_north"]
all_dead_alive[which(all_dead_alive[,"year"] %in% catch_state_dead_alive_df$year), "n_ca_alive"] = catch_state_dead_alive_df[, "n_ca_alive"]
all_dead_alive[, "or"] = or_all_ali[which(all_dead_alive[,"year"] %in% or_all_ali$Year), "Total"]
all_dead_alive[which(all_dead_alive[,"year"] %in% catch_state_dead_alive_df$year), "wa"] = catch_state_dead_alive_df[, "wa"]


# Plot all commercial catch by area
pngfun(wd = file.path(dir, "plots"), file = "Commercial_Catch_All_Alive_Dead.png", w = 12, h = 7, pt = 12)
par(mfrow = c(2,2))
barplot(all_dead_alive[, "s_ca_dead"] + all_dead_alive[, "s_ca_alive"], 
	main = "South of Pt. Conception", col = "red", ylim = c(0, 80), names.arg = all_dead_alive[ ,"year"])
barplot(all_dead_alive[, "s_ca_dead"], col = "purple", add = TRUE)
legend("topright", bty = 'n', legend = c("Alive", "Dead"),
	lwd = 2, lty = 1, col = c('red', 'purple'))
mtext(side = 1, "Year", line = 2.5)
mtext(side = 2, "Total Landing (mt)", line = 2.5)
barplot(all_dead_alive[, "n_ca_dead"] + all_dead_alive[, "n_ca_alive"], 
	main = "North of Pt. Conception", col = "red", ylim = c(0, 80), names.arg = all_dead_alive[ ,"year"])
barplot(all_dead_alive[, "n_ca_dead"], col = "purple", add = TRUE)
mtext(side = 1, "Year", line = 2.5)
mtext(side = 2, "Total Landing (mt)", line = 2.5)
barplot(all_dead_alive[, "or"], main = "Oregon", col = "green", 
	ylim = c(0, ceiling(max(all_dead_alive[, "or"]))), names.arg = all_dead_alive[, "year"])
mtext(side = 1, "Year", line = 2.5)
mtext(side = 2, "Total Landing (mt)", line = 2.5)
barplot(all_dead_alive[, "wa"], main = "Washington", col = "purple", 
	ylim = c(0, ceiling(max(all_dead_alive[, "or"]))), names.arg = all_dead_alive[ ,"year"])
mtext(side = 1, "Year", line = 2.5)
mtext(side = 2, "Total Landing (mt)", line = 2.5)
dev.off()

tot_by_gear = aggregate(round_mt ~ gear + area, data = com, FUN = sum)
cbind(tot_by_gear[,1:2], round(tot_by_gear$round_mt, 2))
#      gear     area round(tot_by_gear$round_mt, 2)
#       hkl south_ca                           7.61
#      pole south_ca                          98.89
#  longline south_ca                         138.39
#       net south_ca                           8.19
#     other south_ca                           1.93
#       twl south_ca                           1.22
#       hkl        C                          19.16
#      pole        C                         339.72
#  longline        C                         307.62
#       net        C                          31.95
#     other        C                          19.60
#       twl        C                          53.50
#       hkl        O                          19.56
#  longline        O                          19.74
#     other        O                           0.07
#       twl        O                           3.19
#  longline        W                           0.01
#       twl        W                           0.04

com$gear2 = NA
com$gear2[which(com$gear %in% c("pole", "hkl"))] = "hkl"
com$gear2[which(!com$gear %in% c("pole", "hkl"))] = "other"
com$gear_area = paste0(com$gear2, "_", com$area)

tmp = aggregate(com$round_mt, list(year = com$YEAR, gear_area = com$gear_area), FUN = sum, drop = FALSE)
catch_area_df = data.frame(year = sort(unique(tmp$year)),
						   hkl_n_ca = tmp[tmp$gear_area == "hkl_C", "x"],
						   other_n_ca = tmp[tmp$gear_area == "other_C", "x"],
						   hkl_s_ca = tmp[tmp$gear_area == "hkl_south_ca", "x"],
						   other_s_ca = tmp[tmp$gear_area == "other_south_ca", "x"],
						   hkl_or   = tmp[tmp$gear_area =="hkl_O", "x"], 
						   other_or   = tmp[tmp$gear_area == "other_O", "x"], 
						   wa   = tmp[tmp$gear_area %in% c("hkl_W", "other_W"), "x"])
catch_area_df[is.na(catch_area_df)] = 0

percent_by_area = round(catch_area_df[ , 2:dim(catch_area_df)[2]] / 
					    apply(catch_area_df[ , 2:dim(catch_area_df)[2]], 1, sum), 2)
# The majority of the commercial catch is occuring north of point conception
# apply(catch_area_df[,-1], 2,sum)
# hkl_n_ca other_n_ca   hkl_s_ca other_s_ca     hkl_or   other_or         wa 
#   358.87     412.67     106.50     149.74      19.56      23.00       0.05

#---------------------------------------------------------------------------
# Remove the gear grouping for now and just sum landings by area 
#---------------------------------------------------------------------------

all_com = matrix(NA, length(1910:2020), 4)
colnames(all_com) = c("s_ca", "n_ca", "or", "wa")
rownames(all_com) = 1910:2020

all_com[, "s_ca"] = all_dead_alive[, "s_ca_dead"] + all_dead_alive[, "s_ca_alive"]
all_com[, "n_ca"] = all_dead_alive[, "n_ca_dead"] + all_dead_alive[, "n_ca_alive"]
all_com[, "or"] = all_dead_alive[,"or"]
all_com[, "wa"] = all_dead_alive[,"wa"]
all_com[is.na(all_com)] = 0

write.csv(all_com, file = file.path(dir, "commercial_catch_by_area.csv"), row.names = FALSE)


pngfun(wd = file.path(dir, "plots"), file = "Commercial_Catch_by_Area.png", w = 12, h = 7, pt = 12)
plot(0, 0, type = 'l', xlim = c(1940, 2020), ylim = c(0, max(all_com)), ylab = "Catch (mt)", xlab = "Year", main = "Commercial Catch")
lines(rownames(all_com), all_com[,"s_ca"], lwd = 2, col = "red")
lines(rownames(all_com), all_com[,"n_ca"], lwd = 2, col = 'orange')
lines(rownames(all_com), all_com[,"or"],   lwd = 2, col = 'purple')
lines(rownames(all_com), all_com[,"wa"],   lwd = 2, col = 'blue')
legend("topright", bty = 'n', legend = c("S. Pt. Conception", "N. Pt. Conception", "Oregon", "Washington"),
	lwd = 2, lty = 1, col = c('red', 'orange', 'purple', 'blue'))
dev.off()

#################################################################################################################
# Create plot to visualize the GEMM data
#################################################################################################################

pngfun(wd = file.path(dir, "plots"), file = "Discard_Data_from_GEMM.png", w = 14, h = 7, pt = 12)
par(mfrow = c(1,2), mar = c(4,5,4,1), oma = c(1,1,1,1))
barplot(gemm[gemm$Area == "commercial", "Dead_Discard"], las = 1, cex.axis = 1.5,
	col = "red", ylim = c(0, 5), 
	names.arg = gemm[gemm$Area == "commercial" ,"Year"])
mtext(side = 3, "Coastwide Commercial Discard: WCGOP", line = -2, outer = TRUE, cex = 1.5)
mtext(side = 1, "Year", line = 3, cex = 1.5)
mtext(side = 2, "Total Dead Discard (mt)", line = 3, cex = 1.5)
plot(gemm[gemm$Area == "commercial", "Year"], gemm[gemm$Area == "commercial", "Discard_Mort_Rate"], las = 1,
	 type = 'p', col = 'darkgrey', cex = 2, cex.axis = 1.5, cex.lab = 1.5, ylab = "", xlab = "Year", ylim = c(0, 0.22))
points(gemm[gemm$Area == "commercial", "Year"], gemm[gemm$Area == "commercial", "Discard_Mort_Rate"], pch = 16, cex = 2, col = 'darkgrey')
mtext(side = 2, "Discard Rate", line = 3.5, cex = 1.5)
dev.off()

#################################################################################################################
# Create plot to visualize the WCGOP discard rates
#################################################################################################################

pngfun(wd = file.path(dir, "plots"), file = "Discard_Data_from_WCGOP.png", w = 14, h = 7, pt = 12)
par(mfrow = c(1,3), mar = c(4,5,4,1), oma = c(1,1,1,1))
plot(wcgop[wcgop$Lat == "CA_S", "ryear"], wcgop[wcgop$Lat == "CA_S", "Observed_Ratio"], las = 1, 
	 type = 'p', col = 'darkgrey', cex = 2, cex.axis = 1.5, cex.lab = 1.5, ylab = "", xlab = "Year", ylim = c(0, 1))
points(wcgop[wcgop$Lat == "CA_S", "ryear"], wcgop[wcgop$Lat == "CA_S", "Observed_Ratio"], pch = 16, cex = 2, col = 'darkgrey')
mtext(side = 2, "Discard Rate", line = 3.5, cex = 1.5)
mtext(side = 3, "S. Pt. Conception", line = 1, cex = 1.5)
plot(wcgop[wcgop$Lat == "CA_N", "ryear"], wcgop[wcgop$Lat == "CA_N", "Observed_Ratio"], las = 1, 
	 type = 'p', col = 'darkgrey', cex = 2, cex.axis = 1.5, cex.lab = 1.5, ylab = "", xlab = "Year", ylim = c(0, 1))
points(wcgop[wcgop$Lat == "CA_N", "ryear"], wcgop[wcgop$Lat == "CA_N", "Observed_Ratio"], pch = 16, cex = 2, col = 'darkgrey')
mtext(side = 2, "Discard Rate", line = 3.5, cex = 1.5)
mtext(side = 3, "N. Pt. Conception", line = 1, cex = 1.5)
plot(wcgop[wcgop$Lat == "OR", "ryear"], wcgop[wcgop$Lat == "OR", "Observed_Ratio"], las = 1, 
	 type = 'p', col = 'darkgrey', cex = 2, cex.axis = 1.5, cex.lab = 1.5, ylab = "", xlab = "Year", ylim = c(0, 1))
points(wcgop[wcgop$Lat == "OR", "ryear"], wcgop[wcgop$Lat == "OR", "Observed_Ratio"], pch = 16, cex = 2, col = 'darkgrey')
mtext(side = 2, "Discard Rate", line = 3.5, cex = 1.5)
mtext(side = 3, "Oregon", line = 1, cex = 1.5)
dev.off()

#################################################################################################################
# For the catches for SS by each model area:
# Year, Season, Fleet, Catch, Catch SE
#################################################################################################################

# Example Approach:
#south_ca_catch = rbind(cbind( catch.matrix[,1],      1, 1, round(apply(temp[,2:5], 1, sum),3), 0.05),
#					   cbind( ashop.cat$Year,        1, 2, round(ashop.cat$ASHOP,          3), 0.05),
#					   cbind( foreign.cat$Year,      1, 3, round(foreign.cat$Foreign,      3), 0.05),
#					   cbind( pop.cat$Year,          1, 4, round(pop.cat$mt,               3), 0.05),
#					   cbind( tri.cat$Year,          1, 5, round(tri.cat$mt,               3), 0.05),
#					   cbind( afsc.cat$Year,         1, 6, round(afsc.cat$mt,              3), 0.05),
#					   cbind( nwfsc.slope.cat$Year,  1, 7, round(nwfsc.slope.cat$mt,       3), 0.05),
#					   cbind( nwfsc.cat$Year,        1, 8, round(nwfsc.cat$mt,  		   3), 0.05) )
#
#collapsed.catch = as.data.frame(collapsed.catch)
#colnames(collapsed.catch) = c("Years", "Season", "Fleet", "Catch",  "SE")
#
#write.csv(collapsed.catch, file = "CommercialCatch/forSS/POP2017_PacFIN_catch_forSS.csv")


#################################################################################################################
#
# Additional ancillary analysis and figures: Not used in the final product.
#
#################################################################################################################


check = ca_rec[,"Total.Mortality.MT"]/ (ca_rec[, "Retained.MT"] + ca_rec[, "Released.Dead.MT"])
plot(check)
abline(h = 1, col = 'red')
ca_rec$diff = ca_rec[,"Total.Mortality.MT"] / (ca_rec[, "Retained.MT"] + ca_rec[, "Released.Dead.MT"])
# It looks like these columns may not match due to rounding in the preliminary calcs.

# Look at the mortality in MT
tot = aggregate(Total.Mortality.MT ~ RecFIN.Year + areas, data = ca_rec, FUN = sum, drop = FALSE)
ret = aggregate(Retained.MT~ RecFIN.Year + areas, data = ca_rec, FUN = sum, drop = FALSE)
rel_dead  = aggregate(Released.Dead.MT~ RecFIN.Year + areas, data = ca_rec, FUN = sum, drop = FALSE)
rec_mt = cbind(tot, ret$Retained.MT, rel_dead$Released.Dead.MT)
colnames(rec_mt) = c("year", "areas", "tot_mort", "retained_mt", "rel_dead_mt")
rec_mt[is.na(rec_mt)] = 0

# Now lets compare this information by the Num category
tot_num = aggregate(Total.Mortality.Num ~ RecFIN.Year + areas, data = ca_rec, FUN = sum, drop = FALSE)
ret_num = aggregate(Retained.Num~ RecFIN.Year + areas, data = ca_rec, FUN = sum, drop = FALSE)
rel_dead_num  = aggregate(Released.Dead.Num~ RecFIN.Year + areas, data = ca_rec, FUN = sum, drop = FALSE)
rec_num = cbind(tot_num, ret_num$Retained.Num, rel_dead_num$Released.Dead.Num)
colnames(rec_num) = c("year", "areas", "tot_mort", "retained_num", "rel_dead_num")
rec_num[is.na(rec_num)] = 0

pngfun(wd = file.path(dir, "plots"), file = "CA_rec_mt_vs_num_2005_2019.png")
par(mfrow = c(2,2))
plot(rec_mt[rec_mt$areas == "south", "year"], rec_mt[rec_mt$areas == "south", "tot_mort"], type = 'l', lwd = 2, xlab = "Year", 
	ylab = "Total Mortality (mt)", ylim = c(0, 130), main = "South of Pt. Conception")
plot(rec_mt[rec_mt$areas == "north", "year"], rec_mt[rec_mt$areas == "north", "tot_mort"], type = 'l', lwd = 2, xlab = "Year", 
	 ylab = "Total Mortality (mt)", ylim = c(0, 130), main = "North of Pt. Conception")

plot(rec_num[rec_num$areas == "south", "year"], rec_num[rec_num$areas == "south", "tot_mort"], type = 'l', lwd = 2, xlab = "Year", 
	 ylab = "Total Mortality (numbers)", ylim = c(0, 170000), main = "South of Pt. Conception")
plot(rec_num[rec_num$areas == "north", "year"], rec_num[rec_num$areas == "north", "tot_mort"], type = 'l', lwd = 2, xlab = "Year", 
	ylab = "Total Mortality (numbers)", ylim = c(0, 170000), main = "North of Pt. Conception")
dev.off()

# Budrick suggested just looking at metric ton values
pngfun(wd = file.path(dir, "plots"), file = "Rec_Catch_Area_2005_2019.png", w = 12, h = 7, pt = 12)
par(mfrow = c(2,1))
barplot(rec_mt[rec_mt$areas == "north", "tot_mort"], main = "Recreational - North of Pt. Conception",
	col = "orange", ylim = c(0, 130), names.arg = rec_mt[rec_mt$areas == "north", "year"])
mtext(side = 1, "Year", line = 2.5)
mtext(side = 2, "Total Mortality (mt)", line = 2.5)
barplot(rec_mt[rec_mt$areas == "south", "tot_mort"], main = "Recreational - South of Pt. Conception",
	col = "red", ylim = c(0, 130), names.arg = rec_mt[rec_mt$areas == "north", "year"])
#barplot(rec_mt[rec_mt$areas == "south", "tot_mort"] , col = "purple", add = TRUE)
#legend("topleft", bty = 'n', legend = c("North of Pt. Conception", "South of Pt. Conception"),
#	lwd = 2, lty = 1, col = c('red', 'purple'))
mtext(side = 1, "Year", line = 2.5)
mtext(side = 2, "Total Mortality (mt)", line = 2.5)
dev.off()