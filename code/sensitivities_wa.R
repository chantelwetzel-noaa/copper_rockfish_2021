########################################################
# Create Sensitivity table for Copper Rockfish 2021
#   written by : Chantel Wetzel
########################################################

library(r4ss)
library(sa4ss)
#devtools::install_github("r4ss/r4ss", ref = "development")
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/r4ss")


###################################################################
# Washington 
###################################################################
area = "wa"
base_model = "7.0_base"
base_model = "7.7_base"

wd = file.path("C:/Assessments/2021/copper_rockfish_2021/models", 
          area, "_sensitivities")
setwd(wd)
out.dir = wd

base.loc = file.path("C:/Assessments/2021/copper_rockfish_2021/models",
           area, base_model)

model.list <- c(paste0(base_model, "_est_m"),  #1     
                paste0(base_model, "_est_linf"), #2
                paste0(base_model, "_est_k"), #3
                paste0(base_model, "_recdevs"), #4
                paste0(base_model, "_recdevs_dome"), #5
				        paste0(base_model, "_francis"), #6
                paste0(base_model, "_mi"), #
                paste0(base_model, "_dirichlet")) #9

out.list = NULL	
base   = SS_output( base.loc, printstats = FALSE, verbose = FALSE) 
sens_1  = SS_output( file.path(wd, model.list[1]), printstats = FALSE, verbose = FALSE, covar = FALSE) 
sens_2  = SS_output( file.path(wd, model.list[2]), printstats = FALSE, verbose = FALSE, covar = FALSE) 
sens_3  = SS_output( file.path(wd, model.list[3]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_4  = SS_output( file.path(wd, model.list[4]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_5  = SS_output( file.path(wd, model.list[5]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_6  = SS_output( file.path(wd, model.list[6]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_7  = SS_output( file.path(wd, model.list[7]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_8  = SS_output( file.path(wd, model.list[8]), printstats = FALSE, verbose = FALSE, covar = FALSE)

modelnames <- c("Base Model",
                "Estimate Rec. Devs.",
                "Estimate Rec. Devs. and Dome Selex",
                "Est. M (f)", 
                "Est. Linf (f)",
                "Est. k (f)")

                "Francis Data Weight",
                "MI Data Weight",
                "DM Data Weight") 

x <- SSsummarize(list(base, sens_1, sens_2, sens_3, sens_4, sens_5, 
                 sens_6, sens_7, sens_8))

SSplotComparisons(x, endyrvec = 2021, 
                  legendlabels = modelnames, 
                  plotdir = file.path(getwd(), '_plots'), 
                  legendloc = "topright", 
                  filenameprefix = paste0(base_model, "_"),
                  subplot = c(2,4,10,12), 
                  print = TRUE, 
                  pdf = FALSE)

SSplotComparisons(x, endyrvec = 2021, 
                  legendlabels = modelnames, 
                  plotdir = file.path(getwd(), '_plots'), 
                  legendloc = c(0.01,0.9), 
                  filenameprefix = paste0(base_model, "_"),
                  subplot = c(4), 
                  print = TRUE, 
                  pdf = FALSE)

###################################################################################
# Jason Style Sensitivity Figure
###################################################################################
x <- SSsummarize(list(base, sens_1, sens_2, sens_3, sens_4, sens_5))
modelnames <- c("Base Model",
                "Est. M (f)", 
                "Est. Linf (f)",
                "Est. k (f)",
                "Estimate Rec. Devs.",
                "Estimate Rec. Devs. and Dome Selex") 

wd_dat <- file.path(paste0(wd,"/_plots")) 
Sensi_plot_dover(model.summaries=x,
              dir = wd_dat,
              current.year=2021,
              mod.names=modelnames, #List the names of the sensitivity runs
              likelihood.out = c(0, 1, 0),
              Sensi.RE.out="Sensi_RE_out.DMP", #Saved file of relative errors
              CI=0.95, #Confidence interval box based on the reference model
              TRP.in=0.40, #Target relative abundance value
              LRP.in=0.25, #Limit relative abundance value
              sensi_xlab="Sensitivity scenarios", #X-axis label
              ylims.in=c(-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1), #Y-axis label
              plot.figs=c(1,1,1,1,1,1), #Which plots to make/save? 
              sensi.type.breaks=c(4.5), #vertical breaks that can separate out types of sensitivities
              anno.x=c(2.5, 5), # Vertical positioning of the sensitivity types labels
              anno.y=c(0.85,0.85), # Horizontal positioning of the sensitivity types labels
              anno.lab=c("Parameters","Recruitment"), #Sensitivity types labels
              horizontal = TRUE)

###################################################################################
# Create a Table of Results
###################################################################################


x <- SSsummarize(list(base, sens_1, sens_2, sens_3, sens_4, sens_5, 
                 sens_6, sens_7, sens_8))

ii = 1:length(modelnames)
n = length(modelnames)
out<- matrix(NA, 22, max(ii))

out = rbind(
            as.numeric(x$likelihoods[x$likelihoods$Label == "TOTAL",1:n]), 
            #as.numeric(x$likelihoods[x$likelihoods$Label == "Survey",1:n]), 
            as.numeric(x$likelihoods[x$likelihoods$Label == "Length_comp",1:n]),
            #as.numeric(x$likelihoods[x$likelihoods$Label == "Age_comp",1:n]), 
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
                  #"Survey Likelihood",
                  "Length Likelihood",
                  #"Age Likelihood",
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


write.csv(out, file = file.path(out.dir, paste0(base_model, "_sensitivities.csv")))

t = table_format(x = out,
      caption = 'Sensitivities relative to the base model.',
      label = 'sensitivities',
      longtable = TRUE,
      font_size = 9,
      digits = 3,
      landscape = TRUE,
      col_names = modelnames)

kableExtra::save_kable(t,
file = "C:/Assessments/2021/copper_rockfish_2021/write_up/wa/tex_tables/sensitivities.tex")
