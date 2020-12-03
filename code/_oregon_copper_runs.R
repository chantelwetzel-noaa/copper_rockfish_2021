# Copper Oregon Model Runs

library(r4ss)

wd = "N:/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/models/or"

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