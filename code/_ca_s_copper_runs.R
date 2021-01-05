
# Copper South California Model Runs

library(r4ss)

wd = "N:/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/models/ca_s_pt_c"
wd = "C:/Assessments/2021/copper_rockfish_2021/models/ca_s_pt_c"

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
model = "2.1_recdevs"
base = SS_output(file.path(wd, model))
SS_plots(base)
# Strong recruitments in 2008 and after


model = "0.3.1_dome_selex_all"
base = SS_output(file.path(wd, model))
SS_plots(base)
# There was only really an improvement in NLL for the rec fleet


model = "0.3.2_dome_selex_rec"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 253.663, R0 = 5.51, depl 2021 = 0.022


model = "4.1_growth_linf_999"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 249.63, R0 = 5.5

# Estimated the hessian with this one!
model = "4.2_growth_linf_999_est_L2"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 241.5, R0 = 5.48, depl 2021 = 0.113
# L2 (female) = 47.3, L2 (male) = 45.0

# Add the hkl index
model = "5.1_data_add_index"
base = SS_output(file.path(wd, model))
SS_plots(base)


# Add the hkl index & bias adj from 4.2 model
model = "5.2_data_add_index_bias_adj"
base = SS_output(file.path(wd, model))
SS_plots(base)


# Allow for extra sd to be estimated:
model = "5.3_data_add_index_extra_sd"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 237.4, R0 = 5.54, depl 2021 = 0.04


# Revisit data-weighting
model = "6.1_dw_dirichlet"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 1082.03, R0 = 5.58, depl 2021 = 0.06
# Commercial fleet DM parameters hitting the upper bounds

model = "6.2_dw_francis"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 270.03, R0 = 5.54, depl 2021 = 0.04
# Dead_Catch_SPR 56.4813

# McAllister-Iannelli 0.608, 0.045, 0.681
model = "6.3_dw_mcallister"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 313.94, R0 = 5.54, depl 2021 = 0.035


# Turn off rec devs 
# What happens if the devs are not there to support recent catches?
model = "6.4_dw_francis_no_recdevs"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 510.893, R0 = 5.4, depl 2021 = 0.03
# Dead_Catch_SPR 46.5694

# Turn off rec devs & estimate L2s
model = "6.5_dw_francis_no_recdevs_est_L2"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 408.771, R0 = 5.65, depl 2021 = 0.12
# L2 (f) = 44.67, L2 (m) = 41.7 weirdly small

# Major Data Update
# 1. Replace the recreational lengths to fork lengths from total lengths
# 2. Add NWFSC WCGBTS data
# Move forward with model = "6.2_dw_francis" 
model = "7.1_data_rec_len_add_trawl"
base = SS_output(file.path(wd, model))
SS_plots(base)
# Initially I allowed the NWFSC WCGBTS to be domed but the model estimated asymtotic selex.
# The model is very poorly fitting the WCGBTS data.
# NLL = 292.344

# Allow more rec selex parameters to be estimated starting from a steep dome. 
# Estimate most of the parameters and then fix some (est p1, p3, p6)
model = "7.2_data_selex_rec_dome"
base = SS_output(file.path(wd, model))
SS_plots(base)
# Slightly steeper dome estimated, but little change in the NLL
# The depl does not change greatly ending ~6% (vs. 4.% above) 
# NLL = 293.7, rec length like = 103.3

# Allow more com selex parameters to be estimated starting from a steep dome. 
# Estimate most of the parameters and then fix some (est p1, p3, p6)
model = "7.3_data_selex_com_est"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL 290.3, improve in the fit to the commercial length data (-3 LL)
# R0 = 5.5, depl 2021 = 0.07
# The commercial shifts left-ward and has a dome in selex

# Allow more hkl selex parameters to be estimated 
# Estimate most of the parameters and then fix some (est p1, p3, p6)
model = "7.4_data_selex_hkl"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 289.95, R0 = 5.5

# Allow more trawl survey selex parameters to be estimated 
# Estimate most of the parameters and then fix some (est p1, p3, p6)
model = "7.5_data_selex_wcgbts"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 289.95

# Re-data-weight
model = "8.1_dw_MI"
base = SS_output(file.path(wd, model))
SS_plots(base)
# R0 = 5.53, depl 2021 = 0.075, string of + recdevs from 2008-2013

model = "8.2_dw_francis"
base = SS_output(file.path(wd, model))
SS_plots(base)
# R0 = 5.51, depl 2021 = 0.247, string of + recdevs from 2008-2013
# There is a big difference between the model results for the francis and MI
# data weighting. MI results in a much higher stock status (around 0.25) vs.
# francis which has the stock very depleted (~0.07). The MI approach puts much more
# weight on the hkl and trawl survey data and the hkl data weight is likely driving
# these differences. 


# Apply bias adjust and start main devs later in 1985
model = "8.3_dw_francis_recdev_main_later"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 305.3, R0 = 5.55, depl 2021 = 0.062
# Still getting those low recdevs and the high recdevs are marginally lower.

# Do rec dev bias adjustment and address the string of positive recs
# 	- I think the dip in rec devs at the start is due to large commercial lengths 
#	  at the start of the data (1983 -89, and 1993ish)
# Revisit dome shape vs. asymptotic selex for comm & rec



##########################################################
# Quick sensitivity looking at Linf and maturity
##########################################################
sen_wd = "C:/Assessments/2021/copper_rockfish_2021/models/ca_s_pt_c/_sensitivity"
model = "0.3.2_dome_selex_rec"
base = SS_output(file.path(sen_wd, model))

model = "0.3.2_dome_selex_rec_est_linf"
linf_est = SS_output(file.path(sen_wd, model))
# NLL = 24.1469, R0 = 5.48, depl 2021 = 0.11
# Linf females = 46.4865, Linf males = 44.558
model = "0.3.2_dome_selex_rec_est_linf_mat"
linf_est_mat = SS_output(file.path(sen_wd, model))
# NLL = 241.5, depl 2021 = 0.11
model = "0.3.2_dome_selex_rec_linf_48"
linf_48 = SS_output(file.path(sen_wd, model))
# NLL = 244.1, R0 = 5.49, depl 2021 = 0.058
model = "0.3.2_dome_selex_rec_linf_46"
linf_46 = SS_output(file.path(sen_wd, model))
# NLL = 241.8, R0 = 5.49, depl 2021 = 0.141
model = "0.3.2_dome_selex_rec_linf_44"
linf_44 = SS_output(file.path(sen_wd, model))
# NLL = 249.7, R0 = 5.6, depl 2021 = 0.384
model = "0.3.2_dome_selex_rec_linf_48_mat"
linf_48_mat = SS_output(file.path(sen_wd, model))
# NLL = 243.0, R0 = 5.46, depl 2021 = 0.073
model = "0.3.2_dome_selex_rec_linf_46_mat"
linf_46_mat = SS_output(file.path(sen_wd, model))
# NLL = 241.6, R0 = 5.44, depl 2021 = 0.195

modelnames <- c("Coastwide Growth", 
				"Estimate Growth",
				"Estimate Growth & Adj. Mat.",
				"Linf 48 cm",
				"Linf 48 cm & Adj.Mat ",
				"Linf 46 cm",
				"Linf 46 cm & Adj. Mat ")
mysummary <- SSsummarize(list(base,  linf_est, linf_est_mat, linf_48, 
	linf_48_mat, linf_46, linf_46_mat))

SSplotComparisons(mysummary, 
				  legendlabels = modelnames, 
				  plotdir = file.path(sen_wd, "_plots"),
				  pdf = TRUE)

