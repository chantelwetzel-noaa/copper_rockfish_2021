#############################################################
#############################################################
# 
#	Evaluate biological data in prep for 2021 assessments
#				by: Chantel Wetzel
#					8/05/2020
#       by: Brian Langseth
#         8/07/2020
#
#############################################################
#############################################################

analyze.recfin("QUILLBACK ROCKFISH",
               "L://Assessments//CurrentAssessments//DataModerate_2021//Quillback_Rockfish//data//RecFIN Sample Data",
               maxa = 90,
               alpha = 0.1/1000,
               beta = 2.5,
               linf = 41.8,
               vonbK = 0.07,
               t0 = -6.8)

analyze.recfin <- function(species, directory, maxa, alpha, beta, linf, vonbK , t0) {
  
  library(ggplot2)
  options(stringsAsFactors = TRUE)
  #library(HandyCode)
  
  #Set directory
  dir <- directory
  setwd(dir)
  
  species_name <- tolower(species)
  
  #Read in full data scripts
  load("wetzel_comp_bio_age_inventory_20200117.RData")
  
  ###########################################################################
  #Set up lengths and weights
  ###########################################################################
  
  #Use only data from desired species (squarespot dont show up in wa or or)
  subwa <- wa[wa$SPECIES_NAME %in% species, ]
  subor <- or[or$SPECIES_NAME %in% species, ]
  subca <- ca[ca$SPECIES_NAME %in% species, ]
  
  # Will likely want to have a split North & South of Point Conception
  subca$area <- NA
  find <- c(grep("SOUTH", subca$RECFIN_PORT_NAME), grep("CHANNEL", subca$RECFIN_PORT_NAME))
  subca$area[find] <- "ca_s_pt_c"
  subca$area[-find] <- "ca_n_pt_c"
  if(species_name != "squarespot rockfish"){
    subor$area <- "or"
    subwa$area <- "wa"
  }
  
  #Combine data for all states
  all <- rbind(subwa, subor, subca)
  
  # Remove improper areas (non ocean or not known areas)
  # All of Washington records are from "NOT KNOWN" areas so keeping those
  all <- all[grepl("OCEAN", all$RECFIN_WATER_AREA_NAME) | grepl("NOT KNOWN", all$RECFIN_WATER_AREA_NAME), ]
  
  # Determine the right lengths in cm
  # First check if any lengths are fork length
  all <- all[!is.na(all$AGENCY_LENGTH),]
  if(dim(table(all$AGENCY_LENGTH_TYPE)>0)) print("There is a mix of fork and total lengths")
  # Now determine the lengths in cm
  all$length_cm <- NA
  find <- all$AGENCY_LENGTH_UNITS == "C"
  all$length_cm[find] <- all$AGENCY_LENGTH[find]
  find <- all$AGENCY_LENGTH_UNITS == "M"
  all$length_cm[find] <- all$AGENCY_LENGTH[find] / 10
  find <- all$AGENCY_LENGTH_UNITS == "" & all$AGENCY_LENGTH > 100
  all$length_cm[find] <- all$AGENCY_LENGTH[find] / 10
  find <- is.na(all$length_cm)
  all$length_cm[find] <- all$RECFIN_LENGTH_MM[find] / 10 #If no info, then use assumption by RecFIN
  print("Quantiles of lengths (cm):")
  print(quantile(all$length_cm))

  # Determine the weights in kg
  all$weight_kg <- all$AGENCY_WEIGHT
  find <- which(all$AGENCY_WEIGHT_UNITS == "K")
  all$weight_kg[find] <- all$AGENCY_WEIGHT[find]
  find <- which(all$AGENCY_WEIGHT_UNITS == "G")
  all$weight_kg[find] <- all$weight_kg[find] / 1000
  #all[which(all$weight_kg > 5),"weight_kg"] = 0
  plot(all$weight_kg, all$RECFIN_IMPUTED_WEIGHT_KG)
  
  #Output table of sample size of lengths by year
  print("Number of lengths by year and area")
  print(table(all$RECFIN_YEAR, all$area))
  
  ###########################################################################
  # Read in the RecFIN Ages
  ###########################################################################
  if(species_name != "squarespot rockfish"){
    ages = read.csv(paste0(dir,"/",strsplit(species_name," ")[[1]][1],"_recfin_ages_SD056--1980-2019.csv"))
    ages$length_cm = ages$RECFIN_LENGTH_MM / 10
  }
  
  ##########################################################################
  # Length-weight relationship, Age-Length relationship, and Length Comps
  ##########################################################################
  
  #Predicted weight based on W-L relationship for TL in cm to kg
  all$pred_wght = NA
  all$pred_wght = alpha * all$length_cm ^ beta
  
  cols <- c("red", "orange", "blue", "purple")
  cols <- adjustcolor(cols, alpha.f <- 0.40)
  
  maxL = quantile(all$length_cm, 0.9999)
  maxW = quantile(all$weight_kg, 1, na.rm = TRUE)
  
  #Plot of W-L across areas
  png(filename = paste0(strsplit(species_name," ")[[1]][1],'_biology_recfin.png'), height = 7, width = 7, units = "in", res = 300)
  par(mfrow = c(2,1))
  plot(0, type="n", ylim = c(0, maxW), xlim = c(0, maxL), col = cols[1], xlab = "Length (cm)", ylab = "Weight (kg)", main = species_name)
  for(i in 1:length(unique(all$area))){
    find = all$area == unique(all$area)[i] & all$weight_kg != 0
    points(all[find, "length_cm"], all[find, "weight_kg"], col = cols[i], pch = 16)
  }
  legend("topleft", legend = c("South CA", "North CA", "OR", "WA"), bty = 'n', col = cols, pch = 16)
  
  #Plot of age-L across agency
  latage = linf * (1 - exp(-vonbK * (1:maxa - t0)))
  latage_table = cbind(1:maxa, latage)
  plot(0, type = 'l', lwd = 2, xlab = "Age", ylab = "Length (cm)", xlim = c(0, maxa), ylim = c(0, maxL), main = "Data from SD056")
  if(species_name != "squarespot rockfish"){
    for(i in 1:length(levels(ages$SAMPLING_AGENCY_NAME))){
      find = ages$SAMPLING_AGENCY_NAME == levels(ages$SAMPLING_AGENCY_NAME)[i]
      points(ages[find, "USE_THIS_AGE"], ages[find, "length_cm"], col = cols[i], pch = 16)
    }
    lines(1:maxa, latage, lwd = 3)
    legend("topleft", legend = levels(ages$SAMPLING_AGENCY_NAME), bty = 'n', col = cols[1:i], pch = 16)
  }
  dev.off()
  
  # Evaluate the available length samples by state
  for(i in 1:length(unique(all$area))){
    png(filename = paste0(strsplit(species_name," ")[[1]][1],"_samples_",unique(all$area)[i],"_recfin.png"), height = 7, width = 7, units = "in", res = 300)
    find = all$area == unique(all$area)[i]
    print(ggplot(all[find,], aes(x = length_cm)) + 
  		  geom_histogram() + #facet_grid(~ RECFIN_YEAR) + 
  		  facet_wrap(facets = c("RECFIN_YEAR", "AGENCY"), nrow = 12, ncol = 5) +
  		  theme_bw() + stat_bin(bins = 60, binwidth = 2))
    dev.off()
  }
}
