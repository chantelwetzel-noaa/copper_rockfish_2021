
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/nwfscDiag")
#library(nwfscDiag)

#######################################################################################################
# South of Pt. Conception
#######################################################################################################

mydir = "C:/Assessments/2021/copper_rockfish_2021/models/ca_s_pt_c"
base_name = "7.1_data_rec_len_add_trawl"
base_name = "12.1_base"

get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1", "SR_BH_steep", "SR_LN(R0)", 
											"L_at_Amax_Fem_GP_1", "VonBert_K_Fem_GP_1"),
							low =  c(0.08, 0.30, -0.5, 44, 0.16),
							high = c(0.14, 0.95,  1.5, 51, 0.28),
							step_size = c(0.005, 0.05, 0.25, 1, 0.01),
							param_space = c('real', 'real', 'relative', 'real', 'real'))


model_settings = get_settings(settings = list(base_name = base_name,
											  profile_details = get,
											  run = c("profile"),
											  retro_yrs = -1:-10,
											  jitter_fraction = 0.10))

model_settings = get_settings(settings = list(base_name = base_name,
							run ="retro"))

run_diagnostics(mydir = mydir, model_settings = model_settings)


mydir = "C:/Assessments/2021/copper_rockfish_2021/models/ca_s_pt_c/_sensitivities"
base_name = "12.0_base_recdevs"

model_settings = get_settings(settings = list(base_name = base_name,
							run ="retro",
							retro_yrs = -1:-20))

run_diagnostics(mydir = mydir, model_settings = model_settings)

#######################################################################################################
# North of Pt. Conception
#######################################################################################################

mydir = "C:/Assessments/2021/copper_rockfish_2021/models/ca_n_pt_c"
base_name = "5.1_data_rec_len_trawl_survey"
base_name = "8.1_dw_francis"
base_name = "10.2_base"

#mydir = "C:/Assessments/2021/copper_rockfish_2021/models/ca_n_pt_c/_sensitivities"
#base_name = "10.0_base_no_recdevs"

get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1",  "SR_LN(R0)"),
							low =  c(0.07,  -1.0),
							high = c(0.15,   1.5),
							step_size = c(0.005, 0.25),
							param_space = c('real', 'relative'))
model_settings = get_settings(settings = list(base_name = base_name,
							  run = c("profile"),
							  profile_details = get ))

model_settings = get_settings(settings = list(base_name = base_name,
							run ="retro",
							retro_yrs = -1:-15))

run_diagnostics(mydir = mydir, model_settings = model_settings)


get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1", "SR_BH_steep", "SR_LN(R0)", 
											"L_at_Amax_Fem_GP_1", "VonBert_K_Fem_GP_1"),
							low =  c(0.07, 0.30, -1.0, 44, 0.14),
							high = c(0.15, 1.0,  1.5, 52, 0.25),
							step_size = c(0.005, 0.10, 0.25, 1, 0.01),
							param_space = c('real', 'real', 'relative', 'real', 'real'))

#get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1",  "SR_LN(R0)"),
#							low =  c(0.07,  -0.5),
#							high = c(0.15,   1.0),
#							step_size = c(0.005, 0.25),
#							param_space = c('real', 'relative'))


model_settings = get_settings(settings = list(base_name = base_name,
							  retro_yrs = -1:-10,
							  jitter_fraction = 0.10,
							  profile_details = get ))


run_diagnostics(mydir = mydir, model_settings = model_settings)



#######################################################################################################
# Oregon
#######################################################################################################

devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/nwfscDiag")

mydir = "C:/Assessments/2021/copper_rockfish_2021/models/or"
base_name = "2.4_recdevs_early_est_p1_only_block"
base_name = "5.0_dw_francis"
base_name = "5.5_dw_francis_sigmar_60"
base_name = "6.0_base"
base_name = "9.0_base"
base_name = "9.2_base_prior"
base_name = "9.3_base_recdevs"
base_name = "9.6_7.0_fixed_catch_no_devs"
base_name = "10.4_determ"
base_name = "10.5_base"


get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1", "SR_BH_steep", "SR_LN(R0)", "L_at_Amax_Fem_GP_1", "VonBert_K_Fem_GP_1",
								"Size_DblN_peak_OR_Commercial(1)", "Size_DblN_peak_OR_Recreational(2)"),
							low =  c(0.09, 0.30, -0.70, 45, 0.14, 37, 43),
							high = c(0.13, 1.0,  1.8, 52, 0.25, 52, 52),
							step_size = c(0.005, 0.10, 0.20, 1, 0.01, 1, 1),
							param_space = c('real', 'real', 'relative', 'real', 'real', 'real', 'real'))


get = get_settings_profile( parameters =  c("L_at_Amax_Fem_GP_1", "Size_DblN_peak_OR_Recreational(2)"),
							low =  c(47, 43),
							high = c(52, 50),
							step_size = c(1,  1),
							param_space = c('real', 'real'))

get = get_settings_profile( parameters =  c("Size_DblN_peak_OR_Recreational(2)"),
							low =  c( 44),
							high = c(51),
							step_size = c(1),
							param_space = c('real'))


model_settings = get_settings(settings = list(base_name = base_name,
							  run = c("jitter", "profile", "retro"),
							  jitter_fraction = 0.05, 
							  profile_details = get ))


model_settings = get_settings(settings = list(base_name = base_name,
							  run = c("profile"),
							  profile_details = get ))

model_settings = get_settings(settings = list(base_name = base_name,
							  run = c("jitter"),
							  jitter_fraction = 0.05))

run_diagnostics(mydir = mydir, model_settings = model_settings)


rerun_profile_vals(mydir = file.path(mydir, base_name),
					para_name =  "Size_DblN_peak_OR_Recreational(2)",
					run_num = c(1,6),
					data_file_nm = "2021_or_copper.dat")


#######################################################################################################
# Washington
#######################################################################################################

mydir = "C:/Assessments/2021/copper_rockfish_2021/models/wa"
base_name = "5.1.1_selex_cv_fixed"
base_name = "7.0_base"
base_name = "7.7_base"

get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1", "SR_BH_steep", "SR_LN(R0)",  
							"L_at_Amax_Fem_GP_1", "VonBert_K_Fem_GP_1"),
							low =  c(0.09, 0.30, -0.8, 45, 0.14),
							high = c(0.14, 1.0,  1.6, 53, 0.30),
							step_size = c(0.005, 0.10, 0.2, 1, 0.01),
							param_space = c('real', 'real', 'relative', 'real', 'real'))

get = get_settings_profile( parameters =  c(  
							"L_at_Amax_Fem_GP_1"),
							low =  c( 44),
							high = c(52),
							step_size = c(1),
							param_space = c('real'))

model_settings = get_settings(settings = list(base_name = base_name,
							  run = 'profile',
							  profile_details = get ))

model_settings = get_settings(settings = list(base_name = base_name,
							  jitter_fraction = 0.10,
							  profile_details = get ))

run_diagnostics(mydir = mydir, model_settings = model_settings)


get = get_settings_profile( parameters =  c("VonBert_K_Fem_GP_1"),
							low =  c(0.10),
							high = c(0.20),
							step_size = c(0.01),
							param_space = c('real'))

model_settings = get_settings(settings = list(base_name = base_name,
							  run = c("profile"),
							  profile_details = get ))
run_diagnostics(mydir = mydir, model_settings = model_settings)
