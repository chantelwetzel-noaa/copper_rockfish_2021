
# Copper South California Model Runs

library(r4ss)

wd = "N:/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/models/ca_s_pt_c"
wd = "C:/Assessments/2021/copper_rockfish/models/ca_s_pt_c"

model = "0.0.0_init_model"
base = SS_output(file.path(wd, model))
SS_plots(base)

# ideas
# data weighting - may need to change input n
# recreational selex blocks
# dome shaped selectivity

model = "0.1.1_dw_dirichlet"
base = SS_output(file.path(wd, model))
SS_plots(base)
# fleet 1 hitting the upper bound - need to re-evaluate input N


model = "0.1.2_dw_francis"
base = SS_output(file.path(wd, model))
SS_plots(base)
# Move forward with francis for now
# Should revisit once I change inputN for commercial fleet

# Hessian - non-positive definite...
model = "0.2.1_recdevs"
base = SS_output(file.path(wd, model))
SS_plots(base)


model = "0.3.1_dome_selex_all"
base = SS_output(file.path(wd, model))
SS_plots(base)
# There was only really an improvement in NLL for the rec fleet


model = "0.3.2_dome_selex_rec"
base = SS_output(file.path(wd, model))
SS_plots(base)


