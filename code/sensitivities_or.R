########################################################
# Create Sensitivity table for Copper Rockfish 2021
#   written by : Chantel Wetzel
########################################################

library(r4ss)
library(sa4ss)

###################################################################
# Oregon 
###################################################################
area = "or"
base_model = "10.5_base"

wd = file.path("C:/Assessments/2021/copper_rockfish_2021/models", 
          area, "_sensitivities")
setwd(wd)
out.dir = wd

base.loc = file.path("C:/Assessments/2021/copper_rockfish_2021/models",
           area, base_model)

model.list <- c(paste0(base_model, "_recdevs"), #1
                paste0(base_model, "_recdevs_all_data"), #2
                paste0(base_model, "_recdev_fix_com_all_data"), #3
                paste0(base_model, "_francis"), #4
                paste0(base_model, "_dm"), #5
                paste0(base_model, "_est_linf"), #6
                paste0(base_model, "_est_cv2"), #7
                paste0(base_model, "_est_m"), #8
                paste0(base_model, "_asym"), #9
                paste0(base_model, "_w_block"), #10
                paste0(base_model, "_com_sexed"), #11
                paste0(base_model, "_index"), #12
                paste0(base_model, "_index_add_se"), #13
                paste0(base_model, "_recdev_fix_com_all_data_sexed"), #14
                paste0(base_model, "_recdev_fix_com_all_data_sexed_hess"), #15
                paste0(base_model, "_no_devs_2000")) # 16

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
sens_9  = SS_output( file.path(wd, model.list[9]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_10  = SS_output( file.path(wd, model.list[10]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_11  = SS_output( file.path(wd, model.list[11]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_12  = SS_output( file.path(wd, model.list[12]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_13  = SS_output( file.path(wd, model.list[13]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_14  = SS_output( file.path(wd, model.list[14]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_15  = SS_output( file.path(wd, model.list[15]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_16  = SS_output( file.path(wd, model.list[16]), printstats = FALSE, verbose = FALSE, covar = FALSE)


modelnames <- c("Base Model",
                "Rec. Devs.",
                "Rec. Devs. Fix Comm.",
                "Rec. Devs. 1927-2000",
                "DM DW",
                #"Estimate Linf",
                "Estimate CV Old",
                "Estimate M (f)")

modelnames2 <-  c("Base Model",
                "Rec. Asym. Selectivity",
                "Rec. Data w/ Block",
                "Commercial Sexed Comps.",
                "2013 OR CPFV Index",
                "2013 OR CPFV Index w/ Added Var.")

x <- SSsummarize(list(base, sens_2, sens_3, sens_16, sens_5, sens_7, sens_8))

x2 <- SSsummarize(list(base, sens_9, sens_10, sens_11, sens_12, sens_13))

SSplotComparisons(x, endyrvec = 2021, 
                  legendlabels = modelnames, 
                  ylimAdj = 1.40,
                  plotdir = file.path(getwd(), '_plots'), 
                  legendloc = "topright", 
                  filenameprefix = paste0(base_model, "_1_"),
                  subplot = c(2,4), 
                  print = TRUE, 
                  pdf = FALSE)

SSplotComparisons(x, endyrvec = 2021, 
                  legendlabels = modelnames, 
                  ylimAdj = 1.25,
                  plotdir = file.path(getwd(), '_plots'), 
                  legendloc = "topleft", 
                  filenameprefix = paste0(base_model, "_1_"),
                  subplot = c(10,12), 
                  print = TRUE, 
                  pdf = FALSE)

SSplotComparisons(x2, endyrvec = 2021, 
                  legendlabels = modelnames2, 
                  ylimAdj = 1.35,
                  plotdir = file.path(getwd(), '_plots'), 
                  legendloc = "topright", 
                  filenameprefix = paste0(base_model, "_2_"),
                  subplot = c(2,4,10,12), 
                  print = TRUE, 
                  pdf = FALSE)

###################################################################################
# Create a Table of Results
###################################################################################

modelnames <- c("Base Model",
                "Rec. Devs.",
                "Rec. Devs. Fix Comm.",
                "Rec. Devs. 1927-2000",
                "Francis DW",
                "DM DW",
                "Estimate Linf",
                "Estimate CV Old",
                "Estimate M (f)")

x <- SSsummarize(list(base, sens_2, sens_3, sens_16, sens_4, sens_5, sens_6, sens_7, sens_8))

ii = 1:length(modelnames)
n = length(modelnames)
out<- matrix(NA, 24, max(ii))

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
            as.numeric(x$pars[x$pars$Label == "CV_old_Mal_GP_1", 1:n]),
            round(as.numeric(x$pars[x$pars$Label == "Size_DblN_peak_OR_Commercial(1)", 1:n]),3),
            round(as.numeric(x$pars[x$pars$Label == "Size_DblN_peak_OR_Recreational(2)", 1:n]),3))  


out = as.data.frame(round(out,3))
#out = format(out, digits = 3, scientific = F)
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
                  "CV old - Male",
                  "Commercial Peak Selectivity",
                  "Recreational Peak Selectivity")

write.csv(out, file = file.path(out.dir, paste0(base_model, "_sensitivities_1.csv")))

t = table_format(x = out,
      caption = 'Sensitivities relative to the base model.',
      label = 'sensitivities-1',
      longtable = TRUE,
      font_size = 9,
      digits = 3,
      landscape = TRUE,
      col_names = modelnames,
      format.args = list(scientific = FALSE))

kableExtra::save_kable(t,
file = file.path("C:/Assessments/2021/copper_rockfish_2021/write_up", area, "tex_tables/sensitivities_1.tex"))

######################################################################################################

ii = 1:length(modelnames2)
n = length(modelnames2)
out<- matrix(NA, 24, max(ii))
x = x2

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
            as.numeric(x$pars[x$pars$Label == "CV_old_Mal_GP_1", 1:n]),
            round(as.numeric(x$pars[x$pars$Label == "Size_DblN_peak_OR_Commercial(1)", 1:n]),3),
            round(as.numeric(x$pars[x$pars$Label == "Size_DblN_peak_OR_Recreational(2)", 1:n]),3))  
   
out = as.data.frame(out)
colnames(out) = modelnames2
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
                  "CV old - Male",
                  "Commercial Peak Selectivity",
                  "Recreational Peak Selectivity")                

write.csv(out, file = file.path(out.dir, paste0(base_model, "_sensitivities_2.csv")))

t = table_format(x = out,
      caption = 'Sensitivities relative to the base model.',
      label = 'sensitivities-2',
      longtable = TRUE,
      font_size = 9,
      digits = 3,
      landscape = TRUE,
      col_names = modelnames2,
      format.args = list(scientific = FALSE))

kableExtra::save_kable(t,
file = file.path("C:/Assessments/2021/copper_rockfish_2021/write_up", area, "tex_tables/sensitivities_2.tex"))
