
# Copper North California Model Runs

library(r4ss)

wd = "N:/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/models/ca_n_pt_c"
wd = "C:/Assessments/2021/copper_rockfish/models/ca_n_pt_c"


model = "0.0.0_init_model"
base = SS_output(file.path(wd, model))
SS_plots(base)


model = "0.0.1_dw_dirichlet"
base = SS_output(file.path(wd, model))
SS_plots(base)
# fleet 3 hitting the upper bound - need to re-evaluate input N


model = "0.0.1_dw_francis"
base = SS_output(file.path(wd, model))
SS_plots(base)


# Estimated the hessian
model = "0.0.2_recdevs"
base = SS_output(file.path(wd, model))
SS_plots(base)

