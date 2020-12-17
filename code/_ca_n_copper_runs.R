
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




