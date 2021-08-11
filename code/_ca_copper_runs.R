
# Copper Combined California Model Runs

library(r4ss)
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/r4ss")
wd = "C:/Assessments/2021/copper_rockfish_2021/models/ca"

loc = "C:/Assessments/2021/copper_rockfish_2021/models"
sca <- SS_output(file.path(loc, "ca_s_pt_c", "12.1_base"), printstats=FALSE, verbose=FALSE)
nca <- SS_output(file.path(loc, "ca_n_pt_c", "10.3_base"), printstats=FALSE, verbose=FALSE)

model = "1.1_north_growth_no_hkl"
north_stoch = SS_output(file.path(wd,model))
SS_plots(north_stoch)

model = "1.1_north_growth_determ"
north_determ = SS_output(file.path(wd,model))
SS_plots(north_determ)

model = "2.3_south_growth_determ_no_hkl"
south_determ = SS_output(file.path(wd, model))

model = "2.1_south_growth_no_hkl"
south_stoch = SS_output(file.path(wd, model))

##########################################################
modelnames <- c("SCA Adopted Model", "NCA Adopted Model", 
	'Fleets as Areas - North Bio. Stoch.',
	'Fleets as Areas - North Bio. Determ.',
	'Fleets as Areas - South Bio. Stoch.',
	'Fleets as Areas - South Bio. Determ.')
mysummary <- SSsummarize(list(sca, nca, 
	north_stoch, north_determ, south_stoch, south_determ))
SSplotComparisons(mysummary, 
				  filenameprefix = "California_Fleets_as_Areas_",
				  legendlabels = modelnames, 
				  ylimAdj = 1.3,
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)
#########################################################################

model = "2.1_south_growth_no_hkl_mirror_fleets"
mirror = SS_output(file.path(wd, model))
SS_plots(mirror)

model = "2.1_south_growth_no_hkl_combine_data"
combine = SS_output(file.path(wd, model))
SS_plots(combine)

model = "2.1_south_growth_no_hkl_combine_data_blocks"
combine_blocks = SS_output(file.path(wd, model))
SS_plots(combine_blocks)

model = "3.0_area_stoch_32"
area = SS_output(file.path(wd, model))

modelnames <- c("SCA Adopted Model", "NCA Adopted Model", 
	'Fleets as Areas - South Bio. Stoch.',
	'Combined Fleets - South Bio. Stoch.',
	'2-Area Model')
mysummary <- SSsummarize(list(sca, nca, south_stoch, combine_blocks, area))
SSplotComparisons(mysummary, 
				  filenameprefix = "California_Models_",
				  legendlabels = modelnames, 
				  ylimAdj = 1.3,
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

##########################################################
model = "2.1_south_growth_no_hkl_mirror_fleets"
mirror = SS_output(file.path(wd, model))

model = "2.1_south_growth_no_hkl_combine_data"
combine = SS_output(file.path(wd, model))

model = "2.1_south_growth_no_hkl_blocks"
blocks_dome = SS_output(file.path(wd, model))

model = "2.1_south_growth_no_hkl_blocks_rec_n_asym"
blocks_rec_asy = SS_output(file.path(wd, model))

model = "2.1_south_growth_no_hkl_blocks_com_n_asym"
blocks_com_asym = SS_output(file.path(wd, model))

modelnames <- c("SCA Adopted Model", "NCA Adopted Model", 
#	'Single Area - South Bio. Stoch. (Mirror Fleets)',
	'Single Area - South Bio. Stoch. (Combined Data)',
	'Fleets as Areas - Selex Blocks All Domed',
	'Fleets as Areas - Selex Blocks Rec. N. Asym.',
	'Fleets as Areas - Selex Blocks Com. N. Asym.')
mysummary <- SSsummarize(list(sca, nca, #mirror, 
	combine, blocks_dome, blocks_rec_asy, blocks_com_asym))
SSplotComparisons(mysummary, 
				  filenameprefix = "California_Fleets_as_Areas_South_Bio_Stoch_",
				  legendlabels = modelnames, 
				  ylimAdj = 1.6,
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)


#####################################################
# Two-Area Only
#####################################################
model = "3.0_area_stoch_32"
area_south = SS_output(file.path(wd, model))

model = "3.0_area_north_stoch_32"
area_north = SS_output(file.path(wd, model))
SS_plots(area_north)

model = "3.0_area_gp_stoch_32"
area_gp = SS_output(file.path(wd, model))
SS_plots(area_gp)

model = "3.0_area_gp_determ_32"
area_gp_determ = SS_output(file.path(wd, model))
SS_plots(area_gp_determ)

modelnames <- c("SCA Adopted Model", "NCA Adopted Model", 
	'Two-Area (south bio.)',
	'Two-Area (north bio.)',
	'Two-Area (GP by area)',
	'Two-Area (GP by area, determ.)')
mysummary <- SSsummarize(list(sca, nca, 
	area_south, area_north, area_gp, area_gp_determ))
SSplotComparisons(mysummary, 
				  filenameprefix = "California_Two_Area_Models_",
				  legendlabels = modelnames, 
				  ylimAdj = 1.3,
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)