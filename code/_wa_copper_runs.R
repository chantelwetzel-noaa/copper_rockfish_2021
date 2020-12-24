# Copper Oregon Model Runs

library(r4ss)

wd = "C:/Assessments/2021/copper_rockfish_2021/models/wa"

model = "0.0_init_model"

base = SS_output(file.path(wd, model))
SS_plots(base)

# Estimate recdevs for all years - main start 1970
model = "1.0_recdevs"
base = SS_output(file.path(wd, model))
SS_plots(base)

# Try dirichlet data weighting
model = "2.1_dw_dirichlet"
base = SS_output(file.path(wd, model))
SS_plots(base)
# Hitting the ub of 5

# Try dirichlet data weighting
model = "2.3_dw_francis"
base = SS_output(file.path(wd, model))
SS_plots(base)
# Given one fleet with length data - how important is data weigthting?

# Estimate the hessian to continue adjusting recruitment
model = "3.1_recdevs_hessian"
base = SS_output(file.path(wd, model))
SS_plots(base)
# Poor bias adj ramp estimated.
# All positive rec devs 1991-2004
# All negative 2005-2018

# Increase sigmaR = 0.90 based on r4ss suggestion
# Move recdev main period back to 1990
model = "3.2_recdevs_sigmaR_devs_1990"
base = SS_output(file.path(wd, model))
SS_plots(base)
# Still have very large devs with high and the low period
# 1999 dev = 2.22, 1996 = 2.23, 2003 = 2.08, 1994 = 1.15, 1993 = 0.99, 1991 = 0.84
# All negative after 2003
# Going to turn off estimation of devs for now
# There is a trade-off between recruitment and selectivity where:
# No devs -> left shifted selectivity
# Rec devs -> right shifted selectivity

###### Recruitment turned off #######################

# Switch sd(LAA) option = 2 with estimation
model = "4.1_growth_sd"
base = SS_output(file.path(wd, model))
SS_plots(base)
# SD interval smaller than fixed CV
# NLL = 462.697

# Switch CV(LAA) option = 0 with estimation
model = "4.2_growth_cv"
base = SS_output(file.path(wd, model))
SS_plots(base)
# CV young = 0.035 - 0.05, CV old = 0.05 - 0.06
# NLL = 462.368 vs. 495.113 with cv fixed = 0.10
# R0 = 2.27222

# Check estimation of Linf
model = "4.2_growth_est_linf"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 431.1, R0 = 19.75
# Linf females = 45.3, Linf males = 44.6


# Add growth patterns CV(LAA) option = 0 fixed = 0.10
# 5 patterns with stdev ration = 0.7
model = "4.3_growth_cv_patterns"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 501.32 w/ cv = 0.10
# NLL = 467.862 w/ cv = 0.05 (depletion is slightly lower as well)
# Using growth patterns does not appear to improve the fits to the data
# where if you add this feature and estimate the cvs you estimate small
# cvs (same as above) with nearly identical NLL (R0 = 2.28717)


# Try adding early selectivity block 1935-1999
model = "5.1_selex_block_cv_fixed"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 419.159
# Late selectivity block shifts rightward (selecting larger fish) P1 = 44.7
# Early block shifts leftward P1 = 32.6
# Stock status just below threshold
# Either can have large rec devs in the 90s or selectivity

# Remove block
model = "5.1.1_selex_cv_fixed"
base = SS_output(file.path(wd, model))
SS_plots(base)


# Try adding early selectivity block 1935-1999 & domed in both periods
model = "5.2_selex_block_and_dome"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 382.942, R0 = 2.75, depl 2020 = 0.70
# Visual better fit to the combined len across years
# Does not fit the mean lengths well across time

# Try adding early selectivity block 1935-1999, domed in both periods
# and recruitment deviations
model = "5.3_selex_block_and_dome_recdevs"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 262.326, R0 = 1.6134, depl 2020 = 0.145
# Large dev in 1996, 1999, 2003
# If estimating rec devs the difference in the block selex is reduced

# Remove the block in selectivity
model = "5.4_selex_dome_recdevs"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 269.563, R0 = 1.56, depl 2021 = 0.093
# +7 NLL when the block is removed


# Reset to model 5.1.1_selex_cv_fixed
# Remove data-weighting
model = "6.1_bio_update_remove_dw"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 1132.25, R0 = 2.17
# Length fits look crappy...


# Estimate the selectivity parameters
model = "6.2_selex_est_all"
base = SS_output(file.path(wd, model))
SS_plots(base)
# Fixed Asymptotic Selex: NLL = 1132.24, R0 = 2.17
# Allow for dome-shaped selex: with domed-selex the model gets the best fit
# with a really high R0.

# Let's do some tests with age data
# Full lambdas and estimating rec devs
model = "6.3_recdevs_ghost_ages"
base = SS_output(file.path(wd, model))
SS_plots(base)
# Mean age and length of fish have increased in recent years which leads the model to 
# infer that recruitment has been bad in recent years resulting in a sharp downturn
# in stock status.
# Estimating recdevs results in a drastic shift in stock status and scale,
# along with a strong rightward shift in selectivity (P1 ~45 vs ~37 without).


# Completely exploratory
# No recdevs but a block for 2010-2019 which could be used to fit the 
# shift in means lengths for the period
model = "6.4_selex_block_2010_nodevs"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 894.435, R0 = 1.83
# The fit to the length data  is considerably better but there is no 
# explanation for this shift in selectivity. However, the stock scale is
# much smaller and the status is much lower.

# Remove the selectivity blocks & 
# Re-evaluate the growth pattern approach
model = "6.5_bio_growth_patterns"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 1105.53, R0 = 2.286, depl 2021 = 0.50
# Dramatically improved the length LL but not entirely clear why
# The R0 increases a bit and the depl is slightly greater across time.

model = "6.6_bio_growth_patterns_w_devs"
devs = SS_output(file.path(wd, model))
SS_plots(devs)

modelnames <- c("One Platoon", "Five Platoons", "Five Platoons w/ Devs")
mysummary <- SSsummarize(list(base,  alt_platoons, devs))
SSplotComparisons(mysummary, 
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

# Move forward with model with 1 platoon and no rec devs:
model = "7.0_base"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 1132.24

model = "7.1_dw_dirichlet"
dirichlet = SS_output(file.path(wd, model))
SS_plots(dirichlet)

model = "7.2_dw_MI"
mi = SS_output(file.path(wd, model))
SS_plots(mi)

model = "7.3_dw_francis"
francis = SS_output(file.path(wd, model))
SS_plots(francis)

modelnames <- c("Base", "Dirichlet", "MI", "Francis")
mysummary <- SSsummarize(list(base,  dirichlet, mi, francis))
SSplotComparisons(mysummary, 
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

# Input all lengths as unsexed in order to better visualize the fits
# No data weighting applied
model = "7.4_lengths_combined"
all_lengths = SS_output(file.path(wd, model))
SS_plots(all_lengths)
# NLL = 799.667, R0 = 2.17, depl 2021 = 0.45
# I think the likelihood change is due to how input sample sizes are
# entered between unsexed and sexed lengths. The model results are 
# very similar.

# Start with the 7.0_base model
# Add 2 blocks (3 total selex periods) based on residual patterns
model = "7.5_selex_3_blocks"
blocks = SS_output(file.path(wd, model))
SS_plots(blocks)
# NLL = 823.2, R0 = 1.80, depl 2021 = 0.157
# Although NLL decreased the mean lengths still are not fit well and the
# aggregated length fit not dramatically improved.
SS_plots(all_lengths)



#===================================================================
# Sensitivities to Run for Document
#	- Recruitment deviations estimated
#	- Block in selectivity from 2010-2019
#


