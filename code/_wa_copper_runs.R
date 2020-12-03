# Copper Oregon Model Runs

library(r4ss)

wd = "N:/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/models/wa"

model = "0.0.0_init_model"

base = SS_output(file.path(wd, model))
SS_plots(base)

