savedir = "C:/Assessments/2021/copper_rockfish_2021/write_up/n_ca/figs"
mydir = "C:/Assessments/2021/copper_rockfish_2021/models/ca_n_pt_c"
base_name = "9.0_base"
model = SS_output(file.path(mydir, base_name))

library(HandyCode)

fleets = c("Commercial", "Recreational")

com_selex <- SSplotSelex(model, fleets = 1, fleetnames = fleets, subplot = 1, year = c(2008, 2020))
com_selex$infotable$longname = c("Commercial 1916-2008", "Commercial 2009-2020")
com_selex$infotable$col <- rep(rich.colors.short(n = 8)[2],2)
rec_selex <- SSplotSelex(model, fleets = 2, fleetnames = fleets, subplot = 1, year = c(2020))
rec_selex$infotable$longname = c("Recreational")
rec_selex$infotable$col <- rep(rich.colors.short(n = 8)[1],1)

pngfun(wd = savedir, file = "selectivity.png", w = 7, h = 7, pt = 12)
	par(mfrow=c(2,1), mar=c(4,4,2,2))
	SSplotSelex(model, fleets=1,  infotable=com_selex$infotable, year = c(2008, 2020),
				subplot = 1, legendloc = 'topleft', showmain=FALSE)
	#legend("topleft", legend = com_selex$infotable$longname, 
	#	col = com_selex$infotable$col, lwd = 2, lty = 1, pch = 16, bty = 'n')
	grid()
	SSplotSelex(model, fleets = 2, infotable = rec_selex$infotable, 
				subplot = 1, legendloc = 'bottomright', showmain=FALSE, year = c(1999, 2020))	
	legend("topleft", legend = rec_selex$infotable$longname, 
		col = rec_selex$infotable$col, lwd = 2, lty = 1, pch = 16, bty = 'n')
	grid()
dev.off()

pngfun(wd = savedir, 'unavailable_biomass.png')
	SSunavailableSpawningOutput(model, plot=TRUE)
dev.off()