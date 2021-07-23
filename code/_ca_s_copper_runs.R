
# Copper South California Model Runs

library(r4ss)
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/r4ss")

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

model = "8.1.1_dw_MI_selex_asymptotic"
base = SS_output(file.path(wd, model))
SS_plots(base)

model = "8.1.2_dw_MI_selex_asymptotic_rm_data"
base = SS_output(file.path(wd, model))
SS_plots(base)

model = "8.1.3_dw_MI_selex_dome_rm_data"
base = SS_output(file.path(wd,  model))
SS_plots(base)

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

# Fix selex asymptotic for the commercial & rec fleets
model = "8.4_dw_francis_recdev_main_later_selex_asymptotic"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 322.1, R0 = 5.55, depl 2021 = 0.024
# This results in all early devs being estimated as negative values.

# Turn off early devs and fix selex asymptotic for the commercial & rec fleets
model = "8.5_dw_francis_recdev_no_early_selex_asymptotic"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 329.7, R0 = 5.32, depl 2021 = 0.022

# Remove the early commercial data with limited samples sizes
model = "8.6_dw_francis_recdev_main_later_selex_asymptotic_rm_data"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 301.2, R0 = 5.6, depl 2021 = 0.024

# DW: I think the MI does a better job of finding the balence between hkl and 
# rec data. 
# Selex: It looks like the rec fleet may be best modeled
# with dome shaped selectivity. Need to explore whether that is appropriate
# for commercial data.  
# RecDevs: Try to eliminat the early dip in devs and evaluate how the early 
# commercial higher mean lengths impacts the estimates.

# Recreational Domed - Commercial Asymptotic
model = "9.0_selex_rec_dome_com_asymptotic"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 557.5, R0 = 5.6, depl 2021 = 0.14
# Both Fleets Domed: NLL = 540.1, R0 = 5.6, depl 2021 = 0.22
# Based on the fits going to keep the domed selectivity

model = "9.1_selex_domed"
base = SS_output(file.path(wd, model))

# Push the main rec dev period later
model = "9.2_recdev_main_later"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 538.3, R0 = 5.6, depl 2021 = 0.19
# The devs look ok. The big difference in fits between francis and MI
# where francis fit the aggregated  comps better by shifting both the
# rec and commercial selex rightward: Com P1 = 36.6, Rec P1 = 31.4 vs.
# MI Com P1 = 34.2, Rec P1 = 29.8. In the MI model having the peak to the
# left results in the decline in the dome occuring earlier (more unavaialbe
# bio) which results in a more opptomistic stock size. 

# Given the importance of selectivity - let's re-evaluate the parameters
# using the MI data weights
model = "9.3_selex_rec_est_all"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 533.7, R0 = 5.68, depl 2021 = 0.285
# P1 shifted right by <1 cm to 30.5 with steeper dome

model = "9.4_selex_com_est_all"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 522.7, R0 = 5.75, depl 2021 = 0.460
# Com P1 shifts right by ~1cm to 34.6 with a steeper dome (width similar)

# MI Weights 1.129, 0.036, 0.653
# Francis 0.7177*current, 1.84*current, 0.582*current

# Franics
model = "9.5.0_dw_francis"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 431.2, R0 = 6.03, depl 2021 = 0.664
# The domes are fairly steep and result in a much improved stock status

# Francis & Asymptotic Recreational Selectivity
model = "9.5.1_dw_francis_rec_asym"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 524.8, R0 = 5.4, depl 2021 = 0.082 
# New francis dw: com = 1.544*current rec = 1.1933*current, hkl ~ same

# Francis & Asymptotic Commercial Selectivity
model = "9.5.2_dw_francis_com_asym"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 497.9, R0 = 5.7, depl 2021 = 0.24

# Francis Domed Selectivity for Both paras from 8.0 model
model = "9.5.3_dw_francis_dome_para_8.0"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 491.5, R0 = 5.6, depl 2021 = 0.22

# Francis Domed Selectivity for both fleets paras from 8.0 model
# Revert to early start of estimating main devs to evaluate the impact
# of changing the start year to 1985 in the above models.
model = "9.5.4_dw_francis_dome_para_recdev"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 491, R0 = 5.5, depl 2021 = 0.25

# With early devs starting in 1975 - add back in the removed com lengths
model = "9.5.5_dw_francis_dome_para_recdev_add_com_data"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 528, R0 = 5.5, depl 2021 = 0.30
# Adding these few years with limited samples have a disproportionate
# impact on the model results

# Build off of 9.53: Francis Domed Selectivity for Both paras from 8.0 model
# Main recdev period start 1985, rm early com data
# Estimate the descending limb for both fleets
model = "9.5.6_dw_francis_dome_para_8.0_selex_est_desc"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 463, R0 = 6.05, depl 2021 = 0.672

model = "9.5.8_dw_francis_dome_para_8.0_selex_est_desc_rec_only_rm_hkl"
base = SS_output(file.path(wd, model))
SS_plots(base)
# R0 = 5.5, depl 2021 = 0.07
# Removing the hkl data not only greatly impacts the status, but also
# results in wider dome selectivity which are slightly right shifts. 

model = "9.5.9_dw_francis_dome_para_8.0_selex_fix_selex_w_hkl"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 230.6, R0 = 5.54, depl = 0.094 (asymptotic fixed)
# NLL = 215.9, R0 = 5.49, depl = 0.104 (all hkl selex para estimated - sharp dome to 0.50)

model = "9.5.11_dw_francis_dome_est_p1p3"
base = SS_output(file.path(wd, model))
SS_plots(base)

model = "9.5.12_dw_francis_dome_est_p1p3p6"
base = SS_output(file.path(wd, model))
SS_plots(base)

model = "9.5.13_dw_francis_dome_est_p1p3p4p6"
base = SS_output(file.path(wd, model))
SS_plots(base)

# MI
model = "9.6.0_dw_mi"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 545.3, R0 = 5.84, depl 2021 = 0.545

# MI & Asymptotic Recreational Selectivity
model = "9.6.1_dw_mi_rec_asym"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 580.3, R0 = 5.4, depl 2021 = 0.125 

# MI & Asymptotic Commercial Selectivity
model = "9.6.2_dw_mi_com_asym"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 586.1, R0 = 5.7, depl 2021 = 0.16
# Forcing the commercial asymptotic results in a distinct change in 
# the recreational selectivity (wider and less domed)

model = "9.7_dw_dirichlet"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 562.8, R0 = 5.83, depl 2021 = 0.53
# Full weight being give to the commercial and the rec fleet
# com = 0.992, rec = 0.993, hkl = 0.987


# Moving forward in dome shaped selectivity for both fleets
# with wider shape. 9.5.12_dw_francis_dome_est_p1p3p6
model = "10.0.0_dw_francis_dome"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 278, R0 = 5.6, depl 2021 = 0.066

model = "10.0.1_dw_francis_9.5.0_selex"
base = SS_output(file.path(wd, model))
SS_plots(base)

model = "10.0.2_dw_francis_9.5.0_selex_fix"
base = SS_output(file.path(wd, model))
SS_plots(base)

model = "10.1_dw_mi"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 317, R0 = 5.5, depl 2021 = 0.065

model = "10.2_dw_dirichlet"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 1047, R0 = 5.6, depl 2021 = 0.069



# Updated 10.0 base model with all sites index and updated maturity data
model = "10.3_base"
base = SS_output(file.path(wd, model))
SS_plots(base)

model = "10.4_base_mat_linf_com_catch"
base = SS_output(file.path(wd, model))
SS_plots(base)

model = "10.5_base_growth"
growth = SS_output(file.path(wd, model))

model  = "10.5_base_growth_no_recdevs"
nodevs = SS_output(file.path(wd, model))

model  = "10.5_base_growth_no_recdevs_asym_com"
com = SS_output(file.path(wd, model))

model  = "10.5_base_growth_no_recdevs_asym_rec"
rec = SS_output(file.path(wd, model))

modelnames <- c("10.3 Base",
				"10.5 Growth",
				"10.5 Growth & No Devs.",
				"10.5 Growth, No Devs., & Com. Asym.",
				"10.5 Growth, No Devs., & Rec. Asym.")
mysummary <- SSsummarize(list(base, growth, nodevs, com, rec))

SSplotComparisons(mysummary, 
				  filenameprefix = "10.5_growth_",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)


model  = "10.6_base_new_len_data"
data = SS_output(file.path(wd, model))
SS_plots(data)

modelnames <- c(
				"10.5 Growth & No Devs.",
				"10.6 New Len Data")
mysummary <- SSsummarize(list(nodevs, data))

SSplotComparisons(mysummary, 
				  filenameprefix = "10.6_len_data_",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

model  = "10.7_data_len_data_asym"
asym = SS_output(file.path(wd, model))
SS_plots(asym)

model  = "10.8_data_asym_rm_hkl"
no_hkl = SS_output(file.path(wd, model))
SS_plots(no_hkl)

model = "10.9_data_asym_rmhkl_recdevs"
recdevs = SS_output(file.path(wd, model))
SS_plots(recdevs)

model = "10.10_data_rmhkl"
fix_no_hkl = SS_output(file.path(wd, model))
SS_plots(fix_no_hkl)

model = "10.10_data_rmhkl_asym_com"
asym_com = SS_output(file.path(wd, model))
SS_plots(asym_com)

model = "10.11_data_rmhkl_asym_com"
asym_com = SS_output(file.path(wd, model))
SS_plots(asym_com)

model = "10.12_data_rmhkl_asym_rec"
asym_rec = SS_output(file.path(wd, model))
SS_plots(asym_rec)

model = "11.0_2_area"
area = SS_output(file.path(wd, model))
SS_plots(area)

model = "11.1_2_area_recdevs"
area = SS_output(file.path(wd, model))
SS_plots(area)

model = "11.2_2_area_recdevs_cca"
area = SS_output(file.path(wd, model))
SS_plots(area)

model = "12.0_base"
base = SS_output(file.path(wd, model))
SS_plots(base)

model = "12.1_base_corrected_pacfin"
pacfin = SS_output(file.path(wd, model))
SS_plots(pacfin)

#############################################################
modelnames <- c("Wrong PacFIN", "Correct PacFIN")
mysummary <- SSsummarize(list(base, pacfin))

SSplotComparisons(mysummary, 
				  filenameprefix = "12.1_pacfin_",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)


#############################################################
modelnames <- c("All HKL Data", "Outside the CCA Only")
mysummary <- SSsummarize(list(base, outside))

SSplotComparisons(mysummary, 
				  filenameprefix = "12.0_hkl_data_",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

#############################################################
# Sensitivity 

model = "12.0_base_recdevs"
devs = SS_output(file.path(wd, "_sensitivities", model))
SS_plots(devs)

model = "12.0_base_recfin_index"
recfin = SS_output(file.path(wd, "_sensitivities", model))
SS_plots(recfin)

model = "12.0_base_recfin_index_asym_devs"
alt = SS_output(file.path(wd, "_sensitivities", model))
SS_plots(alt)


#############################################################
# Sensitivity 

# Remove the HKL & WCGBTS data
model = "8.6_dw_francis_recdev_rm_hkl"
base = SS_output(file.path(wd, "_sensitivities", model))
SS_plots(base)
# R0 = 5.51, depl 2021 = 0.0007

# Emphasize the hkl data
# Use HKL Data & Set the Rec Lambda = 0.01
model = "8.6_dw_francis_recdev_lambda_rec"
base = SS_output(file.path(wd, "_sensitivities", model))
SS_plots(base)

model = "8.1.3_dw_MI_selex_dome_rm_data"
base = SS_output(file.path(wd, "_sensitivities", model))
SS_plots(base)

model = "8.1.3_dw_MI_lambda_rec"
base = SS_output(file.path(wd, "_sensitivities", model))
SS_plots(base)

model = "8.6_dw_francis_no_devs_lambda_rec"
base = SS_output(file.path(wd, "_sensitivities", model))
SS_plots(base)

# How Domed does the rec fleet need to be to look like hkl only model
model = "8.6_dw_francis_recdev_rm_hkl_rec_dome"
base = SS_output(file.path(wd, "_sensitivities", model))
SS_plots(base)


model = "8.1.0_dw_MI"
mi = SS_output(file.path(wd,  model))
model = "8.1.0_nodevs"
base_nodevs = SS_output(file.path(wd, "_sensitivities", model))
model = "8.1.0_nodevs_rm_hkl"
no_hkl = SS_output(file.path(wd, "_sensitivities", model))
model = "8.1.0_nodevs_lambda_rec"
no_rec = SS_output(file.path(wd, "_sensitivities", model))
modelnames <- c("8.1.0 MI with Domed Selex",
				"No Rec Devs", 
				"No Rec Devs & No HKL Data",
				"No Rec Devs & DW Rec Data")
mysummary <- SSsummarize(list(mi, base_nodevs, no_hkl, no_rec))

SSplotComparisons(mysummary, 
				  filenameprefix = "8.1.0_norecdevs_",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_sensitivities", "_plots"),
				  pdf = TRUE)

#############################################################

# Items applied in the north model to be tested here:
#	- commercial blocked (1916 - 2008)
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

###############################################################

model = "12.1_base"
base = SS_output(file.path(wd, model))
model = "12.1_base_hkl_len_only"
hkl_len = SS_output(file.path(wd, "_sensitivities", model))
SS_tune_comps(replist = hkl_len, option = "Francis", dir = file.path(wd, "_sensitivities", model))
model = "12.1_base_no_hkl_len_catch"
hkl_catch = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_hkl_index_only"
hkl_index = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_hkl_outside_only"
hkl_outside = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_hkl_len_only_dw"
hkl_len_dw = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_wcgbt"
wcgbt = SS_output(file.path(wd, "_sensitivities", model))


modelnames <- c("12.1 Base Model",
				"HKL Lengths Only", 
				"HKL Lengths Only - DW",
				"HKL Lengths w/ Catch",
				#"HKL Index Only",
				"HKL Outside CCA", "Add WCGBTS")
mysummary <- SSsummarize(list(base, hkl_len, hkl_len_dw, hkl_catch,
			hkl_outside, wcgbt))

SSplotComparisons(mysummary, 
				  filenameprefix = "12.1_hkl_",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_sensitivities", "_plots"),
				  pdf = TRUE)

model = "12.2_base" # fixed rec lengths
new = SS_output(file.path(wd, model))
SS_plots(new)


model = "12.1_base_hkl_domed"
hkl_dome = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_hkl_domed_com_asym"
com_asym = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_hkl_upweight"
hkl_upweight = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_recfin_index"
recfin = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_cpfv_index"
cpfv = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_recfin_cpfv"
cpfv_recfin = SS_output(file.path(wd, "_sensitivities", model))
SS_plots(cpfv_recfin)

modelnames <- c("Base","HKL Domed", "HKL Domed & Com. Asym.", "HKL Upweighted",
		"RecFIN Index", "CPFV Index", "RecFIN & CPFC Indices")
mysummary <- SSsummarize(list(base, hkl_dome, com_asym, hkl_upweight, recfin, cpfv, cpfv_recfin))
SSplotComparisons(mysummary, 
				  filenameprefix = "12.1_ssc_",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

model = "12.1_base_recdevs" 
old = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_recdevs_new" 
new = SS_output(file.path(wd, "_sensitivities", model))

model = "12.1_base_recdevs_asym_both_new" 
asym = SS_output(file.path(wd, "_sensitivities", model))

modelnames <- c("Orig RecDevs", "New RecDevs", 'New RecDevs & Asym Selex (both)')
mysummary <- SSsummarize(list(old, new, asym))
SSplotComparisons(mysummary, 
				  filenameprefix = "12.1_recdevs_",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_sensitivities", "_plots"),
				  pdf = TRUE)


modelnames <- c("Orig RecDevs", "New RecDevs", 'New RecDevs & Asym Selex (both)')
mysummary <- SSsummarize(list(old, new, asym))
SSplotComparisons(mysummary, 
				  filenameprefix = "12.1_recdevs_",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_sensitivities", "_plots"),
				  pdf = TRUE)


model = "12.1_base_hkl_len_only_dw"
hkl_len_dw = SS_output(file.path(wd, "_sensitivities", model))

model = "12.1_base_hkl_domed_com_asym"
com_asym = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_recfin_index"
recfin = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_cpfv_index"
cpfv = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_recfin_cpfv"
cpfv_recfin = SS_output(file.path(wd, "_sensitivities", model))
SS_plots(cpfv_recfin)

###################################################################
#  SSC Review
###################################################################

model = "12.1_base"
base = SS_output(file.path(wd, model))
model = "12.1_base_hkl_len_only"
hkl_len = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_hkl_index_only"
hkl_index = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_hkl_outside_only"
hkl_outside = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_hkl_domed"
hkl_dome = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_hkl_no_var"
hkl_var = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_recdevs_hkl_var"
hkl_var_recdevs = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_recdevs"
recdevs = SS_output(file.path(wd, "_sensitivities", model))


modelnames <- c("Base", "HKL Length Only", 
	'HKL Outside CCA Only', "HKL Dome Shaped Selectivity", 
	"HKL w/ No Added Var.", "Rec. Devs", "Rec. Devs. & HKL w/ No Added Var.")
mysummary <- SSsummarize(list(base, hkl_len, hkl_outside,
	hkl_dome, hkl_var, recdevs, hkl_var_recdevs))

SSplotComparisons(mysummary, endyrvec = 2021, 
                  legendlabels = modelnames, 
                  ylimAdj = 1.15,
                  plotdir = file.path(wd, "_sensitivities", '_plots'), 
                  legendloc = "topright", 
                  filenameprefix = "12.1_ssc_hkl_",
                  subplot = c(2,4,12,13,14,15), 
                  print = TRUE,
                  pdf = FALSE)


ii = 1:length(modelnames)
n = length(modelnames)
out<- matrix(NA, 26, max(ii))
x = mysummary
out = rbind(
            as.numeric(x$likelihoods[x$likelihoods$Label == "TOTAL",1:n]), 
            as.numeric(x$likelihoods[x$likelihoods$Label == "Survey",1:n]), 
            as.numeric(x$likelihoods[x$likelihoods$Label == "Length_comp",1:n]),
            t(as.numeric(x$likelihoods_by_fleet[x$likelihoods_by_fleet$Label == "Length_like", "CA_S_Commercial"])),
            t(as.numeric(x$likelihoods_by_fleet[x$likelihoods_by_fleet$Label == "Length_like", "CA_S_Recreational"])),
            t(as.numeric(x$likelihoods_by_fleet[x$likelihoods_by_fleet$Label == "Length_like", "NWFSC_HKL"])),
            #as.numeric(x$likelihoods[x$likelihoods$Label == "Age_comp",1:n]), 
            as.numeric(x$likelihoods[x$likelihoods$Label == "Recruitment",1:n]), 
            as.numeric(x$likelihoods[x$likelihoods$Label == "Forecast_Recruitment",1:n]),
            as.numeric(x$likelihoods[x$likelihoods$Label == "Parm_priors",1:n]),
            as.numeric(x$pars[x$pars$Label == "SR_LN(R0)", 1:n]), 
            as.numeric(x$SpawnBio[x$SpawnBio$Label == "SSB_Virgin", 1:n]),
            as.numeric(x$SpawnBio[x$SpawnBio$Label == "SSB_2021", 1:n]),
            as.numeric(x$Bratio[x$Bratio$Label == "Bratio_2021", 1:n]), 
            as.numeric(x$quants[x$quants$Label == "Dead_Catch_SPR", 1:n]),
            as.numeric(x$pars[x$pars$Label == "SR_BH_steep", 1:n]),
            as.numeric(x$pars[x$pars$Label == "NatM_p_1_Fem_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "L_at_Amin_Fem_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "L_at_Amax_Fem_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "VonBert_K_Fem_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "CV_young_Fem_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "CV_old_Fem_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "NatM_p_1_Mal_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "L_at_Amin_Mal_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "L_at_Amax_Mal_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "VonBert_K_Mal_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "CV_young_Mal_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "CV_old_Mal_GP_1", 1:n]) )  

out = as.data.frame(out)
colnames(out) = modelnames
rownames(out) = c("Total Likelihood",
                  "Survey Likelihood",
                  "Length Likelihood",
                  "Commercial Length Like.",
                  "Recreational Length Like.",
                  "NWFSC HKL Like.",
                  #"Age Likelihood",
                  "Recruitment Likelihood",
                  "Forecast Recruitment Likelihood",
                  "Parameter Priors Likelihood",
                  "log(R0)",
                  "SB Virgin",
                  "SB 2020",
                  "Fraction Unfished 2021",
                  "Total Yield - SPR 50",
                  "Steepness",
                  "Natural Mortality - Female",
                  "Length at Amin - Female",
                  "Length at Amax - Female",
                  "Von Bert. k - Female",
                  "CV young - Female",
                  "CV old - Female",
                  "Natural Mortality - Male",
                  "Length at Amin - Male",
                  "Length at Amax - Male",
                  "Von Bert. k - Male",
                  "CV young - Male",
                  "CV old - Male")


write.csv(out, file = file.path(wd, "_sensitivities", "_plots", "12.1_hkl_sensitivities_new.csv"))


model = "12.1_base_hkl_upweight"
hkl_upweight = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_hkl_upweight_selex"
hkl_upweight_selex = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_hkl_upweight_recdevs"
hkl_upweight_recdevs = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_hkl_upweight_recdevs_selex"
hkl_upweight_recdevs_selex = SS_output(file.path(wd, "_sensitivities", model))

modelnames <- c("Base", "Up-Weighted HKL Length and Index (Fix Com/Rec Selex)",
	"Up-Weighted HKL Length and Index", 
	"Up-Weighted HKL Length and Index w/ Rec. Devs. (Fix Com/Rec Selex)", 
	"Up-Weighted HKL Length and Index w/ Rec. Devs.")
mysummary <- SSsummarize(list(base, hkl_upweight, 
	hkl_upweight_selex, hkl_upweight_recdevs, 
	hkl_upweight_recdevs_selex))

SSplotComparisons(mysummary, endyrvec = 2021, 
                  legendlabels = modelnames, 
                  ylimAdj = 1.4,
                  plotdir = file.path(wd, "_sensitivities", '_plots'), 
                  legendloc = "topright", 
                  filenameprefix = "12.1_ssc_hkl_upweighted_",
                  subplot = c(2,4,12, 13,14,15), 
                  print = TRUE,
                  pdf = FALSE)


model = "12.1_base_recfin_index"
recfin = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_cpfv_index"
cpfv = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_recfin_cpfv"
cpfv_recfin = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_recfin_cpfv_hkl_var"
cpfv_recfin_var = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_recfin_cpfv_recdevs"
cpfv_recfin_recdevs = SS_output(file.path(wd, "_sensitivities", model))


modelnames <- c("Base", "RecFIN Index", "CPFV Index", "RecFIN + CPFV Index",
	#"RecFIN, CPFV, HKL No added Var.",
	"RecFIN + CPFV Indices w/ Rec. Devs.")
mysummary <- SSsummarize(list(base, recfin, cpfv, cpfv_recfin, 
	#cpfv_recfin_var, 
	cpfv_recfin_recdevs))

SSplotComparisons(mysummary, endyrvec = 2021, 
                  legendlabels = modelnames, 
                  ylimAdj = 1.15,
                  plotdir = file.path(wd, "_sensitivities", '_plots'), 
                  legendloc = "topright", 
                  filenameprefix = "12.1_ssc_rec_indices_",
                  subplot = c(1,3), 
                  print = TRUE,
                  pdf = FALSE)

model = "12.1_base"
base = SS_output(file.path(wd, model))
model = "12.1_base_no_hkl"
no_hkl = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_no_hkl_recdevs"
no_hkl_recdevs = SS_output(file.path(wd, "_sensitivities", model))
modelnames <- c("Base Model", "No HKL Data", "No HKL Data w/ Rec. Devs.")
mysummary <- SSsummarize(list(base, no_hkl, no_hkl_recdevs))

SSplotComparisons(mysummary, endyrvec = 2021, 
                  legendlabels = modelnames, 
                  ylimAdj = 1.15,
                  plotdir = file.path(wd, "_sensitivities", '_plots'), 
                  legendloc = "topright", 
                  filenameprefix = "12.1_ssc_no_hkl_",
                  subplot = c(2,4, 12), 
                  print = TRUE,
                  pdf = FALSE)


model = "12.1_base"
base = SS_output(file.path(wd, model))
model = "12.1_base_no_hkl_2"
no_hkl = SS_output(file.path(wd, "_sensitivities", model))
model = "12.1_base_no_hkl_2_recdevs"
no_hkl_w_recdevs = SS_output(file.path(wd, "_sensitivities", model))

modelnames <- c("Base Model", "No HKL Data", "No HKL Data w/ Rec. Devs.")
mysummary <- SSsummarize(list(base, no_hkl, no_hkl_w_recdevs))
SSplotComparisons(mysummary, endyrvec = 2021, 
                  legendlabels = modelnames, 
                  ylimAdj = 1.15,
                  plotdir = file.path(wd, "_sensitivities", '_plots'), 
                  legendloc = "topright", 
                  filenameprefix = "12.1_ssc_no_hkl_only_",
                  subplot = c(2,4), 
                  print = TRUE,
                  pdf = FALSE)

################################################################################
#  Council Requests
################################################################################
model = "12.1_base"
base = SS_output(file.path(wd, model))

model = "12.1_base_council_cpfv_mirror"
mirror = SS_output(file.path(wd, "_sensitivities", model))
SS_plots(mirror)

model = "12.1_base_council_cpfv"
cpfv = SS_output(file.path(wd, "_sensitivities", model))
SS_plots(cpfv)
SS_tune_comps(replist = cpfv, option = "Francis", dir = file.path(wd, "_sensitivities", model))

modelnames <- c("Adopted Model", "+ Early Length Data")
mysummary <- SSsummarize(list(base, cpfv))
SSplotComparisons(mysummary, 
				  filenameprefix = "12.1_council_cpfv_data_",
				  legendlabels = modelnames, 
				  #ylimAdj = 1.45,
				  plotdir = file.path(wd, "_sensitivities", "_plots"),
                  subplot = c(2,4), 
                  print = TRUE,
                  pdf = FALSE)

################################################################################
# Table of estimates from the added data
################################################################################
x = mysummary
ii = 1:length(modelnames)
n = length(modelnames)
out = matrix(NA, 35, max(ii))
find1 = which(x$likelihoods_by_fleet$model == 1 &x$likelihoods_by_fleet$Label == "Length_like")
find2 = which(x$likelihoods_by_fleet$model == 2 &x$likelihoods_by_fleet$Label == "Length_like")
find3 = which(x$likelihoods_by_fleet$model == 3 &x$likelihoods_by_fleet$Label == "Length_like")

out = rbind(
            as.numeric(x$likelihoods[x$likelihoods$Label == "TOTAL",1:n]), 
            as.numeric(x$likelihoods[x$likelihoods$Label == "Survey",1:n]), 
            as.numeric(x$likelihoods[x$likelihoods$Label == "Length_comp",1:n]),
            c(as.numeric(x$likelihoods_by_fleet[find1,4]), as.numeric(x$likelihoods_by_fleet[find2,4])),
            c(as.numeric(x$likelihoods_by_fleet[find1,5]), as.numeric(x$likelihoods_by_fleet[find2,5])),
            c(as.numeric(x$likelihoods_by_fleet[find1,6]), as.numeric(x$likelihoods_by_fleet[find2,6])),
            as.numeric(x$likelihoods[x$likelihoods$Label == "Parm_priors",1:n]),
            as.numeric(x$pars[x$pars$Label == "SR_LN(R0)", 1:n]), 
            as.numeric(x$SpawnBio[x$SpawnBio$Label == "SSB_Virgin", 1:n]),
            as.numeric(x$SpawnBio[x$SpawnBio$Label == "SSB_2021", 1:n]),
            as.numeric(x$Bratio[x$Bratio$Label == "Bratio_2021", 1:n]), 
            as.numeric(x$quants[x$quants$Label == "Dead_Catch_SPR", 1:n]),
            as.numeric(x$pars[x$pars$Label == "SR_BH_steep", 1:n]),
            as.numeric(x$pars[x$pars$Label == "NatM_p_1_Fem_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "L_at_Amin_Fem_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "L_at_Amax_Fem_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "VonBert_K_Fem_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "CV_young_Fem_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "CV_old_Fem_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "NatM_p_1_Mal_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "L_at_Amin_Mal_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "L_at_Amax_Mal_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "VonBert_K_Mal_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "CV_young_Mal_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "CV_old_Mal_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "LnQ_base_NWFSC_HKL(3)", 1:n]), 
            as.numeric(x$pars[x$pars$Label == "Q_extraSD_NWFSC_HKL(3)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_peak_CA_S_Commercial(1)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_ascend_se_CA_S_Commercial(1)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_end_logit_CA_S_Commercial(1)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_peak_CA_S_Recreational(2)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_ascend_se_CA_S_Recreational(2)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_end_logit_CA_S_Recreational(2)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_peak_NWFSC_HKL(3)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_ascend_se_NWFSC_HKL(3)", 1:n]))  
			
out = as.data.frame(out)
colnames(out) = modelnames
rownames(out) = c("Total Likelihood",
                  "Survey Likelihood",
                  "Length Likelihood",
                  "Commercial Length Likelihood",
                  "Recreational Length Likelihood",
                  "NWFSC HKL Length Likelihood",
                  "Parameter Priors Likelihood",
                  "log(R0)",
                  "SB Virgin",
                  "SB 2021",
                  "Fraction Unfished 2021",
                  "Total Yield - SPR 50",
                  "Steepness",
                  "Natural Mortality - Female",
                  "Length at Amin - Female",
                  "Length at Amax - Female",
                  "Von Bert. k - Female",
                  "CV young - Female",
                  "CV old - Female",
                  "Natural Mortality - Male",
                  "Length at Amin - Male",
                  "Length at Amax - Male",
                  "Von Bert. k - Male",
                  "CV young - Male",
                  "CV old - Male",
                  "log(Q) NWFSC HKL", "Extra SD NWFSC HKL",
                  "Peak Selectivity - Commercial", "Ascending Selectivity - Commercial", "Final Selectivity - Commercial",
				  "Peak Selectivity - Recreational", "Ascending Selectivity - Recreational", "Final Selectivity - Recreation",
				  "Peak Selectivity - NWFSC HKL", "Ascending Selectivity - NWFSC HKL")
t = sa4ss::table_format(x = out,
      caption = 'Data sensitivity relative to the adoptedbase model.',
      label = 'data-sens-south',
      digits = 3,
      col_names = modelnames)

kableExtra::save_kable(t,
file = "C:/Assessments/2021/copper_rockfish_2021/write_up/council_requests/sca_data_sens.tex")

################################################################################
model = "12.1_base_council_cpfv_rec_selex_block"
cpfv_selex = SS_output(file.path(wd, "_sensitivities", model))
SS_plots(cpfv_selex)
#SS_tune_comps(replist = cpfv_selex, option = "Francis", dir = file.path(wd, "_sensitivities", model))

model = "12.1_base_council_cpfv_all_selex_block"
all_selex = SS_output(file.path(wd, "_sensitivities", model))
SS_plots(all_selex)

model = "12.1_base_council_cpfv_rec_selex_block_fix"
cpfv_selex_fix = SS_output(file.path(wd, "_sensitivities", model))
SS_plots(cpfv_selex_fix)
#SS_tune_comps(replist = cpfv_selex, option = "Francis", dir = file.path(wd, "_sensitivities", model))

model = "12.1_base_council_cpfv_all_selex_block_fix"
all_selex_fix = SS_output(file.path(wd, "_sensitivities", model))
SS_plots(all_selex_fix)

modelnames <- c("Adopted Model", "+ Early Length Data", 
	'+ Early Length Data & Selex Block Est.',
	'+ Early Length Data & Selex Block Fix')
mysummary <- SSsummarize(list(base, cpfv, 
	all_selex, all_selex_fix))
SSplotComparisons(mysummary, 
				  filenameprefix = "12.1_council_selex_",
				  legendlabels = modelnames, 
				  ylimAdj = 1.25,
				  plotdir = file.path(wd, "_sensitivities", "_plots"),
                  subplot = c(2,4), 
                  print = TRUE,
                  pdf = FALSE)

################################################################################
# Table of estimates from the added data
################################################################################
x = mysummary
ii = 1:length(modelnames)
n = length(modelnames)
out = matrix(NA, 36, max(ii))
find1 = which(x$likelihoods_by_fleet$model == 1 &x$likelihoods_by_fleet$Label == "Length_like")
find2 = which(x$likelihoods_by_fleet$model == 2 &x$likelihoods_by_fleet$Label == "Length_like")
find3 = which(x$likelihoods_by_fleet$model == 3 &x$likelihoods_by_fleet$Label == "Length_like")
find4 = which(x$likelihoods_by_fleet$model == 4 &x$likelihoods_by_fleet$Label == "Length_like")

out = rbind(
            as.numeric(x$likelihoods[x$likelihoods$Label == "TOTAL",1:n]), 
            as.numeric(x$likelihoods[x$likelihoods$Label == "Survey",1:n]), 
            as.numeric(x$likelihoods[x$likelihoods$Label == "Length_comp",1:n]),
            c(as.numeric(x$likelihoods_by_fleet[find1,4]), as.numeric(x$likelihoods_by_fleet[find2,4]), as.numeric(x$likelihoods_by_fleet[find3,4]),as.numeric(x$likelihoods_by_fleet[find4,4])),
            c(as.numeric(x$likelihoods_by_fleet[find1,5]), as.numeric(x$likelihoods_by_fleet[find2,5]), as.numeric(x$likelihoods_by_fleet[find3,5]),as.numeric(x$likelihoods_by_fleet[find4,5])),
            as.numeric(x$likelihoods[x$likelihoods$Label == "Recruitment",1:n]), 
            as.numeric(x$likelihoods[x$likelihoods$Label == "Forecast_Recruitment",1:n]),
            as.numeric(x$likelihoods[x$likelihoods$Label == "Parm_priors",1:n]),
            as.numeric(x$pars[x$pars$Label == "SR_LN(R0)", 1:n]), 
            as.numeric(x$SpawnBio[x$SpawnBio$Label == "SSB_Virgin", 1:n]),
            as.numeric(x$SpawnBio[x$SpawnBio$Label == "SSB_2021", 1:n]),
            as.numeric(x$Bratio[x$Bratio$Label == "Bratio_2021", 1:n]), 
            as.numeric(x$quants[x$quants$Label == "Dead_Catch_SPR", 1:n]),
            as.numeric(x$pars[x$pars$Label == "SR_BH_steep", 1:n]),
            as.numeric(x$pars[x$pars$Label == "NatM_p_1_Fem_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "L_at_Amin_Fem_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "L_at_Amax_Fem_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "VonBert_K_Fem_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "CV_young_Fem_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "CV_old_Fem_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "NatM_p_1_Mal_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "L_at_Amin_Mal_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "L_at_Amax_Mal_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "VonBert_K_Mal_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "CV_young_Mal_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "CV_old_Mal_GP_1", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_peak_CA_S_Commercial(1)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_ascend_se_CA_S_Commercial(1)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_end_logit_CA_S_Commercial(1)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_peak_CA_S_Commercial(1)_BLK1repl_1916", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_end_logit_CA_S_Commercial(1)_BLK1repl_1916", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_peak_CA_S_Recreational(2)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_ascend_se_CA_S_Recreational(2)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_end_logit_CA_S_Recreational(2)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_peak_CA_S_Recreational(2)_BLK2repl_1916", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_end_logit_CA_S_Recreational(2)_BLK1repl_1916", 1:n]))  
			
out = as.data.frame(out)
colnames(out) = modelnames
rownames(out) = c("Total Likelihood",
                  "Survey Likelihood",
                  "Length Likelihood",
                  "Commercial Length Likelihood",
                  "Recreational Length Likelihood",
                  "Recruitment Likelihood",
                  "Forecast Recruitment Likelihood",
                  "Parameter Priors Likelihood",
                  "log(R0)",
                  "SB Virgin",
                  "SB 2021",
                  "Fraction Unfished 2021",
                  "Total Yield - SPR 50",
                  "Steepness",
                  "Natural Mortality - Female",
                  "Length at Amin - Female",
                  "Length at Amax - Female",
                  "Von Bert. k - Female",
                  "CV young - Female",
                  "CV old - Female",
                  "Natural Mortality - Male",
                  "Length at Amin - Male",
                  "Length at Amax - Male",
                  "Von Bert. k - Male",
                  "CV young - Male",
                  "CV old - Male",
                  "Peak Selectivity - Commercial", "Ascending Selectivity - Commercial", "Final Selectivity - Commercial",
				  "Peak Selectivity (1916 - 2001) - Commercial","Final Selectivity (1916 - 2001) - Commercial",
				  "Peak Selectivity - Recreational", "Ascending Selectivity - Recreational", "Final Selectivity - Recreational",
				  "Peak Selectivity (1916 - 2001) - Recreational","Final Selectivity (1916 - 2001) - Recreational")
t = sa4ss::table_format(x = out,
      caption = 'Selectivity sensitivities relative to the adopted base model.',
      label = 'selex-sens-south',
      digits = 3,
      col_names = modelnames)

kableExtra::save_kable(t,
file = "C:/Assessments/2021/copper_rockfish_2021/write_up/council_requests/sca_selex_sens.tex")
###############################################################################################


################################################################################
#  SCA Selectivity
################################################################################
model = all_selex_fix
# Create selectivity plots
fleets = model$FleetNames

com_selex <- SSplotSelex(model, fleets = 1, fleetnames = fleets, subplot = 1,years = c(2000, 2020))
com_selex$infotable$col <- 'blue'
com_selex$infotable$longname = c("Commercial 1916-2000", "Commercial 2001-2020")
rec_selex <- SSplotSelex(model, fleets = 2, fleetnames = fleets, subplot = 1, years = c(2000, 2020))
rec_selex$infotable$longname = c("Recreational 1916-2000", "Recreational 2001-2020")
rec_selex$infotable$col <- 'red'
hkl <- SSplotSelex(model, fleets=3, fleetnames=fleets, subplot=1)
hkl$infotable$col <- "purple"
hkl$infotable$longname = "NWFSC Hook & Line"

pngfun(wd = file.path(wd, "_sensitivities", "_plots"), 
	'12.1_base_council_fix_selex_block.png', w = 10, h = 5)
par(mfrow=c(1,3), mar=c(4,4,3,1))
SSplotSelex(model, fleets=1,  infotable=com_selex$infotable, year = c(2000, 2020),
			subplot = 1, showmain=FALSE, legend = 'topright')
grid()
SSplotSelex(model, fleets = 2, infotable = rec_selex$infotable, year = c(2000, 2020),
			subplot = 1, legend= 'topright', showmain=FALSE)	
grid()
SSplotSelex(model, fleets=3,  infotable=hkl$infotable, legend = 'bottomright',
			subplot = 1, showmain=FALSE)
legend("topleft", legend = hkl$infotable$longname, 
	col = hkl$infotable$col, lwd = 2, lty = 1, pch = 16, bty = 'n')
grid()
dev.off()


# Both Fleets
#-------------------------------------------------
model = all_selex
# Create selectivity plots
fleets = model$FleetNames

com_selex <- SSplotSelex(model, fleets = 1, fleetnames = fleets, subplot = 1, years = c(2000, 2020))
com_selex$infotable$col <- 'blue'
com_selex$infotable$longname = c("Commercial 1916-2000", "Commercial 2001-2020")
rec_selex <- SSplotSelex(model, fleets = 2, fleetnames = fleets, subplot = 1, years = c(2000, 2020))
rec_selex$infotable$longname = c("Recreational 1916-2000", "Recreational 2001-2020")
rec_selex$infotable$col <- 'red'
hkl <- SSplotSelex(model, fleets=3, fleetnames=fleets, subplot=1)
hkl$infotable$col <- "purple"
hkl$infotable$longname = "NWFSC Hook & Line"

pngfun(wd = file.path(wd, "_sensitivities", "_plots"), 
	'12.1_base_council_est_selex_block.png', w = 10, h = 5)
par(mfrow=c(1,3), mar=c(4,4,3,1))
SSplotSelex(model, fleets=1,  infotable=com_selex$infotable, year = c(2000,2020),
			subplot = 1, showmain=FALSE, legend = 'topright')
grid()
SSplotSelex(model, fleets = 2, infotable = rec_selex$infotable, , year = c(2000, 2020),
			subplot = 1, legend= 'topright', showmain=FALSE)	
#legend("topleft", legend = rec_selex$infotable$longname, 
#	col = rec_selex$infotable$col, lwd = 2, lty = 1, pch = 16, bty = 'n')
grid()
SSplotSelex(model, fleets=3,  infotable=hkl$infotable, legend = 'bottomright',
			subplot = 1, showmain=FALSE)
legend("topleft", legend = hkl$infotable$longname, 
	col = hkl$infotable$col, lwd = 2, lty = 1, pch = 16, bty = 'n')
grid()
dev.off()