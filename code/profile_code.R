
#devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/nwfscDiag")
library(nwfscDiag)

#######################################################################################################
# South of Pt. Conception
#######################################################################################################

mydir = "C:/Assessments/2021/copper_rockfish_2021/models/ca_s_pt_c"
base_name = "7.1_data_rec_len_add_trawl"

get = get_settings_profile( parameters =  c("SR_LN(R0)"),
							low =  c(-1.5),
							high = c(1.5),
							step_size = c(0.2),
							param_space = c('relative'))


model_settings = get_settings(settings = list(base_name = base_name,
											  run = c("profile"),
											  profile_details = get ))

run_diagnostics(mydir = mydir, model_settings = model_settings)


#######################################################################################################
# North of Pt. Conception
#######################################################################################################

mydir = "C:/Assessments/2021/copper_rockfish_2021/models/ca_n_pt_c"
base_name = "5.1_data_rec_len_trawl_survey"

get = get_settings_profile( parameters =  c("SR_LN(R0)"),
							low =  c(-2),
							high = c(2),
							step_size = c(0.25),
							param_space = c('relative'))


model_settings = get_settings(settings = list(base_name = base_name,
											  run = c("profile"),
											  profile_details = get ))

run_diagnostics(mydir = mydir, model_settings = model_settings)


#######################################################################################################
# Oregon
#######################################################################################################

mydir = "C:/Assessments/2021/copper_rockfish_2021/models/or"
base_name = "2.4_recdevs_early_est_p1_only_block"

get = get_settings_profile( parameters =  c("SR_LN(R0)"),
							low =  c(-1),
							high = c(1),
							step_size = c(0.1),
							param_space = c('relative'))


model_settings = get_settings(settings = list(base_name = base_name,
											  run = c("profile"),
											  profile_details = get ))

run_diagnostics(mydir = mydir, model_settings = model_settings)

load(file.path(mydir, paste0(base_name, "_SR_LN(R0)"), "SR_LN(R0)_profile_output.Rdata"))

pngfun(wd = file.path(mydir, "2.4_recdevs_early_est_p1_only_block_profile_SR_LN(R0)"), "R0_profile_or.png")
par(mfrow=c(2,1))
SSplotProfile(summaryoutput = profile_output$profilesummary, 
			  main = "Changes in total likelihood", 
			  profile.string = "R0", 
              profile.label = "R0", 
              ymax = 20)
abline(h = 1.92, lty = 2, col='red')


PinerPlot (summaryoutput = profile_output$profilesummary, 
		   plot = TRUE, print = FALSE, component = "Length_like",
           main = "Length-composition likelihoods", 
           profile.string = "R0", 
           profile.label = "R0",
           ylab = "Change in -log-likelihood", 
           legendloc = "topright", 
           ymax = 20)
abline(h = 1.92, lty = 2, col='red')
dev.off()


#######################################################################################################
# Washington
#######################################################################################################

mydir = "C:/Assessments/2021/copper_rockfish_2021/models/wa"
base_name = "5.1.1_selex_cv_fixed"

get = get_settings_profile( parameters =  c("SR_LN(R0)"),
							low =  c(-1),
							high = c(1),
							step_size = c(0.1),
							param_space = c('relative'))


model_settings = get_settings(settings = list(base_name = base_name,
											  run = c("profile"),
											  profile_details = get ))

run_diagnostics(mydir = mydir, model_settings = model_settings)

load(file.path(mydir, paste0(base_name, "_SR_LN(R0)"), "SR_LN(R0)_profile_output.Rdata"))

pngfun(wd = file.path(mydir, "5.1.1_selex_cv_fixed_profile_SR_LN(R0)"), "R0_profile_wa.png")
par(mfrow=c(2,1))
SSplotProfile(summaryoutput = profile_output$profilesummary, 
			  main = "Changes in total likelihood", 
			  profile.string = "R0", 
              profile.label = "R0", 
              ymax = 20)
abline(h = 1.92, lty = 2, col='red')


PinerPlot (summaryoutput = profile_output$profilesummary, 
		   plot = TRUE, print = FALSE, component = "Length_like",
           main = "Length-composition likelihoods", 
           profile.string = "R0", 
           profile.label = "R0",
           ylab = "Change in -log-likelihood", 
           legendloc = "topright", 
           ymax = 20)
abline(h = 1.92, lty = 2, col='red')

dev.off()




