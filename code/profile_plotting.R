library(r4ss)
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/HandyCode")

#######################################################################################################
# South of Pt. Conception
#######################################################################################################

mydir = "C:/Assessments/2021/copper_rockfish_2021/models/ca_s_pt_c"
base_name = "7.1_data_rec_len_add_trawl"

pngfun(wd = file.path(mydir, paste0(base_name, "_profile_SR_LN(R0)")), 
	   file = "R0_profile_ca_s_pt_c.png",
	   w = 7, h = 12)
par(mfrow=c(3,1))
SSplotProfile(summaryoutput = profile_output$profilesummary, 
			  main = "Changes in total likelihood", 
			  profile.string = "R0", 
              profile.label = "R0", 
              ymax = 40)
abline(h = 1.92, lty = 2, col='red')



PinerPlot (summaryoutput = profile_output$profilesummary, 
		   plot = TRUE, print = FALSE, component = "Length_like",
           main = "Length-composition likelihoods", 
           profile.string = "R0", 
           profile.label = "R0",
           ylab = "Change in -log-likelihood", 
           legendloc = "topright", 
           ymax = 20)

PinerPlot (summaryoutput = profile_output$profilesummary, 
		   plot = TRUE, print = FALSE, component = "Surv_like",
           main = "Survey likelihoods", 
           profile.string = "R0", 
           profile.label = "R0",
           ylab = "Change in -log-likelihood", 
           legendloc = "topright", 
           ymax = 10)
dev.off()


#######################################################################################################
# North of Pt. Conception
#######################################################################################################

mydir = "C:/Assessments/2021/copper_rockfish_2021/models/ca_n_pt_c"
base_name = "5.1_data_rec_len_trawl_survey"
base_name = "8.1_dw_francis"

load(file.path(mydir, paste0(base_name, "_profile_SR_LN(R0)"), 
  "SR_LN(R0)_profile_output.Rdata"))

pngfun(wd = file.path(mydir, paste0(base_name, "_profile_SR_LN(R0)")), 
	   file = "R0_profile_ca_n_pt_c.png",
	   w = 12, h = 7)

par(mfrow=c(1,2))
SSplotProfile(summaryoutput = profile_output$profilesummary, 
			  main = "Changes in total likelihood", 
			  profile.string = "R0", 
              profile.label = "R0", 
              ymax = 100)
abline(h = 1.92, lty = 2, col='red')

PinerPlot (summaryoutput = profile_output$profilesummary, 
		   plot = TRUE, print = FALSE, component = "Length_like",
           main = "Length-composition likelihoods", 
           profile.string = "R0", 
           profile.label = "R0",
           ylab = "Change in -log-likelihood", 
           legendloc = "topright", 
           ymax = 50)
dev.off()

#######################################################################################################
# Oregon
#######################################################################################################

mydir = "C:/Assessments/2021/copper_rockfish_2021/models/or"
base_name = "2.4_recdevs_early_est_p1_only_block"
base_name = "5.0_dw_francis"

load(file.path(mydir, paste0(base_name, "_SR_LN(R0)"), "SR_LN(R0)_profile_output.Rdata"))

pngfun(wd = file.path(mydir, "2.4_recdevs_early_est_p1_only_block_profile_SR_LN(R0)"), 
	   file = "R0_profile_or.png", 
	   w = 12, h = 7)
par(mfrow=c(1,2))
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

dev.off()


#######################################################################################################
# Washington
#######################################################################################################

mydir = "C:/Assessments/2021/copper_rockfish_2021/models/wa"
base_name = "5.1.1_selex_cv_fixed"
base_name = "7.0_base"



load(file.path(mydir, paste0(base_name, "_SR_LN(R0)"), "SR_LN(R0)_profile_output.Rdata"))

pngfun(wd = file.path(mydir, base_name), 
	   file = "R0_profile_wa.png", w = 12, h = 7)
par(mfrow=c(1,2))
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
dev.off()

#######################################################################################################
# Example Code to Re-summarize Profiles
#######################################################################################################

dir = profile_output$mydir
vec = profile_output$vec
Nprofile = length(vec)

profilemodels <- SSgetoutput(dirvec = dir, keyvec=1:(Nprofile-1), getcovar = FALSE)
profilesummary <- SSsummarize(profilemodels)


