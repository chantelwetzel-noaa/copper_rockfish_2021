
# Copper North California Model Runs

library(r4ss)
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/r4ss")


wd = "N:/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/models/ca_n_pt_c"
wd = "C:/Assessments/2021/copper_rockfish_2021/models/ca_n_pt_c"

model = "0.0.0_init_model"
base = SS_output(file.path(wd, model))
SS_plots(base)

# Estimate the hessian
model = "1.0_recdevs_hessian"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 2003.7, R0 = 5.38, depl 2021 = 0.143
# Suggested sigma R = 0.82
# Wildly large recdev in 1967

model = "1.1_recdevs_adj_ramp"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL 1940.1, R0 = 5.41, depl 2021 = 0.213, Dead_Catch_SPR 55.69
# Single large rec dev in the early years

# Adjust the bias ramp and move back rec dev start year
model = "1.2_recdevs_start_earlier"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 1938.65, R0 = 5.89, depl 2021 = 0.195, Dead_Catch_SPR 90.48
# Now a series of positive early rec devs compared to a single spike
# This and the above model end in a similar place but have very different rfs

# Turn off early devs
model = "1.3_recdevs_no_early_devs"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 1948.1, R0 = 5.64, depl 2021 = 0.295, Dead_Catch_SPR 70.2201
# This just forces that large dev into the first year devs are estimated

# Move forward for now with 1.1 with the large spike in the early devs:
model = "2.1_dw_francis"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 165.859, R0 = 6.07168, depl 2021 = 0.413
# Data weighting actually eliminates this spike and results in a ramp up of 
# positive recruits comparable to the 1.2 & 1.3 runs.

model = "2.2_dw_harmonic_mean"
base = SS_output(file.path(wd, model))
SS_plots(base)
# The MI approach wants to put nearly full weight on the survey lengths.
# NLL = 543.23 (244.48), R0 = 6.03, depl 2021 = 0.478
# Recruitment LL = 1.1195

model = "2.3_dw_harmonic_mean_rm_survey"
base = SS_output(file.path(wd, model))
SS_plots(base)
# The MI approach without survey lengths used
# NLL = 295.3, R0 = 6.02, depl 2021 = 0.49
# Recruitment LL = 1.138


# Lambda for the survey still set to 0
model = "2.4_dw_dirichlet"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 1296.5, R0 = 5.95, depl 2021 = 0.546
# Fleet 1 Length NLL = 428.3 
# All the of the DM parameters are reasonable (not hitting bounds)
# Inferred DW: 0.81, rec = 0.31
# Large + devs: 2007-2010

# Test out a commercial selectivity block on p1 & p3
# Still doing dirichlet data weighting - no survey lengths
model = "3.1_selex_cm_blocks"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 1153.14, R0 = 6.06, depl 2021 = 0.601
# Fleet 1 Length NLL = 291.4

# Add ability for recent years to be domed.
model = "3.2_selex_cm_blocks_dome"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 1148.33, R0 = 6.06, depl 2021 = 0.608
# Hits the ub for DM fleet 1
# Fleet 1 Length NLL = 289.7
# NLL = 1149.33, R0 = 6.06
# Large + devs in 2007-2010, most likely being driven by the drop in the ave lengths
# Dirichlet now hitting the upper bound for the commercial fleet.
# Estimates a dome but limited impact.

# Turn off rec devs to see what happens fits
model = "3.3_selex_cm_blocks_no_recdevs"
base = SS_output(file.path(wd, model))
SS_plots(base)
# Really clear evidence of a stron ~2008 recruitment 
# Without devs - poor mean length fits and residual patterns
# However, the size of the rec dev in ~2008 is resulting in a strong
# uptick of the stock (above target) and without in the precautionary zone. 


# Estimate p2 in the late commercial block
model = "3.4_selex_cm_blocks_param"
base = SS_output(file.path(wd, model))
SS_plots(base)


# Change L2 to be associated with Linf
model = "4.1_bio_linf_w_blocks"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 1142.22 (fleet 2 len like = 838.055)


# Move forward with the "4.1_bio_linf_w_blocks" model
# Replace recreational lengths with fork lengths and remove
# the trawl survey data which was incorrectly split by latitude. 
model = "5.1_data_rec_len_trawl_survey"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 1163.06 (fleet 2 len like = 859.287 so a worse fit...) 
# fleet 3 selex peak para on the upper bound


model = "5.2_data_rec_len_trawl_survey_nodevs"
base = SS_output(file.path(wd, model))
SS_plots(base)

# Moving forward with 5.1 estimate recdevs
# Let's see if we can improve the selectivity estimates and fits
model = "6.1_selex_est_com"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL 1133.5, R0 = 6.21, depl = 0.74
# Commercial length LL = 264.6 (5.1 294.7), Rec = 859.5 (5.1 859.3)
# Based on improved fit keep recent dome and fix block to asymptotic

# Fix block p1, fix block p6 to asymptotic, and fix p2 in the non-blocked period 
# at the estimated value, still estimate p2 in the block 
model = "6.2_selex_com_fix_based_on_ests"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 1135.32, Commercial length LL = 266.65

# Estimate rec selex parameters
model = "6.3_selex_est_rec"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 1060, rec length LL = 778.9 (80 unit improvement over 6.1)
# R0 = 6.3, depl 2021 = 0.91
# Wants to be domed after 50 cm but given the commercial is domed 
# going to fix asmptotic, however, the entire reduction in NLL was
# due to the dome (no dome NLL = 1135.31): fixed asymptotic depl = 0.73

# Adjust rec devs - start the main period laer
model = "7.1_recdev_start_later"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 1134.8, R0 = 6.24, depl 2021 = 0.52

# Turn off early devs and only estimate starting in the main period
model = "7.2_recdev_turn_off_early"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 1207, R0 = 6.22, depl 2021 = 0.54
# Looks like the dip in early devs is being driven by the larger fish 
# being selected by the rec fleet at the start of data (poor recruitment =
# larger mean length expectations).

# No early devs and start main in 1985
model = "7.3_recdev_turn_off_early_start_later_hessian"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 1249, R0 = 6.18, depl = 0.45
# Starting later and turning off early devs really helps dampen the extreme
# low and high devs.  Still 3 high devs 2007-2009 but all around or 
# less than 1.0 now.
# Turning off early devs results in very little model uncertainty (0.07) 

# Apply the bias adjust from above and estimate the hessian
model = "7.4_recdev_hessian_bias_adj"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 1252.6

#################################################
model = "7.4_recdev_hessian_bias_adj"
dirichlet = SS_output(file.path(wd, model))
model = "7.1_recdev_start_later"
base = SS_output(file.path(wd, model))
modelnames <- c("No Early Devs", "Estimate Early Devs")
mysummary  <- SSsummarize(list(dirichlet, base))
SSplotComparisons(mysummary, 
				  filenameprefix = "7.0_recdevs_",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)
######################################################

# Data Weighting - Francis
model = "8.1_dw_francis"
base = SS_output(file.path(wd, model))
SS_plots(base)
# Com Len = 0.4885, Rec Len = 0.0318, Survey = 0.2788
# R0 = 6.19, depl 2021 = 0.43 

# Data Weighting - MI
model = "8.2_dw_mi"
base = SS_output(file.path(wd, model))
SS_plots(base)
# R0 = 6.18, depl 2021 = 0.426
# Com Len = 0.208, Rec Len = 0.110, Survye = 0.715

################################################
model = "7.4_recdev_hessian_bias_adj"
dirichlet = SS_output(file.path(wd, model))
model = "8.1_dw_francis"
francis = SS_output(file.path(wd, model))
model = "8.2_dw_mi"
mi = SS_output(file.path(wd, model))
modelnames <- c("Dirichlet", "MI", "Francis")
mysummary  <- SSsummarize(list(dirichlet, mi, francis))
SSplotComparisons(mysummary, 
				  filenameprefix = "8.0_data_weighting_",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)
################################################

# Try removing the rec years 1981-86 and turn on early devs
model = "8.3_dw_francis_rm_rec_lens_add_early_devs"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 190.9, R0 = 6.2, depl 2021 = 0.40

#####################################################################
model = "8.1_dw_francis"
base = SS_output(file.path(wd, model))
model = "8.3_dw_francis_rm_rec_lens_add_early_devs"
rm_data = SS_output(file.path(wd, model))
model = "8.4_dw_francis_early_devs"
early_devs = SS_output(file.path(wd, model))
modelnames <- c("No Early Devs", "Early Devs", "Early Devs -Data")
mysummary  <- SSsummarize(list(base, early_devs, rm_data))
SSplotComparisons(mysummary, 
				  filenameprefix = "8.0_early_devs_vs_rm_data",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)
################################################

# Estimate early devs
# Remove early years of recreational length data
# Fix commercial selectivity to be asympotic in recent years (did not change estimates)
model = "9.0_base"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 206.3, R0 = 6.2, depl 2021 = 0.40

model = "9.1_base_pop_bins"
pop_bins = SS_output(file.path(wd, model))

modelnames <- c("Base", "Pop Bins")
mysummary  <- SSsummarize(list(base, pop_bins))
SSplotComparisons(mysummary, 
				  filenameprefix = "9.0_population_bins",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)



model = "9.2_base_commercial_catch"
catch = SS_output(file.path(wd, model))

model = "9.3_base_growth"
growth = SS_output(file.path(wd, model))

# The difference in model results with the dome for
# commercial selectivity is very small.
model = "9.3_base_growth_asym"
selex = SS_output(file.path(wd, model))

model = "9.3_base_growth_spline"
spline = SS_output(file.path(wd, model))

modelnames <- c("9.0 Base", "9.3 Growth",
				"9.3 Asym. Selex", "9.3 Spline Selex")
mysummary  <- SSsummarize(list(base, growth, selex, spline))
SSplotComparisons(mysummary, 
				  filenameprefix = "9.3_",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

model = "10.0_base"
base = SS_output(file.path(wd, model))

model = "10.1_base_corrected_pacfin"
pacfin = SS_output(file.path(wd, model))
SS_plots(pacfin)

model = "10.2_base"
wrong_catch = SS_output(file.path(wd, model))

model = "10.3_base"
base = SS_output(file.path(wd, model))
SS_plots(base)
SS_tune_comps(replist = model, option = "Francis", dir = wd)



model = "10.4_base"
no_devs = SS_output(file.path(wd, model))
SS_plots(no_devs)

modelnames <- c("10.2 Wrong Rec. Lengths", "10.3", "10.4")
mysummary  <- SSsummarize(list(wrong_catch, base, no_devs))
SSplotComparisons(mysummary, 
				  filenameprefix = "10.3_rec_dat_",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

model = "10.3_base"
base = SS_output(file.path(wd, model))
model = "10.3_base_1981_rec"
catch = SS_output(file.path(wd, "_sensitivities", model))

modelnames <- c("Base", "Adjust 1981 Recreational Catch")
mysummary  <- SSsummarize(list(base, catch))
SSplotComparisons(mysummary, 
				  filenameprefix = "10.3_rec_catch_",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)


##########################################################################
# Council Requested Runs
##########################################################################

model = "10.3_base"
base = SS_output(file.path(wd, model))

model = "10.3_base_council_cpfv"
cpfv = SS_output(file.path(wd, "_sensitivities", model))
SS_plots(cpfv)
SS_tune_comps(replist = model, option = "Francis", dir = file.path(wd, "_sensitivities"))

model = "10.3_base_council_cpfv_hessian"
cpfv_hessian = SS_output(file.path(wd, "_sensitivities", model))
SS_plots(cpfv_hessian)

modelnames <- c("Adopted Model", "+ Early Length Data")
mysummary <- SSsummarize(list(base, cpfv))
SSplotComparisons(mysummary, 
				  filenameprefix = "10.3_council_cpfv_data_",
				  legendlabels = modelnames, 
				  #ylimAdj = 1.45,
				  plotdir = file.path(wd, "_sensitivities", "_plots"),
                  subplot = c(2,4,12), 
                  print = TRUE,
                  pdf = FALSE)

################################################################################
# Table of estimates from the added data
################################################################################
x = mysummary
ii = 1:length(modelnames)
n = length(modelnames)
out = matrix(NA, 32, max(ii))
find1 = which(x$likelihoods_by_fleet$model == 1 &x$likelihoods_by_fleet$Label == "Length_like")
find2 = which(x$likelihoods_by_fleet$model == 2 &x$likelihoods_by_fleet$Label == "Length_like")

out = rbind(
            as.numeric(x$likelihoods[x$likelihoods$Label == "TOTAL",1:n]), 
            as.numeric(x$likelihoods[x$likelihoods$Label == "Survey",1:n]), 
            as.numeric(x$likelihoods[x$likelihoods$Label == "Length_comp",1:n]),
            c(as.numeric(x$likelihoods_by_fleet[find1,4]), as.numeric(x$likelihoods_by_fleet[find2,4])),
            c(as.numeric(x$likelihoods_by_fleet[find1,5]), as.numeric(x$likelihoods_by_fleet[find2,5])),
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
            as.numeric(x$pars[x$pars$Label == "Size_DblN_peak_CA_N_Commercial(1)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_ascend_se_CA_N_Commercial(1)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_end_logit_CA_N_Commercial(1)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_peak_CA_N_Commercial(1)_BLK1repl_1916", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_peak_CA_N_Recreational(2)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_ascend_se_CA_N_Recreational(2)", 1:n]))  
			
out = as.data.frame(out)
colnames(out) = modelnames
rownames(out) = c("Total Likelihood",
                  "Survey Likelihood",
                  "Length Likelihood",
                  "Commercial Length Likelihood",
                  "Recreational Length Likelihood",
                  "Recruitment Likelihood",
                  "Forecast Recruitment Likelihood",
                  "Parameter Priors Likelihood",
                  "log(R0)",
                  "SB Virgin",
                  "SB 2021",
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
                  "Peak Selectivity - Commercial", "Ascending Selectivity - Commercial", "Final Selectivity - Commercial",
				  "Peak Selectivity (1916 - 2007) - Commercial",
				  "Peak Selectivity - Recreational", "Ascending Selectivity - Recreational")
t = sa4ss::table_format(x = out,
      caption = 'Data sensitivity relative to the adopted base model.',
      label = 'data-sens-north',
      digits = 3,
      col_names = modelnames)

kableExtra::save_kable(t,
file = "C:/Assessments/2021/copper_rockfish_2021/write_up/council_requests/s=nca_data_sens.tex")
###############################################################################################


model = "10.3_base_council_cpfv_all_selex_block"
all_selex = SS_output(file.path(wd, "_sensitivities", model))
SS_plots(all_selex)

model = "10.3_base_council_cpfv_com_asym_rec_dome"
alt_selex = SS_output(file.path(wd, "_sensitivities", model))
SS_plots(alt_selex)

model = "10.3_base_rec_com_block_domed"
base_selex = SS_output(file.path(wd, "_sensitivities", model))
SS_plots(base_selex)

modelnames <- c("Adopted Model", "+ Early Length Data", 
	'+ Early Length Data, Selectivity Block')
mysummary <- SSsummarize(list(base, cpfv, all_selex))
SSplotComparisons(mysummary, 
				  filenameprefix = "10.3_council_selex_",
				  legendlabels = modelnames, 
				  ylimAdj = 1.25,
				  plotdir = file.path(wd, "_sensitivities", "_plots"),
				  subplot = c(2,4,12), 
                  print = TRUE,
                  pdf = FALSE)

################################################################################
# Table of estimates from the added data
################################################################################
x = mysummary
ii = 1:length(modelnames)
n = length(modelnames)
out = matrix(NA, 34, max(ii))
find1 = which(x$likelihoods_by_fleet$model == 1 &x$likelihoods_by_fleet$Label == "Length_like")
find2 = which(x$likelihoods_by_fleet$model == 2 &x$likelihoods_by_fleet$Label == "Length_like")
find3 = which(x$likelihoods_by_fleet$model == 3 &x$likelihoods_by_fleet$Label == "Length_like")

out = rbind(
            as.numeric(x$likelihoods[x$likelihoods$Label == "TOTAL",1:n]), 
            as.numeric(x$likelihoods[x$likelihoods$Label == "Survey",1:n]), 
            as.numeric(x$likelihoods[x$likelihoods$Label == "Length_comp",1:n]),
            c(as.numeric(x$likelihoods_by_fleet[find1,4]), as.numeric(x$likelihoods_by_fleet[find2,4]), as.numeric(x$likelihoods_by_fleet[find3,4])),
            c(as.numeric(x$likelihoods_by_fleet[find1,5]), as.numeric(x$likelihoods_by_fleet[find2,5]), as.numeric(x$likelihoods_by_fleet[find3,5])),
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
            as.numeric(x$pars[x$pars$Label == "Size_DblN_peak_CA_N_Commercial(1)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_ascend_se_CA_N_Commercial(1)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_end_logit_CA_N_Commercial(1)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_peak_CA_N_Commercial(1)_BLK1repl_1916", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_peak_CA_N_Recreational(2)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_ascend_se_CA_N_Recreational(2)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_end_logit_CA_N_Recreational(2)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_peak_CA_N_Recreational(2)_BLK2repl_1916", 1:n]))  
			
out = as.data.frame(out)
colnames(out) = modelnames
rownames(out) = c("Total Likelihood",
                  "Survey Likelihood",
                  "Length Likelihood",
                  "Commercial Length Likelihood",
                  "Recreational Length Likelihood",
                  "Recruitment Likelihood",
                  "Forecast Recruitment Likelihood",
                  "Parameter Priors Likelihood",
                  "log(R0)",
                  "SB Virgin",
                  "SB 2021",
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
                  "Peak Selectivity - Commercial", "Ascending Selectivity - Commercial", "Final Selectivity - Commercial",
				  "Peak Selectivity (1916 - 2001) - Commercial",
				  "Peak Selectivity - Recreational", "Ascending Selectivity - Recreational", "Final Selectivity - Recreational",
				  "Peak Selectivity (1916 - 2001) - Recreational")
t = sa4ss::table_format(x = out,
      caption = 'Selectivity sensitivities relative to the adopted base model.',
      label = 'selex-sens-north',
      digits = 3,
      col_names = modelnames)

kableExtra::save_kable(t,
file = "C:/Assessments/2021/copper_rockfish_2021/write_up/council_requests/nca_selex_sens.tex")
###############################################################################################


################################################################################
#  NCA Selectivity
################################################################################
# Base Model ----------
model = base
# Create selectivity plots
fleets = model$FleetNames

com_selex <- SSplotSelex(model, fleets = 1, fleetnames = fleets, subplot = 1, year = c(2008, 2020))
com_selex$infotable$longname = c("Commercial 1916-2008", "Commercial 2009-2020")
com_selex$infotable$col <- rep(rich.colors.short(n = 8)[2],2)
rec_selex <- SSplotSelex(model, fleets = 2, fleetnames = fleets, subplot = 1)
rec_selex$infotable$col <- 'red'

pngfun(wd = file.path(wd, "_sensitivities", "_plots"), 
	'10.3_base_council_base_selex_block_1x2.png', w = 10, h = 5)
par(mfrow=c(1,2), mar=c(4,4,3,1))
SSplotSelex(model, fleets=1,  infotable=com_selex$infotable, 
				subplot = 1, legendloc = 'topleft', mainTitle=FALSE, year = c(2008, 2020))
grid()
SSplotSelex(model, fleets = 2, infotable = rec_selex$infotable,
			subplot = 1, legend= 'topright', mainTitle=FALSE)	
grid()
legend("bottomright", legend = rec_selex$infotable$longname, 
	col = rec_selex$infotable$col, lwd = 2, lty = 1, pch = 16, bty = 'n')
dev.off()

model = all_selex
# Create selectivity plots
fleets = model$FleetNames

com_selex <- SSplotSelex(model, fleets = 1, fleetnames = fleets, subplot = 1, year = c(2001, 2008, 2020))
com_selex$infotable$longname = c("Commercial 1916-2001","Commercial 2002-2000", "Commercial 2009-2020")
com_selex$infotable$col <- rep(rich.colors.short(n = 8)[2],3)
rec_selex <- SSplotSelex(model, fleets = 2, fleetnames = fleets, subplot = 1, years = c(2001, 2020))
rec_selex$infotable$longname = c("Recreational 1916-2001", "Recreational 2002-2020")
rec_selex$infotable$col <- 'red'

pngfun(wd = file.path(wd, "_sensitivities", "_plots"), 
	'10.3_base_council_cpfv_selex_block_1x2.png', w = 10, h = 5)
par(mfrow=c(1,2), mar=c(4,4,3,1))
SSplotSelex(model, fleets=1,  infotable=com_selex$infotable, 
				subplot = 1, legendloc = 'topleft', mainTitle=FALSE, year = c(2001, 2008, 2020))
grid()
SSplotSelex(model, fleets = 2, infotable = rec_selex$infotable, , year = c(2001, 2020),
			subplot = 1, legend= 'bottomright', mainTitle=FALSE)	
grid()
dev.off()


# Com Asym - Rec Domed
#-------------------------------------------------
model = alt_selex
fleets = model$FleetNames

com_selex <- SSplotSelex(model, fleets = 1, fleetnames = fleets, subplot = 1, year = c(2001, 2008, 2020))
com_selex$infotable$longname = c("Commercial 1916-2001","Commercial 2002-2000", "Commercial 2009-2020")
com_selex$infotable$col <- rep(rich.colors.short(n = 8)[2],3)
rec_selex <- SSplotSelex(model, fleets = 2, fleetnames = fleets, subplot = 1, years = c(2001, 2020))
rec_selex$infotable$longname = c("Recreational 1916-2001", "Recreational 2002-2020")
rec_selex$infotable$col <- 'red'

pngfun(wd = file.path(wd, "_sensitivities", "_plots"), 
	'10.3_base_council_cpfv_com_asym_rec_dome_1x2.png', w = 10, h = 5)
par(mfrow=c(1,2), mar=c(4,4,3,1))
SSplotSelex(model, fleets=1,  infotable=com_selex$infotable, 
				subplot = 1, legendloc = 'topleft', mainTitle=FALSE, year = c(2001, 2008, 2020))
grid()
SSplotSelex(model, fleets = 2, infotable = rec_selex$infotable, , year = c(2001, 2020),
			subplot = 1, legend= 'bottomright', mainTitle=FALSE)	
grid()
dev.off()

#####################################################################################################

model = "10.3_base"
base = SS_output(file.path(wd, model))

model = "10.3_base_council_cpfv"
cpfv = SS_output(file.path(wd, "_sensitivities", model))

model = "10.3_base_council_cpfv_all_selex_block_dw"
all_selex = SS_output(file.path(wd, "_sensitivities", model))

model = "10.3_base_council_cpfv_com_asym_rec_dome_2_blocks_dw"
com_asym_2 = SS_output(file.path(wd, "_sensitivities", model))

model = "10.3_base_council_cpfv_com_asym_rec_dome_dw"
com_asym_3 = SS_output(file.path(wd, "_sensitivities", model))

modelnames <- c("Adopted Base Model", "+ CPFV Data",
				"+ CPFV Data, Rec. Selex Dome (DW)", 
				"+ CPFV Data, Rec. Dome, Com. Asym. 3 Blocks (DW)",
				"+ CPFV Data, Rec. Dome, Com. Asym 2 Blocks (DW)")
mysummary  <- SSsummarize(list(base, cpfv, all_selex, com_asym_3, com_asym_2))
SSplotComparisons(mysummary, 
				  filenameprefix = "10.3_cpfv_selex_",
				  legendlabels = modelnames, 
				  ylimAdj = 1.25,
				  plotdir = file.path(wd, "_sensitivities","_plots"),
				  pdf = TRUE)