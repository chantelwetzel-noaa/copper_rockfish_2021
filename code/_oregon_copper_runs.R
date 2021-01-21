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





