########################################################
# Create Sensitivity table for Copper Rockfish 2021
#   written by : Chantel Wetzel
########################################################

library(r4ss)
#devtools::install_github("r4ss/r4ss", ref = "development")
#devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/r4ss")


###################################################################
# Washington 
###################################################################
area = "wa"
base_model = 

wd = file.path("C:/Assessments/2021/coper_rockfish_2021/models", 
          area, "_sensitivities")
setwd(wd)

out.dir = paste0(wd, "/tables")

base.loc = file.path("C:/Assessments/2021/copper_rockfish_2021/models",
           area, base_model)

model.list <- c(paste0(base_model, "_low_m"),  #1     
                paste0(base_model, "_high_m"), #2
                paste0(base_model, "_low_lmax"), #3
                paste0(base_model, "_high_lmax"), #4
				        paste0(base_model, "_mi"), #5
                paste0(base_model, "_dirichlet"),  #6
                paste0(base_model, "_sss")) #7

out.list = NULL	
base   = SS_output( base.loc, printstats = FALSE, verbose = FALSE) 
sens_1  = SS_output( paste0(wd, model.list[1]), printstats = FALSE, verbose = FALSE, covar = FALSE) 
sens_2  = SS_output( paste0(wd, model.list[2]), printstats = FALSE, verbose = FALSE, covar = FALSE) 
sens_3  = SS_output( paste0(wd, model.list[3]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_4  = SS_output( paste0(wd, model.list[4]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_5  = SS_output( paste0(wd, model.list[5]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_6  = SS_output( paste0(wd, model.list[6]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_7  = SS_output( paste0(wd, model.list[7]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_8  = SS_output( paste0(wd, model.list[8]), printstats = FALSE, verbose = FALSE, covar = FALSE)

modelnames <- c("Base Model",
                "Low M", 
                "High M", 
                "Low Linf",
                "High Linf",
                "Estimate Rec. Devs.",
                "MI Data Weighting",
                "Dirichlet Data Weighting",
                "SSS") 

x <- SSsummarize(list(base, sens_1, sens_2, sens_3, sens_4, sens_5, 
                 sens_6, sens_7, sens_8))

SSplotComparisons(x, endyrvec = 2021, 
                  legendlabels = modelnames, 
                  plotdir = getwd(), 
                  legendloc = "topright", 
                  subplot = c(2,4), 
                  print = TRUE, 
                  pdf = FALSE)

file.rename(paste0(getwd(),"/compare4_Bratio_uncertainty.png"), paste0(getwd(),"/plots/depl_sens.png"))
file.rename(paste0(getwd(),"/compare2_spawnbio_uncertainty.png"), paste0(getwd(),"/plots/ssb_sens.png"))

###################################################################################
# Create a Table of Results
###################################################################################

ii = 1:length(modelnames)
n = length(modelnames)
out<- matrix(NA, 24, max(ii))

out = rbind(
            as.numeric(x$likelihoods[x$likelihoods$Label == "TOTAL",1:n]), 
            as.numeric(x$likelihoods[x$likelihoods$Label == "Survey",1:n]), 
            as.numeric(x$likelihoods[x$likelihoods$Label == "Length_comp",1:n]),
            as.numeric(x$likelihoods[x$likelihoods$Label == "Age_comp",1:n]), 
            as.numeric(x$likelihoods[x$likelihoods$Label == "Recruitment",1:n]), 
            as.numeric(x$likelihoods[x$likelihoods$Label == "Forecast_Recruitment",1:n]),
            as.numeric(x$likelihoods[x$likelihoods$Label == "Parm_priors",1:n]),
            as.numeric(x$pars[x$pars$Label == "SR_LN(R0)", 1:n]), 
            as.numeric(x$SpawnBio[x$SpawnBio$Label == "SSB_Virgin", 1:n]),
            as.numeric(x$SpawnBio[x$SpawnBio$Label == "SSB_2021", 1:n]),
            as.numeric(x$Bratio[x$Bratio$Label == "Bratio_2021", 1:n]), 
            as.numeric(x$quants[x$quants$Label == "Dead_Catch_SPR", 1:n]),
            as.numeric(x$pars[x$pars$Label == "SR_BH_steep", 1:n]),
            as.numeric(x$pars[x$pars$Label == "NatM_p_1_Fem_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "L_at_Amin_Fem_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "L_at_Amax_Fem_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "VonBert_K_Fem_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "CV_young_Fem_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "CV_old_Fem_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "NatM_p_1_Mal_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "L_at_Amin_Mal_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "L_at_Amax_Mal_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "VonBert_K_Mal_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "CV_young_Mal_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "CV_old_Mal_GP_1", 1:n]) )  

out = as.data.frame(out)
colnames(out) = modelnames
rownames(out) = c("Total Likelihood",
                  "Survey Likelihood",
                  "Length Likelihood",
                  "Age Likelihood",
                  "Recruitment Likelihood",
                  "Forecast Recruitment Likelihood",
                  "Parameter Priors Likelihood",
                  "log(R0)",
                  "SB Virgin",
                  "SB 2020",
                  "Fraction Unfished 2021",
                  "Total Yield - SPR 50",
                  "Steepness",
                  "Natural Mortality - Female",
                  "Length at Amin - Female",
                  "Length at Amax - Female",
                  "Von Bert. k - Female",
                  "CV young - Female",
                  "CV old - Female",
                  "Natural Mortality - Male",
                  "Length at Amin - Male",
                  "Length at Amax - Male",
                  "Von Bert. k - Male",
                  "CV young - Male",
                  "CV old - Male")


write.csv(out, file = paste0(out.dir, "/Sensitivities.csv"))
