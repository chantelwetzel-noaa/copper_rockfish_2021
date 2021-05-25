# Copper Oregon Model Runs

library(r4ss)
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/r4ss")

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

# Add Data: 1) released fish (ghost fleet) and 2) ages (lambda = 0)
model = "3.0.0_data_released_len_and_ages"
base = SS_output(file.path(wd, model))
SS_plots(base)

model = "3.0.1_data_ages_lambda=1"
ages = SS_output(file.path(wd, model))
SS_plots(base)

modelnames <- c("Lengths Only", "+ Ages")
mysummary <- SSsummarize(list(base,  ages))

SSplotComparisons(mysummary, 
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

# Estimate selex params p1-p4 for both fleets (with rec block)
model = "3.1_selex_est_all"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 242.9, R0 = 2.4
# Slight difference in estimated p2 and p4 but no change in fit or p1 and p3

# Update p2 and p4 fixed values based on those estimated above.
# Allow for dome shaped selectivity for both commercial and rec fleets
# The dome applies to both periods of the rec selex
model = "3.2_selex_domed"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 233.452, Com NLL = 128.565 (-2.2), Rec NLL = 98.6 (-5.6 LL from asymptotic)
# R0 = 2.53, depl 2021 = 0.35

# Fix recent rec selex asmptotic but allow for a dome in historical period
model = "3.3_selex_domed_block_only"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 242.5, Rec LL = 104.2
# R0 = 2.41

# Fix block rec selex asmptotic but allow for a dome in recent years
model = "3.4_selex_domed_rec_recent"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 231.5 (Rec LL = 94.6 -9 units from asymptotic)
# R0 = 2.75 (vs. 2.4 asymptotic ), depl 2021 = 0.46 (vs. 0.27 asymptotic)

# Remove rec block and fix asymptotic
model = "3.5_selex_no_blocks_asymptotic"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 295.7, R0 = 2.4, depl 2021 = 0.33

# Remove rec block and let estimate dome or asymptotic
model = "3.6_selex_no_blocks_est_dome"
base = SS_output(file.path(wd, model))
SS_plots(base)
# Estimate dome selex for the rec fleet, clear residual pattern
# NLL = 278.2, R0 = 3.7, depl 2021 = 0.82

# Move forward with rec block selex with dome in recent years:
# Update all the biology parameters
model = "4.0_bio_update"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 231.5, R0 = 2.75, depl 2021 = 0.46

# Sigma R reduced to 0.50 - estimate the hessian
model = "4.1_bio_sigmaR_hessian"
base = SS_output(file.path(wd, model))
SS_plots(base)
# Now the recommended sigma R is 0.60...

# SigmaR = 0.90 - start early devs 1900 - estimate the hessian
model = "4.2_bio_sigmaR_90_hessian"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 231.9
# Now recommending sigmaR = 0.688, poor gradient on 1980-82 rec devs
# Sigma R = 0.70 -- NLL = 229.7
# Now recommending simgaR = 0.77, gradient is fine
# Sigma R = 0.80 -- NLL = 228.8
# Sigma R = 0.90 -- NLL = 228.2 (recommending 0.92), R0 = 2.7
# Moving forward with sigma R = 0.90

model = "5.0_dw_francis"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 249.5, R0 = 2.71, depl 2021 =  0.42

model = "5.1_dw_mi"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 293.7, R0 = 2.73, depl 2021 = 0.43

model = "5.2_dw_dirichlet"
base = SS_output(file.path(wd, model))
SS_plots(base)
# R0 blows up 18.96 and commercial dirichlet hits upper bound
# Updated input nsamp to be equal to total fish sampled.
# This brings down the R0 = 2.65, ln(theta) = 2.93, depl 2021 = 0.49


# MI DW & SigmaR = 0.60
model = "5.5_dw_mi_sigmar_60"
base = SS_output(file.path(wd, model))
SS_plots(base)
# NLL = 295.98, R0 = 4.78, depl 2021 = 0.905
# Did not expect things to change so dramatically since francis and mi dw were similar.

# Need to decide on the input sigmaR and dw 
# 	- MI results in less extreme rec devs when sigma R = 0.90
#	- MI with sigma R = 0.60 - the model ends up in a very different place
#	- Francis with sigma R = 0.90 vs. sigma R = 0.60 are similar but better NLL with sigma R = 0.90 by ~ 3 units
#	- There seems to be some tension between commercial and rec lengths in terms of R0 which dw highlights

# Proposed Base Model: 5.5_dw_francis_sigmar_60 
model = "5.5_dw_francis_sigmar_60"
base = SS_output(file.path(wd, model))
SS_plots(base)


#===========================================
# Sensitivities
#===========================================
model = "4.1_bio_sigmaR_hessian"
sigma60 = SS_output(file.path(wd, model))

model = "4.2_bio_sigmaR_90_hessian"
sigma90 = SS_output(file.path(wd, model))

model = "5.0_dw_francis"
francis = SS_output(file.path(wd, model))

model = "5.1_dw_mi"
mi = SS_output(file.path(wd, model))

model = "5.2_dw_dirichlet"
dirichlet = SS_output(file.path(wd, model))

model = "5.3_dw_francis_use_ages"
ages = SS_output(file.path(wd, model))

modelnames <- c("SigmaR = 0.60", "SigmaR = 0.90", "Francis", "MI", "Dirichlet","Francis w/ Ages")
mysummary  <- SSsummarize(list(sigma60, sigma90, francis, mi, dirichlet, ages))
SSplotComparisons(mysummary, 
				  filenameprefix = "4.1_5.0_sensitivities",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

# Remove/Add Blocks
# Rec selectivity shape (domed vs. asymptotic)
# No rec devs
# Smaller sigma
# Data weighting
# Platoons
# Use age data

# Proposed Base Model: 6.0
model = "6.0_base"
base = SS_output(file.path(wd, model))
SS_plots(base)

model = "6.1_base_max_bin"
bin = SS_output(file.path(wd, model))
SS_plots(bin)

# The minor difference may be due to slightly differ commercial 
# data processing so take model 6.1 and revert to 54 max lbind
model = "6.2_base_bin_54"
bin54 = SS_output(file.path(wd, model))
# Yes - the difference is due to minor updates in the PacFIN.Utilites package
modelnames <- c("Base", "Max Data Bin", "Bin = 54")
mysummary  <- SSsummarize(list(base, bin, bin54))
SSplotComparisons(mysummary, 
				  filenameprefix = "6.0_max_data_bin",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

model = "6.3_base"
new_base = SS_output(file.path(wd, model))
SS_plots(base)

model = "_sensitivities/6.0_base_no_blocks_rm_data_1999"
unweighted = SS_output(file.path(wd, model))

model = "6.3_base - Copy"
alt = SS_output(file.path(wd, model))
SS_plots(base)
modelnames <- c("Base", "Bias Ramp")
mysummary  <- SSsummarize(list(base, alt))
SSplotComparisons(mysummary, 
				  filenameprefix = "6.3_bias_adjust",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

modelnames <- c("New Base", "Old Base", "Unweight Sens.")
mysummary  <- SSsummarize(list(new_base, base, unweighted))
SSplotComparisons(mysummary, 
				  filenameprefix = "6.0_vs_6.3_base",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

model = "6.4_base"
base = SS_output(file.path(wd, model))
SS_plots(base)

# Update growth based on lea < 3 age fish and OR/WA length age observations
model = "6.5_base"
new_base = SS_output(file.path(wd, model))
#SS_plots(new_base)

model = "6.5_base_no_com"
base_no_com = SS_output(file.path(wd, model))

# Also changed comm input N to number of fish
model = "6.5_base_2015_2016"
base_rm_lown = SS_output(file.path(wd, model))

model = "6.5_base_2015_2016_full_wght"
full_wght = SS_output(file.path(wd, model))

model = "6.5_base_2015_2016_rec_full_wght"
rec_wght = SS_output(file.path(wd, model))

modelnames <- c("Base", "No Comm. Comps", "Rm. 2015-16", 
				"Rm. 2015-16 Full Weight", "Rm. 2015-16 Rec Full Weight")
mysummary  <- SSsummarize(list(new_base,  base_no_com, base_rm_lown,
						       full_wght, rec_wght))
SSplotComparisons(mysummary, 
				  filenameprefix = "Data_Exploration_",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

model = "6.5_base_nodevs"
determ = SS_output(file.path(wd, model))


modelnames <- c("Old Base - 6.4", "New Base - Growth", "New Base - No Rec Devs")
mysummary  <- SSsummarize(list(base,  new_base, determ))
SSplotComparisons(mysummary, 
				  filenameprefix = "6.5_growth_",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

model = "6.5_base_nodevs_2000"
rec_2000 = SS_output(file.path(wd, model))
model = "6.5_base_nodevs_fran_no_com"
fran = SS_output(file.path(wd, model))
model = "6.5_base_nodevs_mi_no_com"
mi = SS_output(file.path(wd, model))
model = "6.5_base_nodevs_dm"
dm = SS_output(file.path(wd, model))


modelnames <- c( "6.5",
				 "6.5 No Devs After 2000",
				 "6.5 No Devs, No Comm. - Francis",
				 "6.5 No Devs, No Comm. - MI", 
				 "6.5 - No Devs. DM")
mysummary  <- SSsummarize(list(new_base, rec_2000, fran, mi, dm))
SSplotComparisons(mysummary, 
				  filenameprefix = "6.5_",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)


model = "6.5_base_2015_16"
rem_1516 = SS_output(file.path(wd, model))

model = "6.5_base_2015_16_add"
add_1516 = SS_output(file.path(wd, model))

# Updated catches and commercial data
model = "7.0_base"
base = SS_output(file.path(wd, model))
SS_plots(base)

model = "7.0_base_dev_2"
alt = SS_output(file.path(wd, model))
SS_plots(base)

modelnames <- c( "7.0: Dev = 1", "7.0: Dev = 2")
mysummary  <- SSsummarize(list(base, alt))
SSplotComparisons(mysummary, 
				  filenameprefix = "7.0_dev_",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

model = "7.1_base" # corrected or comm catches
new_base = SS_output(file.path(wd, model))
SS_plots(new_base)

modelnames <- c( "7.0 Incorrect Com. Catch", "7.1 Fixed")
mysummary  <- SSsummarize(list(base, new_base))
SSplotComparisons(mysummary, 
				  filenameprefix = "7.0_catch_",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

model = "8.0_base_no_devs" # corrected or comm catches
no_devs = SS_output(file.path(wd, model))
SS_plots(no_devs)

modelnames <- c( "7.1 w/ Rec.Devs.", "8.0 No Devs.")
mysummary  <- SSsummarize(list(new_base, dw))
SSplotComparisons(mysummary, 
				  filenameprefix = "7.1_devs_",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

model = "8.3_base_no_devs_dw" # corrected or comm catches
dw = SS_output(file.path(wd, model))
SS_plots(dw)

model = "8.2_base_no_devs_asym" # corrected or comm catches
asym = SS_output(file.path(wd, model))
SS_plots(asym)

model = "8.1_base_no_devs_mirror_asym" # corrected or comm catches
mirror = SS_output(file.path(wd, model))
SS_plots(mirror)

modelnames <- c( "8.0", "8.0 DW", "8.0 Mirror & Asym", "8.0 Asym")
mysummary  <- SSsummarize(list(no_devs, dw, mirror, asym))
SSplotComparisons(mysummary, 
				  filenameprefix = "8.0_selex_",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)


model = "8.4_base_no_devs_dw_logistic" # corrected or comm catches
logistic = SS_output(file.path(wd, model))
SS_plots(logistic)

model = "8.4_base_jitter_best" # corrected or comm catches
jitter = SS_output(file.path(wd, model))
SS_plots(jitter)


model = "8.6_selex_com_low" # corrected or comm catches
low = SS_output(file.path(wd, model))
SS_plots(low)

modelnames <- c( "7.1", "8.4")
mysummary  <- SSsummarize(list(new_base, jitter))
SSplotComparisons(mysummary, 
				  filenameprefix = "7.1_vs_8.4_",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

model = "8.7_base_data_early_rec" # corrected or comm catches
data = SS_output(file.path(wd, model))
SS_plots(data)

model = "9.0_base" # fix 2015 and 2016 rec catch
base = SS_output(file.path(wd, model))
SS_plots(base)

model = "9.0_base_recdevs" # fix 2015 and 2016 rec catch
recdevs = SS_output(file.path(wd, model))
SS_plots(recdevs)

model = "9.0_base_spline" # fix 2015 and 2016 rec catch
spline = SS_output(file.path(wd, model))
SS_plots(spline)

model = "9.0_base_spline_recdevs" # fix 2015 and 2016 rec catch
spline_recdevs = SS_output(file.path(wd, model))
SS_plots(spline_recdevs)

modelnames <- c( "Deterministic", "Stochastic", "Spline Determ.", "Spline Stoch.")
mysummary  <- SSsummarize(list(base, recdevs, spline, spline_recdevs))
SSplotComparisons(mysummary, 
				  filenameprefix = "9.0_determ_vs_stoch_",
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

model = "9.1_data_com_lens" #
com = SS_output(file.path(wd, model))
SS_plots(com)

model = "9.1_base_prior" # fix 2015 and 2016 rec catch
prior = SS_output(file.path(wd, model))
SS_plots(prior)


model = "9.4_base_recdevs_low" # fix 2015 and 2016 rec catch
low = SS_output(file.path(wd, model))
SS_plots(low)



model = "9.5_7.0_fixed_catch" # fix 2015 and 2016 rec catch
catch = SS_output(file.path(wd, model))
SS_plots(catch)

model = "9.6_7.0_fixed_catch_no_devs" # fix 2015 and 2016 rec catch
catch_no_devs = SS_output(file.path(wd, model))
SS_plots(catch_no_devs)
SS_tune_comps(replist = catch_no_devs, option = "MI", dir = file.path(wd, model))


model = "9.7_7.0_fixed_catch_sigma" # fix 2015 and 2016 rec catch
sigma = SS_output(file.path(wd, model))
SS_plots(sigma)

# "Base w/ Devs" NLL 253.7 (124.6, 120.1)
model = "9.8_7.0_fixed_catch_asym" # fix 2015 and 2016 rec catch
asym = SS_output(file.path(wd, model))
# NLL = 267.2
SS_plots(asym)

model = "9.9_7.0_fixed_catch_asym_sigma" # fix 2015 and 2016 rec catch
asym_sigma = SS_output(file.path(wd, model))
# NLL = 311

# Deterministic (NLL = 347.664, 200.2 and 147.3) 
model = "10.0_no_devs_super_period" 
super = SS_output(file.path(wd, model))
SS_plots(super)
#NLL = 150.1

model = "10.1_no_devs_logistic" 
logistic = SS_output(file.path(wd, model))
SS_plots(logistic)
# NLL = 352.3
# Peak Comm = 32 Rec = 33 (R0 = 5.6)

model = "10.2_devs_unsexed_rm_data" 
unsexed = SS_output(file.path(wd, model))
SS_plots(unsexed)
#NLL = 335 (R0 = 4.3)

model = "10.3_no_devs_unsexed_rm_data" 
determ = SS_output(file.path(wd, model))
SS_plots(determ)

model = "10.3_no_devs_unsexed_rm_comm" 
determ_no_comm = SS_output(file.path(wd, model))
SS_plots(determ_no_comm)

# est com ~42  nll = 69.7
# fix com 48.2 nll = 71.4
# fix com 49.5 nll = 73.0

model = "10.4_determ" 
base = SS_output(file.path(wd, model))
francis = SS_output(file.path( wd, "_sensitivities", "10.4_determ_francis"))
asym = SS_output(file.path( wd, "_sensitivities", "10.4_determ_asym"))
devs = SS_output(file.path( wd, "_sensitivities", "10.4_determ_recdevs"))
SS_tune_comps(replist = base, option = "MI", dir = file.path( wd, "10.4_determ"))
devs_dw = SS_output(file.path( wd, "_sensitivities", "10.4_determ_recdevs_dw"))
devs_data = SS_output(file.path( wd, "_sensitivities", "10.4_determ_recdevs_all_data"))

modelnames <- c( "Base", "Base Francis", "Rec. Asymptotic", "Rec. Devs. Data Weighted", "Rec Devs (All Comm. Data)")
mysummary  <- SSsummarize(list(base, francis, asym,devs_dw, devs_data))
SSplotComparisons(mysummary, 
				  filenameprefix = "10.4_sensitivities",
				  legendlabels = modelnames, 
				  ylimAdj = 1.25,
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)


model = "10.5_base" 
best = SS_output(file.path(wd, model))
SS_tune_comps(replist = best, option = "Francis", dir = file.path( wd, model))

SS_plots(best)

model = "10.5_base_sexed_com" 
best = SS_output(file.path(wd, model))
SS_plots(best)

modelnames <- c( "Old Base", "Jitter Best")
mysummary  <- SSsummarize(list(base, best))
SSplotComparisons(mysummary, 
				  filenameprefix = "10.5_best_fit_",
				  legendlabels = modelnames, 
				  ylimAdj = 1.25,
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

# 10.5 Determistic Base
# NLL = 296.39
# Length_like: 296.389  73.7185 222.67
# Comm N eff = 816.6, Rec N eff = 3635.2

# 10.5 but with sexed comm lengths
# NLL = 431.07

