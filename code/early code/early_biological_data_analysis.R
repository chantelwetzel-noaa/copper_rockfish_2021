#############################################################
#############################################################
# 
#	Evaluate biological data in prep for 2021 assessments
#				by: Chantel Wetzel
#					8/05/2020
#
#############################################################
#############################################################
library(ggplot2)
options(stringsAsFactors = TRUE)
library(HandyCode)

dir = "N://Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/recreational_comps"

wa = read.csv(paste0(dir, "/wetzel_wa_comp_bio_age_inventory_20200117.csv"))
or = read.csv(paste0(dir, "/wetzel_or_comp_bio_age_inventory_20200117.csv"))
ca = read.csv(paste0(dir, "/wetzel_ca_comp_bio_age_inventory_20200117.csv"))

species = c("COPPER ROCKFISH")
species_name = tolower(species)

setwd(dir)

subwa = wa[wa$SPECIES_NAME %in% species, ]
subor = or[or$SPECIES_NAME %in% species, ]
subca = ca[ca$SPECIES_NAME %in% species, ]

# Will likely want to have a split North & South of Point Conception
subca$area = NA
find = c(grep("SOUTH", subca$RECFIN_PORT_NAME), grep("CHANNEL", subca$RECFIN_PORT_NAME))
subca$area[find] = "ca_s_pt_c"
subca$area[-find] = "ca_n_pt_c"
subor$area = "or"
subwa$area = "wa"

all = rbind(subwa, subor, subca)

# Remove improper areas
# All of Washington records are from "NOT KNOWN" areas so keeping those
all = all[all$RECFIN_WATER_AREA_NAME %in% c("OCEAN", "OCEAN > 3 MILES", "OCEAN <= 3 MILES", "NOT KNOWN"), ]

newca_or = read.csv(paste0(dir, "/copper_ca_or_SD051--1980-2019_1.csv"))
newwa = read.csv(paste0(dir, "/copper_wa_SD051-Washington-1980-2019.csv"))
new_all = rbind(newca_or, newwa)
new_all = new_all[new_all$AGENCY_WATER_AREA_NAME %in% c("OCEAN", "OCEAN > 3 MILES",  "OCEAN <= 3 MILES", "NOT KNOWN"), ]

v2 = table(new_all$RECFIN_YEAR, new_all$STATE_NAME)
v1 = table(all$RECFIN_YEAR, all$STATE_NAME)

pngfun(wd = getwd(), file = paste0('copper_comparison_recfin.png'), h = 12, w = 12)
par(mfrow = c(3,1))
plot(rownames( v1), v1[,"WASHINGTON"], type = 'l', lwd = 2)
lines(rownames(v2), v2[,"WASHINGTON"], lty = 2, lwd = 2, col = 'red')
legend('topleft', legend = c("My Pull", "Jason's Pull"), col = c("red", 1), lty = c(2,1), bty = 'n', lwd = 2)
plot(rownames( v1), v1[,"OREGON"], type = 'l', lwd = 2)
lines(rownames(v2), v2[,"OREGON"], lty = 2, lwd = 2, col = 'red')
plot(rownames( v1), v1[,"CALIFORNIA"], type = 'l', lwd = 2)
lines(rownames(v2), v2[,"CALIFORNIA"], lty = 2, lwd = 2, col = 'red')
dev.off()

# Determine the right lengths in cm
all = all[!is.na(all$AGENCY_LENGTH),]
all$length_cm = NA
find = which(all$AGENCY_LENGTH_UNITS == "C")
all$length_cm[find] = all$AGENCY_LENGTH[find]
find = which(all$AGENCY_LENGTH_UNITS == "M")
all$length_cm[find] = all$AGENCY_LENGTH[find] / 10
find = all$AGENCY_LENGTH_UNITS == "" & all$AGENCY_LENGTH > 100
all$length_cm[find] = all$AGENCY_LENGTH[find] / 10
# only one 42 cm fish remaining, bring him along
find = is.na(all$length_cm)
all$length_cm[find] = all$AGENCY_LENGTH[find]
quantile(all$length_cm)
#  0%  25%  50%  75% 100% 
#11.8 30.5 35.9 40.9 64.6 

# Determine the weights
all$weight_kg = NA
all$weight_kg = all$AGENCY_WEIGHT
find = which(all$AGENCY_WEIGHT_UNITS == "K")
all$weight_kg[find] = all$AGENCY_WEIGHT[find]
find = which(all$AGENCY_WEIGHT_UNITS == "G")
all$weight_kg[find] = all$weight_kg[find] / 1000
all$weight_kg[find] = all$AGENCY_WEIGHT[find]
all[which(all$weight_kg > 5),"weight_kg"] = 0

table(all$RECFIN_YEAR, all$area)

###########################################################################
# Read in the RecFIN Ages
###########################################################################
ages = read.csv(paste0(dir, "/copper_recfin_ages_SD056--1980-2019.csv"))
ages$length_cm = ages$RECFIN_LENGTH_MM / 10
plot(ages$length_cm, ages$RECFIN_LENGTH_MM)

##########################################################################
# Copper rockfish
##########################################################################
# maximum length = 66 cm
# Copper weight = 0.0172*length^3.018 (sexes combined FL, cm, gr)
# Max age ~ 50 years based on Hamel M ~ 0.108
all$pred_wght = NA
all$pred_wght[find] = (0.0172/1000) * all$length_cm[find] ^ 3.018
# W = 0.0078 * length ^3.147 sexes combined TL, cm, gr

cols <- c("red", "orange", "blue", "purple")
cols <- adjustcolor(cols, alpha.f <- 0.60)

# The length-at-age parameters are from Love
Linf = 45.6;  k = 0.10; t0 = -3.7
maxL = quantile(all$length_cm, 0.9999)
maxW = quantile(all$weight_kg, 1, na.rm = TRUE)

pngfun(wd = getwd(), file = paste0('copper_biology_recfin.png'), h = 12, w = 12)
par(mfrow = c(2,1))
plot(0,  ylim = c(0, maxW), xlim = c(0, maxL), col = cols[1], xlab = "Length (cm)", ylab = "Weight (kg)", main = species_name)
find = all$area == "ca_s_pt_c" & all$weight_kg != 0
points(all[find, "length_cm"], all[find, "weight_kg"], col = cols[1], pch = 16)
find = all$area == "ca_n_pt_c" & all$weight_kg != 0
points(all[find, "length_cm"], all[find, "weight_kg"], col = cols[2], pch = 16)
find = all$or == "or" & all$weight_kg != 0
points(all[find, "length_cm"], all[find, "weight_kg"], pch = 16, col = cols[3])
find = all$area == "wa" & all$weight_kg != 0
points(all[find, "length_cm"], all[find, "weight_kg"], pch = 16, col = cols[4])
lines(seq(0,70,1), (0.0172/1000)*seq(0,70,1)^3.018, lwd = 3)
legend("topleft", legend = c("South CA", "North CA", "OR", "WA"), bty = 'n', col = cols, pch = 16)

latage = Linf * (1 - exp(-k * (1:50 - t0)))
copper = cbind(1:50, latage)
plot(0, type = 'l', lwd = 2, xlab = "Age", ylab = "Length (cm)", xlim = c(0, 50), ylim = c(0, maxL))
find = ages$SAMPLING_AGENCY_NAME == "WDFW"
points(ages[find, "USE_THIS_AGE"], ages[find, "length_cm"], col = cols[3], pch = 16)
find = ages$SAMPLING_AGENCY_NAME == "ODFW"
points(ages[find, "USE_THIS_AGE"], ages[find, "length_cm"], col = cols[2], pch = 16)
lines(1:50, latage, lwd = 3)
legend("topleft", legend = c("OR", "WA"), bty = 'n', col = cols[3:4], pch = 16)
dev.off()

# Evaluate the available length samples by state
pngfun(wd = getwd(), file = paste0('copper_samples_s_ca_recfin.png'), h = 12, w = 12)
find = all$area == "ca_s_pt_c"
ggplot(all[find,], aes(x = length_cm)) + 
		geom_histogram() + #facet_grid(~ RECFIN_YEAR) + 
		facet_wrap(facets = c("RECFIN_YEAR", "area"), nrow = 12, ncol = 5) +
		theme_bw() + stat_bin(bins = 60, binwidth = 2)
dev.off()

pngfun(wd = getwd(), file = paste0('copper_samples_n_ca_recfin.png'), h = 12, w = 12)
find = all$area == "ca_n_pt_c"
ggplot(all[find,], aes(x = length_cm)) + 
		geom_histogram() + #facet_grid(~ RECFIN_YEAR) + 
		facet_wrap(facets = c("RECFIN_YEAR", "area"), nrow = 12, ncol = 5) +
		theme_bw() + stat_bin(bins = 60, binwidth = 2)
dev.off()

pngfun(wd = getwd(), file = paste0('copper_samples_or_recfin.png'), h = 12, w = 12)
find = all$STATE_NAME == "OREGON"
ggplot(all[find,], aes(x = length_cm)) + 
		geom_histogram() + #facet_grid(~ RECFIN_YEAR) + 
		facet_wrap(facets = c("RECFIN_YEAR", "AGENCY"), nrow = 12, ncol = 5) +
		theme_bw() + stat_bin(bins = 60, binwidth = 2)
dev.off()

pngfun(wd = getwd(), file = paste0('copper_samples_wa_recfin.png'), h = 12, w = 12)
find = all$STATE_NAME == "WASHINGTON"
ggplot(all[find,], aes(x = length_cm)) + 
		geom_histogram() + #facet_grid(~ RECFIN_YEAR) + 
		facet_wrap(facets = c("RECFIN_YEAR", "AGENCY"), nrow = 12, ncol = 5) +
		theme_bw() + stat_bin(bins = 60, binwidth = 2)
dev.off()

###########################################################################################################
# Create table of samples by area and year
###########################################################################################################

temp = all[!is.na(all$length_cm) & all$RECFIN_YEAR < 2021,]

# Once I figure out how to parse by finer area this next line should be replaced
temp$strat = temp$area

Nfish = table(temp$RECFIN_YEAR, temp$strat)

write.csv(Nfish, file = file.path(getwd(),"RecFIN_Length_Samples.csv"), row.names = TRUE)


temp = ages[!is.na(ages$USE_THIS_AGE),]
Nfish = table(temp$SAMPLE_YEAR, temp$SAMPLING_AGENCY_NAME)
write.csv(Nfish, file = file.path(getwd(),"RecFIN_Age_Samples.csv"), row.names = TRUE)

##################################################################################################
#
#	PacFIN Data!
#
##################################################################################################


dir = "N://Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/commercial_comps"
setwd(dir)
load(paste0(dir, "/PacFIN.COPP.bds.24.Jul.2020.RData"))

data = PacFIN.COPP.bds.24.Jul.2020
data$length_cm = data$FISH_LENGTH / 10

keep_INPFC = c("VUS","CL","VN","COL","NC","SC","EU","CP","EK","MT","PS")
# Need to determine how best to split north and south of conception

# Evaluate the available length samples by state
pngfun(wd = getwd(), file = paste0('copper_samples_ca_pacfin.png'), h = 12, w = 12)
find = data$SOURCE_AGID == "C"
ggplot(data[find,], aes(x = length_cm)) + 
		geom_histogram() + #facet_grid(~ RECFIN_YEAR) + 
		facet_wrap(facets = c("SAMPLE_YEAR", "SOURCE_AGID"), nrow = 12, ncol = 5) +
		theme_bw() + stat_bin(bins = 60, binwidth = 2)
dev.off()

pngfun(wd = getwd(), file = paste0('copper_samples_or_pacfin.png'), h = 12, w = 12)
find = data$SOURCE_AGID == "O"
ggplot(data[find,], aes(x = length_cm)) + 
		geom_histogram() + #facet_grid(~ RECFIN_YEAR) + 
		facet_wrap(facets = c("SAMPLE_YEAR", "SOURCE_AGID"), nrow = 12, ncol = 5) +
		theme_bw() + stat_bin(bins = 60, binwidth = 2)
dev.off()

pngfun(wd = getwd(), file = paste0('copper_samples_wa_pacfin.png'), h = 12, w = 12)
find = data$SOURCE_AGID == "W"
ggplot(data[find,], aes(x = length_cm)) + 
		geom_histogram() + #facet_grid(~ RECFIN_YEAR) + 
		facet_wrap(facets = c("SAMPLE_YEAR", "SOURCE_AGID"), nrow = 12, ncol = 5) +
		theme_bw() + stat_bin(bins = 60, binwidth = 2)
dev.off()

###########################################################################################################
# Create table of samples by area and year
###########################################################################################################

temp = data[!is.na(data$length_cm) & data$SAMPLE_YEAR < 2021,]

# Once I figure out how to parse by finer area this next line should be replaced
temp$strat = temp$SOURCE_AGID

Nfish = table(temp$SAMPLE_YEAR, temp$strat)

aa = unique(temp$strat)
yy = sort(unique(temp$SAMPLE_YEAR))
Ntows = matrix(0, length(yy), length(aa))
for(y in 1:length(yy)){
	for(a in 1:length(aa)){
		ind = which(temp$SAMPLE_YEAR == yy[y] & temp$strat == aa[a])
		if(length(ind) > 0) {Ntows[y, a] = length(unique(temp$SAMPLE_NO[ind])) }
	}
}
colnames(Ntows) = aa
rownames(Ntows) = yy

samples = NULL
for (a in 1:length(aa)){
	samples = cbind(samples, Ntows[,aa[a]], Nfish[,aa[a]])
}

samples = cbind(Ntows[,"C"], Nfish[,"C"], 
			    Ntows[,"O"], Nfish[,"O"],
				Ntows[,"W"], Nfish[,"W"])

colnames(samples) = c("C_NTows", "C_Nfish", 
	 				  "O_NTows", "O_Nfish", 
	 				  "W_NTows", "W_Nfish")

write.csv(samples, file = file.path(getwd(),"PacFIN_Length_Samples.csv"), row.names = TRUE)

# Now lets do ages in PacFIN

temp = data[!is.na(data$FISH_AGE_YEARS_FINAL) & data$SAMPLE_YEAR < 2021,]
# There are no ages under the FISH AGE YEAR FINAL column