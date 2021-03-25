savedir = "C:/Assessments/2021/copper_rockfish_2021/write_up/s_ca/figs"
mydir = "C:/Assessments/2021/copper_rockfish_2021/models/ca_s_pt_c"
base_name = "12.0_base"
model = SS_output(file.path(mydir, base_name))

library(HandyCode)
pngfun(wd = savedir, 'unavailable_biomass.png', w = 10, h = 7)
	SSunavailableSpawningOutput(model, plot=TRUE)
dev.off()