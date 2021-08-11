#######################################################################################################
#
# 			Copper Rockfish 2021 Decision Table
#
#######################################################################################################

library(r4ss)

# Load in each of the models ------------------------------------------------
loc = "C:/Assessments/2021/copper_rockfish_2021/models"

sca <- SS_output(file.path(loc, "ca_s_pt_c", "12.1_base"), printstats=FALSE, verbose=FALSE)
nca <- SS_output(file.path(loc, "ca_n_pt_c", "10.3_base"), printstats=FALSE, verbose=FALSE)
or  <- SS_output(file.path(loc, "or", "10.5_base"), printstats=FALSE, verbose=FALSE)
wa  <- SS_output(file.path(loc, "wa", "7.7_base"), printstats=FALSE, verbose=FALSE)

# Washington ----------------------------------------------------------------
# This first approach finds the 12.5 and 87.5 quantiles of the SSB_2021 estimate

final.sb.wa = wa$derived_quants[wa$derived_quants$Label == "SSB_2021", ]
vals = qnorm(c(0.125, 0.875), mean = final.sb.wa[,2], sd = final.sb.wa[,3])
# Now need to find R0 value associated with SB2021 = 2.84 and 3.56 million eggs
# High M = 0.118 and Low M = 0.0982
dir = file.path(loc, "wa", "_decision_table", "7.7_base")
find_para(dir = dir, 
		  yr = 2021, 
		  parm = c("MGparm[1]", "MGparm[13]"), 
		  quant = c(0.125, 0.875), 
		  ctl_name = "2021_wa_copper.ctl", 
		  parm_string = c("NatM_p_1_Fem_GP_1", "NatM_p_1_Mal_GP_1"), 
		  est = c(FALSE, FALSE),
		  sigma = 0.50)

find_para(dir = dir, 
		  yr = 2021, 
		  parm = c("SR_parm[2]"), 
		  quant = c(0.125, 0.875), 
		  ctl_name = "2021_wa_copper.ctl", 
		  parm_string = c("SR_BH_steep"), 
		  est = c(FALSE),
		  sigma = round(wa$Pstar_sigma,3))

wd = file.path(loc, "wa", "_decision_table")
low = SS_output(paste0(dir, "_decision_table_1.15_0.5_0.125"))
high = SS_output(paste0(dir, "_decision_table_1.15_0.5_0.875"))
modelnames <- c("Base (M = 0.108)", "Low (M = 0.0646)", "High (M = 0.1574)")
mysummary  <- SSsummarize(list(wa, low, high))
SSplotComparisons(mysummary, 
				  filenameprefix = "WA_M_decision_table_sigma_50_",
				  legendlabels = modelnames, 
				  plotdir = wd,
				  pdf = TRUE)


low = SS_output(file.path(wd, "h", "7.7_base_decision_table_1.15_0.098_0.125"))
high = SS_output(file.path(wd, "h","7.7_base_decision_table_1.15_0.098_0.875"))
modelnames <- c("Base (h = 0.72)", "Low (h = 0.45)", "High (h = 1.0)")
mysummary  <- SSsummarize(list(wa, low, high))
SSplotComparisons(mysummary, 
				  filenameprefix = "WA_h_decision_table_",
				  legendlabels = modelnames, 
				  plotdir = wd,
				  pdf = TRUE)

solve_numbers(mod_dir = file.path(loc, "wa", "_decision_table", "7.7_base_abc_high"),
			 fore_yrs = 2021:2032,
			 fleet_abc = c(2.11,
						   2.100,
						   1.882,
						   1.887,
						   1.891,
						   1.895,
						   1.896,
						   1.897,
						   1.898,
						   1.896,
						   1.894,
						   1.893),
			 fleet = 1,
			 threshold = 0.005)


# Oregon ----------------------------------------------------------------
# This first approach finds the 12.5 and 87.5 quantiles of the SSB_2021 estimate

final.sb = or$derived_quants[or$derived_quants$Label == "SSB_2021", ]
vals = qnorm(c(0.125, 0.875), mean = final.sb[,2], sd = final.sb[,3])

dir = file.path(loc, "or", "_decision_table", "10.5_base")
find_para(dir = dir, 
		  yr = 2021, 
		  parm = c("MGparm[1]", "MGparm[13]"), 
		  quant = c(0.125, 0.875), 
		  ctl_name = "2021_or_copper.ctl", 
		  parm_string = c("NatM_p_1_Fem_GP_1", "NatM_p_1_Mal_GP_1"), 
		  est = c(FALSE, FALSE),
		  sigma = round(or$Pstar_sigma, 2))

wd = file.path(loc, "or", "_decision_table")
low = SS_output(paste0(dir, "_decision_table_1.15_0.42_0.125"))
high = SS_output(paste0(dir, "_decision_table_1.15_0.42_0.875"))
modelnames <- c("Base (M = 0.108)", "Low (M = 0.0896)", "High (M = 0.115)")
mysummary  <- SSsummarize(list(or, low, high))
SSplotComparisons(mysummary, 
				  filenameprefix = "OR_M_decision_table_sigma_42_model_sd_",
				  legendlabels = modelnames, 
				  plotdir = wd,
				  pdf = TRUE)

# ABC 25:5 P* = 0.45
#----------------------------------------------------------------------------------------
run_name = "ABC"
run_loc = "C:/Assessments/2021/copper_rockfish_2021/models/or/_decision_table"
base_name = "10.5_base"
base_loc = file.path("C:/Assessments/2021/copper_rockfish_2021/models/or", base_name)
# based on average catches between 2017-20
percent = c(0.21, 0.79)

find = which(or$derived_quants$Label == "ForeCatch_2023")
ForeCatchAll = or$derived_quants[find:(find+9), 2]
years = 2023:2032
fore.catch = NULL 

for(y in 1:length(years)){
	for(f in 1:2){
		calc = c(years[y], 1, f, percent[f]*ForeCatchAll[y])
		fore.catch = rbind(fore.catch, calc)
	}
}
write.csv(fore.catch, file.path(run_loc, paste0(base_name, "_", run_name, ".csv")))

########################################################################################
# North CA
#########################################################################################
# This first approach finds the 12.5 and 87.5 quantiles of the SSB_2021 estimate

final.sb = nca$derived_quants[nca$derived_quants$Label == "SSB_2021", ]
vals = qnorm(c(0.125, 0.875), mean = final.sb[,2], sd = final.sb[,3])

dir = file.path(loc, "ca_n_pt_c", "_decision_table", "10.3_base")
find_para(dir = dir, 
		  yr = 2021, 
		  parm = c("MGparm[1]", "MGparm[13]"), 
		  quant = c(0.125, 0.875), 
		  ctl_name = "2021_ca_n_copper.ctl", 
		  parm_string = c("NatM_p_1_Fem_GP_1", "NatM_p_1_Mal_GP_1"), 
		  est = c(FALSE, FALSE),
		  sigma = round(nca$Pstar_sigma, 2))

wd = file.path(loc, "ca_n_pt_c", "_decision_table")
low = SS_output(paste0(dir, "_decision_table_1.15_0.3_0.125"))
high = SS_output(paste0(dir, "_decision_table_1.15_0.3_0.875"))
modelnames <- c("Base (M = 0.108)", "Low (M = 0.096)", "High (M = 0.1206)")
mysummary  <- SSsummarize(list(nca, low, high))
SSplotComparisons(mysummary, 
				  filenameprefix = "NCA_M_decision_table_sigma_30_model_sd_",
				  legendlabels = modelnames, 
				  plotdir = wd,
				  pdf = TRUE)

