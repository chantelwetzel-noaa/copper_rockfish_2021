
# Copper North California Model Runs

library(r4ss)

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
