###################################################################################
#
#	Copper rockfish 
# Trawl survey exploration and processing
#
#############################################################################################

devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/nwfscSurvey")
source("C:/Users/Chantel.Wetzel/Documents/GitHub/HandyCode/R/pdf_fxn.R")
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/dataModerate_2021")
source("C:/Users/Chantel.Wetzel/Documents/GitHub/survey_summary_package/R/plot_cpue.R")
#source("C:/Assessments/2020/survey_summary/code_package/functions/plot_cpue.R")

dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data"


############################################################################################
#	Load the Survey Data
############################################################################################

hkl = read.csv(file.path(dir, "survey", "qryGrandUnifiedThru2019_06182020.csv"))
sub_hkl = hkl[hkl$COMNAME == 'Copper Rockfish', ]
sub_hkl = rename_hook_and_line(data = sub_hkl, survey_name = "nwfsc_hkl")


load(file.path(dir, "survey", "wcgbts", "Catch__NWFSC.Combo_2020-08-13.rda"))
load(file.path(dir, "survey", "wcgbts", "Bio_All_NWFSC.Combo_2020-08-14.rda"))
catch = Out
bio = Data

# Split the data North and South of Pt. Conception
south_catch = catch[catch$Latitude_dd < 34.5, ]
south_bio = bio[bio$Latitude_dd < 34.5, ]
north_catch = catch[catch$Latitude_dd >= 34.5, ]
north_bio = bio[bio$Latitude_dd >= 34.5, ]

plot_cpue_fn(dir = file.path(dir, "survey", "wcgbts", "plots"), 
			 name = "Copper rockfish - North", 
			 catch = north_catch, bio = north_bio, 
			 plot = 1:3, n = 20000)

plot_cpue_fn(dir = file.path(dir, "survey", "wcgbts", "plots"), 
       name = "Copper rockfish- South", 
       catch = south_catch, bio = south_bio, 
       plot = 1:3, n = 20000)

# Start with the NWFSC WCGBTS data
strata_north = CreateStrataDF.fn(names=c("shallow"), 
                           depths.shallow = c(  55),
                           depths.deep    = c( 183),
                           lats.south     = c(34.5),
                           lats.north     = c(42.0))

strata_south = CreateStrataDF.fn(names=c("shallow"), 
                           depths.shallow = c( 55),
                           depths.deep    = c(183),
                           lats.south     = c(32.5),
                           lats.north     = c(34.5))

num.strata = CheckStrata.fn(dir = file.path(dir, "survey", "wcgbts"), 
							dat = north_catch, 
							strat.vars = c("Depth_m","Latitude_dd"), 
							strat.df = strata_north, 
              printfolder = "forSS",  
							verbose = TRUE)
file.rename(file.path(dir, "survey", "wcgbts", "forSS", "strata_observations.csv"),
            file.path(dir, "survey", "wcgbts", "forSS", "north_strata_observations.csv"))


num.strata = CheckStrata.fn(dir = file.path(dir, "survey", "wcgbts"), 
              dat = south_catch, 
              strat.vars = c("Depth_m","Latitude_dd"), 
              strat.df = strata_south, 
              printfolder = "forSS",  
              verbose = TRUE)
file.rename(file.path(dir, "survey", "wcgbts", "forSS", "strata_observations.csv"),
            file.path(dir, "survey", "wcgbts", "forSS", "south_strata_observations.csv"))

# Calculate the design based index
biomass.nwfsc = Biomass.fn(dir = file.path(dir, "survey", "wcgbts"), 
						   dat = north_catch,  
						   strat.df = strata_north, 
						   printfolder = "forSS", 
						   outputMedian = T) 
file.rename(file.path(dir, "survey", "wcgbts", "forSS", "design_based_indices.csv"),
            file.path(dir, "survey", "wcgbts", "forSS", "north_design_based_indices.csv"))


# Plot the biomass index
PlotBio.fn(dir = file.path(dir, "survey", "wcgbts"), 
    dat = biomass.nwfsc, main = "NWFSC WCGBTS - North", dopng = TRUE)

# Calculate the design based index
biomass.nwfsc = Biomass.fn(dir = file.path(dir, "survey", "wcgbts"), 
               dat = south_catch,  
               strat.df = strata_south, 
               printfolder = "forSS", 
               outputMedian = T) 
file.rename(file.path(dir, "survey", "wcgbts", "forSS", "design_based_indices.csv"),
            file.path(dir, "survey", "wcgbts", "forSS", "south_design_based_indices.csv"))


# Plot the biomass index
PlotBio.fn(dir = file.path(dir, "survey", "wcgbts"), 
    dat = biomass.nwfsc, main = "NWFSC WCGBTS - South", dopng = TRUE)


###################################################################################
south_len = south_bio
north_len = north_bio
len.bins = len_bin = seq(10, 54, 2)

# Calculate the effN
n = GetN.fn(dir = file.path(dir, "survey", "wcgbts"), dat = south_len, type = "length", 
            species = "others", printfolder = "forSS")
file.rename(file.path(dir, "survey", "wcgbts", "forSS", "length_SampleSize.csv"),
            file.path(dir, "survey", "wcgbts", "forSS", "south_length_SampleSize.csv"))


# This version assigns unsexed fish to a sex 
# Going to do this since all small fish are unsexed
LFs <- SurveyLFs.fn(dir = file.path(dir, "survey", "wcgbts"), 
					          datL = south_len, datTows = south_catch,  
                    strat.df = strata_south, lgthBins = len.bins, sex = 3, 
                    month = 7, fleet = 3, 
                    sexRatioStage = 2, sexRatioUnsexed = 0.5, maxSizeUnsexed = 20, 
                    nSamps = n)
file.rename(file.path(dir, "survey", "wcgbts", "forSS", "Survey_Sex3_Bins_10_54_LengthComps.csv"),
            file.path(dir, "survey", "wcgbts", "forSS", "south_Survey_Sex3_Bins_10_54_LengthComps.csv"))
file.rename(file.path(dir, "survey", "wcgbts", "forSS", "Survey_Sex3_Bins_-999_54_LengthComps.csv"),
            file.path(dir, "survey", "wcgbts", "forSS", "south_Survey_Sex3_Bins_-999_54_LengthComps.csv"))

PlotFreqData.fn(dir = file.path(dir, "survey", "wcgbts"), 
	              dat = LFs, ylim=c(0, max(len.bins) + 4), inch = 0.10,
                main = "NWFSC WCGBTS - South ", yaxs="i", ylab="Length (cm)", dopng = TRUE)

PlotSexRatio.fn(dir = file.path(dir, "survey", "wcgbts"), dat = south_len, data.type = "length", dopng = TRUE, main = "NWFSC WCGBTS - South")

# Northern Lengths
# Calculate the effN
n = GetN.fn(dir = file.path(dir, "survey", "wcgbts"), dat = north_len, type = "length", 
            species = "others", printfolder = "forSS")
file.rename(file.path(dir, "survey", "wcgbts", "forSS", "length_SampleSize.csv"),
            file.path(dir, "survey", "wcgbts", "forSS", "north_length_SampleSize.csv"))

# Errors on 2011 - removing the single record
# rm = which(north_len$Year == 2011)
# north_len[-rm, ]
# Not enough observations to apply sex ratio
LFs <- SurveyLFs.fn(dir = file.path(dir, "survey", "wcgbts"), 
                    datL = north_len, datTows = north_catch,  
                    strat.df = strata_north, lgthBins = len.bins, sex = 3, 
                    month = 7, fleet = 3, 
                    sexRatioStage = 1, sexRatioUnsexed = 0.5, maxSizeUnsexed = 20,
                    nSamps = n)
file.rename(file.path(dir, "survey", "wcgbts", "forSS", "Survey_Sex3_Bins_10_54_LengthComps.csv"),
            file.path(dir, "survey", "wcgbts", "forSS", "north_Survey_Sex3_Bins_10_54_LengthComps.csv"))
file.rename(file.path(dir, "survey", "wcgbts", "forSS", "Survey_Sex3_Bins_-999_54_LengthComps.csv"),
            file.path(dir, "survey", "wcgbts", "forSS", "north_Survey_Sex3_Bins_-999_54_LengthComps.csv"))

LFs = read.csv(file.path(dir, "survey", "wcgbts", "forSS", "north_Survey_Sex3_Bins_10_54_LengthComps.csv"))
PlotFreqData.fn(dir = file.path(dir, "survey", "wcgbts"), 
                dat = LFs, ylim=c(0, max(len.bins) + 4), inch = 0.10,
                main = "NWFSC WCGBTS - North ", yaxs="i", ylab="Length (cm)", dopng = TRUE)

PlotSexRatio.fn(dir = file.path(dir, "survey", "wcgbts"), dat = north_len, data.type = "length", dopng = TRUE, main = "NWFSC WCGBTS - North")



#####################################################################################
#
# NWFSC Hook & Line Data
#
#####################################################################################
sub_hkl$Trawl_id = sub_hkl$Set.ID
sub_hkl$Length_cm = sub_hkl$Length
n = GetN.fn(dir = dir, dat = sub_hkl, type = "length", species = "others", printfolder = "forSS")

a = table(sub_hkl$Year, sub_hkl$Sex)
plot(2004:2019, a[,"F"] / (a[,"F"] + a[,"M"]), ylim = c(0,1), type = 'b')
abline(h = 0.50, col = 'red', lty = 2)

aggregate(Length~Sex, data = sub_hkl, FUN = quantile)
b = aggregate(Length~Year + Sex, data = sub_hkl, FUN = quantile)
plot(b[b$Sex == "F", "Year"], b[b$Sex == "F", "Length"][,"50%"], type = 'b', col = 'red', ylim = c(20, 50))
lines(b[b$Sex == "M", "Year"], b[b$Sex == "M", "Length"][,"50%"], col = 'blue')
points(b[b$Sex == "M", "Year"], b[b$Sex == "M", "Length"][,"50%"], col = 'blue')
lines(b[b$Sex == "F", "Year"], b[b$Sex == "F", "Length"][,"100%"], lty = 2, col = 'red')
lines(b[b$Sex == "M", "Year"], b[b$Sex == "M", "Length"][,"100%"], lty = 2, col = 'blue')
lines(b[b$Sex == "F", "Year"], b[b$Sex == "F", "Length"][,"25%"], lty = 2, col = 'red')
lines(b[b$Sex == "M", "Year"], b[b$Sex == "M", "Length"][,"25%"], lty = 2, col = 'blue')


sub_hkl$Length_cm = sub_hkl$Length

lfs = UnexpandedLFs.fn(dir = file.path(dir, "data", "survey"), 
                       datL = sub_hkl, lgthBins = len_bin,
                       sex = 3, partition = 0, fleet = 2, month = 1)

file.rename(from = file.path(dir, "data", "survey", "forSS", "Survey_notExpanded_Length_comp_Sex_3_bin=10-54.csv"), 
      to= file.path(dir, "data", "survey", "forSS", "sca_hkl_notExpanded_Length_comp_Sex_3_bin=10-54.csv")) 
file.rename(from = file.path(dir, "data", "survey", "forSS", "Survey_notExpanded_Length_comp_Sex_0_bin=10-54.csv"), 
      to= file.path(dir, "data", "survey", "forSS", "sca_hkl_notExpanded_Length_comp_Sex_0_bin=10-54.csv")) 

PlotFreqData.fn(dir = file.path(dir, "data", "survey"), 
    dat = lfs$comps, ylim=c(0, max(len_bin) + 4), 
    main = "NWFSC HKL", yaxs="i", ylab="Length (cm)", dopng = TRUE)

PlotSexRatio.fn(dir = file.path(dir, "survey"), 
                dat = sub_hkl, data.type = "length", 
                dopng = TRUE, main = "NWFSC HKL")


# Split the CCA and non-CCA data 
cca_hkl = sub_hkl[sub_hkl$Areas == "CCA", ]
table(cca_hkl$Year, cca_hkl$Sex)

non_cca_hkl = sub_hkl[sub_hkl$Areas == "non_CCA", ]
table(non_cca_hkl$Year, non_cca_hkl$Sex)

non_cca_lfs = UnexpandedLFs.fn(dir = file.path(dir, "data", "survey"), 
                       datL = non_cca_hkl, lgthBins = len_bin,
                       sex = 3, partition = 0, fleet = 2, month = 1)

file.rename(from = file.path(dir, "data", "survey", "forSS", "Survey_notExpanded_Length_comp_Sex_3_bin=10-54.csv"), 
      to= file.path(dir, "data", "survey", "forSS", "sca_hkl_nonCCA_Length_comp_Sex_3_bin=10-54.csv")) 
file.rename(from = file.path(dir, "data", "survey", "forSS", "Survey_notExpanded_Length_comp_Sex_0_bin=10-54.csv"), 
      to= file.path(dir, "data", "survey", "forSS", "sca_hkl_nonCCA_Length_comp_Sex_0_bin=10-54.csv")) 

PlotFreqData.fn(dir = file.path(dir, "data", "survey"), 
    dat = non_cca_lfs$comps, ylim=c(0, max(len_bin) + 4), 
    main = "Non CCA NWFSC HKL", yaxs="i", ylab="Length (cm)", dopng = TRUE)

PlotSexRatio.fn(dir = file.path(dir, "data", "survey"), 
                dat = non_cca_hkl, data.type = "length", 
                dopng = TRUE, main = "Non CCA NWFSC HKL")


cca_lfs = UnexpandedLFs.fn(dir = file.path(dir, "data", "survey"), 
                       datL = cca_hkl, lgthBins = len_bin,
                       sex = 3, partition = 0, fleet = 2, month = 1)

file.rename(from = file.path(dir, "data", "survey", "forSS", "Survey_notExpanded_Length_comp_Sex_3_bin=10-54.csv"), 
      to= file.path(dir, "data", "survey", "forSS", "sca_hkl_CCA_Length_comp_Sex_3_bin=10-54.csv")) 
file.rename(from = file.path(dir, "data", "survey", "forSS", "Survey_notExpanded_Length_comp_Sex_0_bin=10-54.csv"), 
      to= file.path(dir, "data", "survey", "forSS", "sca_hkl_CCA_Length_comp_Sex_0_bin=10-54.csv")) 



#####################################################################################
#
# Try running VAST to see what that looks like
#
#####################################################################################

dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/"
wd = file.path(dir, "survey", "vast")
library(VASTWestCoast)

sci_name = "Sebastes_caurinus"

# This is probably not necessarily needed
strata.limits = data.frame('STRATA' = c("ca"), 
                          'south_border'   = c(32.0),
                          'north_border'   = c(42.0), 
                          'shallow_border' = c(  55), 
                          'deep_border'    = c(1280) )


obs_model = c(2,0) # do the gamma only for now


Sim_Settings <- list( "Species" = paste0("WCGBTS_", sci_name), 
                      "ObsModelcondition" = obs_model,
                      "nknots" = 250,
                      "depth" = c("no", "linear", "squared")[1],
                      "strata" = strata.limits,
                      "version" = "VAST_v5_4_0",
                      "Passcondition" = TRUE,
                      "overdisperion" = NULL
                      )
  
test <- VAST_condition(conditiondir = wd,
                       settings = Sim_Settings, 
                       spp = Sim_Settings$Species)

VAST_diagnostics(wd)


