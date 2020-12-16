# Copper Oregon Model Runs

library(r4ss)

wd = "N:/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/models/or"
wd = "C:/Assessments/2021/copper_rockfish_2021/models/or"

model = "0.1.2_dw_francis"

base = SS_output(file.path(wd, model))
SS_plots(base)


model = "0.2.1_selex_rec_block"
base = SS_output(file.path(wd, model))
SS_plots(base)


model = "0.2.2_selex_rec_block_dome"
base = SS_output(file.path(wd, model))
SS_plots(base)

# Estimated the hessian
model = "0.3.0_recdevs"
base = SS_output(file.path(wd, model))
SS_plots(base)

# Move the start back to apply the ramp to the early large 1990s devs
# Decrease the max bias
model = "0.3.1_recdevs_start_earlier"
base = SS_output(file.path(wd, model))
SS_plots(base)

# Add sexed recreational lengths that were accidentilly ommitted
model = "1.0.1_data_add_lengths"
base = SS_output(file.path(wd, model))
SS_plots(base)


# Add in the released fish as a ghost fleet to see how they compare to the retained fish
model = "1.2_data_add_released_ghost_fleet"
base = SS_output(file.path(wd, model))
SS_plots(base)
# In years where samples are more than a few these lengths match the retained fish.

# Correct the maturity parameters and update the L2 and k based on all data.
model = "1.3_data_update_bio"
base = SS_output(file.path(wd, model))
SS_plots(base)

# Estimate the ~ 25 years of early deviations:
model = "2.1_recdevs_early_est"
base = SS_output(file.path(wd, model))
SS_plots(base)

# Estimate the 40 years of early deviations & allow for dome selex
model = "2.2_recdevs_early_est_w_dome"
base = SS_output(file.path(wd, model))
SS_plots(base)

# Turn off devs but allow for dome selectivity
model = "2.3_recdevs_none_w_dome"
base = SS_output(file.path(wd, model))
SS_plots(base)
# without devs the R0 blows up

# Rec devs, no domes, and only have a block on a p1
model = "2.4_recdevs_early_est_p1_only_block"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 242.9, R0 = 2.4, depl 2021 = 0.27
# These changes to the selex pars fixed the gradient issue with p3











