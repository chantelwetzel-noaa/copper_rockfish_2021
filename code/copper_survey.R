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

dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/"


############################################################################################
#	Load the Survey Data
############################################################################################

hkl = read.csv(file.path(dir, "data", "survey", "qryGrandUnifiedThru2019_06182020.csv"))
sub_hkl = hkl[hkl$COMNAME == 'Copper Rockfish', ]
sub_hkl = rename_hook_and_line(data = sub_hkl, survey_name = "nwfsc_hkl")


load(file.path(dir, "survey", "wcgbts", "Catch__NWFSC.Combo_2020-08-13.rda"))
load(file.path(dir, "survey", "wcgbts", "Bio_All_NWFSC.Combo_2020-08-14.rda"))
catch = Out
bio = Data

plot_cpue_fn(dir = file.path(dir, "survey", "wcgbts", "plots"), 
			 name = "Copper rockfish", 
			 catch = catch, bio = bio, 
			 plot = 1:3, n = 20000)

# Start with the NWFSC WCGBTS data
strata = CreateStrataDF.fn(names=c("shallow_s", "mid_s", "shallow_n", "mid_n"), 
                           depths.shallow = c( 55, 100, 55, 100),
                           depths.deep    = c(100, 183, 100, 183),
                           lats.south     = c(32.5, 32.5, 36.0, 36.0),
                           lats.north     = c(36.0, 36.0, 42.0, 42.0))


num.strata = CheckStrata.fn(dir = file.path(dir, "survey", "wcgbts"), 
							dat = catch, 
							strat.vars = c("Depth_m","Latitude_dd"), 
							strat.df = strata, 
              printfolder = "forSS",  
							verbose = TRUE)

# Calculate the design based index
biomass.nwfsc = Biomass.fn(dir = file.path(dir, "survey", "wcgbts"), 
						   dat = catch,  
						   strat.df = strata, 
						   printfolder = "forSS", 
						   outputMedian = T) 

# Plot the biomass index
PlotBio.fn(dir = file.path(dir, "survey", "wcgbts"), dat = biomass.nwfsc, main = "NWFSC WCGBTS", dopng = TRUE)

len = bio
len.bins = seq(10, 54, 2)

# Calculate the effN
n = GetN.fn(dir = file.path(dir, "survey", "wcgbts"), dat = len, type = "length", 
            species = "others", printfolder = "forSS")

# This version assigns unsexed fish to a sex - but may not want to do it that way
# See below for alternative versions
LFs <- SurveyLFs.fn(dir = file.path(dir, "survey", "wcgbts"), 
					          datL = len, datTows = catch,  
                    strat.df = strata, lgthBins = len.bins, sex = 3, 
                    month = 7, fleet = 3, 
                    sexRatioStage = 2, sexRatioUnsexed = 0.5, maxSizeUnsexed = 16, 
                    nSamps = n)

PlotFreqData.fn(dir = file.path(dir, "survey", "wcgbts"), 
	              dat = LFs, ylim=c(0, max(len.bins) + 4), inch = 0.10,
                main = "NWFSC WCGBTS", yaxs="i", ylab="Length (cm)", dopng = TRUE)

PlotSexRatio.fn(dir = file.path(dir, "survey", "wcgbts"), dat = len, data.type = "length", dopng = TRUE, main = "NWFSC WCGBTS")

#####################################################################################
#
# NWFSC Hook & Line Data
#
#####################################################################################
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

sub_hkl[sub_hkl$Sex == "F", "Length"]

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


