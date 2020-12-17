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






