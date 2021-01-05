
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/nwfscDiag")
#library(nwfscDiag)

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

base_name = "8.1_dw_francis"


#get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1", "SR_BH_steep", "SR_LN(R0)", "L_at_Amax_Fem_GP_1"),
#							low =  c(0.09, 0.30, -1.0, -5),
#							high = c(0.13, 1.0,  2, 5),
#							step_size = c(0.005, 0.10, 0.25, 0.50),
#							param_space = c('real', 'real', 'relative', 'relative'))

get = get_settings_profile( parameters =  c( "SR_BH_steep",  "L_at_Amax_Fem_GP_1"),
							low =  c(0.30, -5),
							high = c(1.0,   5),
							step_size = c(0.10, 1),
							param_space = c('real', 'relative'))

#model_settings = get_settings(settings = list(base_name = base_name,
#							  run = c("jitter", "profile", "retro"),
#							  profile_details = get ))
#
model_settings = get_settings(settings = list(base_name = base_name,
							  run = c("profile"),
							  profile_details = get ))

run_diagnostics(mydir = mydir, model_settings = model_settings)





#######################################################################################################
# Oregon
#######################################################################################################

mydir = "C:/Assessments/2021/copper_rockfish_2021/models/or"
base_name = "2.4_recdevs_early_est_p1_only_block"
base_name = "5.0_dw_francis"
base_name = "5.5_dw_francis_sigmar_60"


get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1", "SR_BH_steep", "SR_LN(R0)"),
							low =  c(0.09, 0.30, -0.50),
							high = c(0.13, 1.0,  2),
							step_size = c(0.005, 0.10, 0.25),
							param_space = c('real', 'real', 'relative'))

get = get_settings_profile( parameters =  c( "L_at_Amax_Fem_GP_1"),
							low =  c(-5),
							high = c(5),
							step_size = c(1),
							param_space = c('relative'))

model_settings = get_settings(settings = list(base_name = base_name,
							  run = c("profile"),
							  profile_details = get ))

model_settings = get_settings(settings = list(base_name = base_name,
							  run = c("jitter", "profile", "retro"),
							  profile_details = get ))

run_diagnostics(mydir = mydir, model_settings = model_settings)




#######################################################################################################
# Washington
#######################################################################################################

mydir = "C:/Assessments/2021/copper_rockfish_2021/models/wa"
base_name = "5.1.1_selex_cv_fixed"
base_name = "7.0_base"

get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1", "SR_BH_steep", "SR_LN(R0)"),
							low =  c(0.40, 0.25, -1),
							high = c(0.40, 1.0,  2),
							step_size = c(0.005, 0.05, 0.25),
							param_space = c('multiplier', 'real', 'relative'))

get = get_settings_profile( parameters =  c( "SR_BH_steep",  "L_at_Amax_Fem_GP_1"),
							low =  c(0.30, -5),
							high = c(1.0,   5),
							step_size = c(0.10, 1),
							param_space = c('real', 'relative'))

model_settings = get_settings(settings = list(base_name = base_name,
							  run = c("profile"),
							  profile_details = get ))

model_settings = get_settings(settings = list(base_name = base_name,
							  run = c("jitter", "profile", "retro"),
							  profile_details = get ))
run_diagnostics(mydir = mydir, model_settings = model_settings)


