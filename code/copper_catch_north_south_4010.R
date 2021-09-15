##############################################################################################################
#
# 	Purpose: Process Copper Rockfish Landings
# 		to determine the % of landings
#			north of 40 10 Lat.
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

#-----------------------------------------------------------------------------------
# Load the Recreational Data
#-----------------------------------------------------------------------------------

# California - start to 1979, split north and south, split aligns with pt. concept.
ca_rec_hist = read.csv(paste0(dir, "/_ca/ca_hist_recreational_1928_1980_ej.csv"))

# California - has both mt and fish numbers (but the fish numbers have decimals)
ca_rec = read.csv(paste0(dir, "/_ca/ca_rec_catch_all_2005-2019_crfs.csv"))
ca_rec = ca_rec[ca_rec$Species.Name == "COPPER ROCKFISH", ]

ca_rec_early = read.csv(paste0(dir, "/_ca/mrfss_catch_estimates_1980_2004_final.csv"))
ca_rec_early = ca_rec_early[ca_rec_early$AGENCY_CODE == 6 & ca_rec_early$SPECIES_NAME == "Copper Rockfish", ]
ca_rec_early = ca_rec_early[ca_rec_early$YEAR_ != 1980, ]
# The column A+B1 should represent retained and discard mortality 

#-----------------------------------------------------------------------------------
# Load the Commercial Data
#-----------------------------------------------------------------------------------

# PacFIN Commercial
load(file.path(dir, "COPP.CompFT.21.Feb.2021.RData"))
com = cleanColumns.catch(data[data$AGENCY_CODE == "C", ])
com = com[com$LANDING_YEAR < 2021, ]

# California Historical Catches
ca_com_hist = read.csv(file.path(dir, "_ca", "ca_hist_commercial_1969_1980_ej.csv"))
ca_com_hist[is.na(ca_com_hist)] = 0

# Historical commercial not split north and south of pt. concep will need to adjust
ca_com_hist_early = read.csv(file.path(dir, "_ca", "ca_hist_commercial_1916_1968_ej.csv"))

#################################################################################################################
# Evaluate the recreational data first
#################################################################################################################

# California - RecFIN years - These data area split north and south at pt. conception already
ca_rec$areas = recfin_areas(data = ca_rec, 
			  area_grouping = list(c("CHANNEL", "SOUTH","BAY AREA", "WINE", "CENTRAL"), ("REDWOOD")), 
			  area_names  = c("south_4010", "north_4010"), 
			  column_name = "RecFIN.Port.Name")

# Do not know the correct field to sort north of 4010
# ca_rec_early$areas = recfin_areas(data = ca_rec_early, 
# 			  area_grouping = list("Northern California", "Southern California"), 
# 			  area_names  = c("north", "south"), 
# 			  column_name = "RECFIN_SUB_REGION_NAME")


south = aggregate(Total.Mortality.MT~RecFIN.Year+areas, 
	data = ca_rec[ca_rec$area == "south_4010",], drop = FALSE, FUN = sum)
north = aggregate(Total.Mortality.MT~RecFIN.Year+areas, 
	data = ca_rec[ca_rec$area == "north_4010",], drop = FALSE, FUN = sum)
all_by_year = cbind(south[,c(1,3)], 
					north[, 'Total.Mortality.MT'],
					north[, 'Total.Mortality.MT']/ (north[, 'Total.Mortality.MT']+south[, 'Total.Mortality.MT']))
colnames(all_by_year) = c('year', 'south_mt', 'north_mt', 'percent_north')

agg_all = aggregate(Total.Mortality.MT~areas, data = ca_rec, drop = FALSE, FUN = sum)
colnames(agg_all) = c('areas',  'catch_mt')
agg_all[agg_all$areas == "north_4010",'catch_mt']/sum(agg_all[,'catch_mt'])
# 0.02843676


# Commercial Catches
# Mel Mandrup (CDFW) also suggest looking by "PORT" because records listed from 
# PACFIN_PORT_NAME of "O HUMBOLDT" should be broken down as a finer scale for north and south
# which the PORT field will allow you to do. The PORTS that are north of 4010 from 
# PACFIN_PORT_NAME == "O HUMBOLDT" are c("GARBERVILLE", "RUTH", "SHELTER COVER", "MIRANDA").
# No landing records for copper are shown for "O HUMBOLDT".
com$area = "south"
com[com$PACFIN_PORT_NAME %in% c("EUREKA", "CRESCENT", "FIELDS LDG", "TRINIDAD"), 'area'] = 'north'

com_area = aggregate(ROUND_WEIGHT_MTONS ~ LANDING_YEAR + area, 
	data = com[com$LANDING_YEAR >=2005,], drop = FALSE, FUN = sum)
# The rec are split out from 2005 - 2020. Let's restrict to the same years for the 
# commercial landings

all_by_year_com = cbind(com_area[com_area$area == "south", c(1,3)], 
					com_area[com_area$area == "north", 'ROUND_WEIGHT_MTONS'],
					com_area[com_area$area == "north", 'ROUND_WEIGHT_MTONS']/ (com_area[com_area$area == "south", 'ROUND_WEIGHT_MTONS']+com_area[com_area$area == "north", 'ROUND_WEIGHT_MTONS']))
colnames(all_by_year_com) = c('year', 'south_mt', 'north_mt', 'percent_north')

agg_all_com = aggregate(ROUND_WEIGHT_MTONS ~ area, data = com[com$LANDING_YEAR >=2005,], drop = FALSE, FUN = sum)
colnames(agg_all_com) = c('areas',  'catch_mt')
agg_all_com[agg_all_com$area == "north",'catch_mt']/sum(agg_all_com[,'catch_mt'])


# > agg_all
#        areas catch_mt
# 1 north_4010   43.695
# 2 south_4010 1491.415
# > agg_all_com
#   areas  catch_mt
# 1 north  20.65815
# 2 south 103.44519

(agg_all[agg_all$areas == "north_4010", "catch_mt"] + agg_all_com[agg_all_com$areas == "north", "catch_mt"]) /
sum(agg_all[,"catch_mt"] + agg_all_com[, "catch_mt"])

# Across the catches from commercial and recreational between 2005 - 2020, 3.9% of the
# removals are calculated to be from north of 4010 in California.

# Looking over a shorter period 
aggregate(ROUND_WEIGHT_MTONS ~ area, data = com[com$LANDING_YEAR >=2010,], drop = FALSE, FUN = sum)
aggregate(Total.Mortality.MT~areas, data = ca_rec[ca_rec$RecFIN.Year >= 2010,], drop = FALSE, FUN = sum)

# aggregate(ROUND_WEIGHT_MTONS ~ area, data = com[com$LANDING_YEAR >=2010,], drop = FALSE, FUN = sum)
#  area ROUND_WEIGHT_MTONS
# north           11.67139
# south           88.22766
# aggregate(Total.Mortality.MT~areas, data = ca_rec[ca_rec$RecFIN.Year >= 2010,], drop = FALSE, FUN = sum)
#      areas Total.Mortality.MT
# north_4010             34.121
# south_4010           1215.660

(11.67139 + 34.121) / (1215.660 + 88.22766 + 34.121 + 11.67139)
# 3.4% from 2010-2020