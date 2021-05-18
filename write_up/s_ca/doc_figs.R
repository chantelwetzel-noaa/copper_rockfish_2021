library(r4ss)
savedir = "C:/Assessments/2021/copper_rockfish_2021/write_up/s_ca/figs"
mydir = "C:/Assessments/2021/copper_rockfish_2021/models/ca_s_pt_c"
base_name = "12.0_base"
model = SS_output(file.path(mydir, base_name))

library(HandyCode)
pngfun(wd = savedir, 'unavailable_biomass.png', w = 10, h = 7)
	SSunavailableSpawningOutput(model, plot=TRUE)
dev.off()


# assessment comparison
old = SS_output(file.path(mydir, "_bridge", "1.0_single_sex_growth"))
modelnames <- c( "2021", "2013")
mysummary  <- SSsummarize(list(model, old))
SSplotComparisons(mysummary, 
                  legendlabels = modelnames, 
                  plotdir = savedir, 
                  legendloc = "topright", 
                  filenameprefix = paste0("assess_compare_"),
                  subplot = c(2,4), 
                  print = TRUE, 
                  pdf = FALSE)

SSplotData(
         replist = model, print = TRUE,
         pwidth = 7, pheight = 5, punits = 'in',
         ptsize = 10, res = 300, mainTitle = FALSE, cex.main = 1,
         plotdir = savedir, margins = c(5.1, 2.1, 4.1, 10),
         fleetnames = model$FleetNames, maxsize = 1.0
       )

cpue = model$cpue

z = cpue[cpue$Fleet == 3, ]
hi2 = qlnorm(0.975, meanlog = log(z$Obs), sdlog = z$SE_input )
lo2 = qlnorm(0.025, meanlog = log(z$Obs), sdlog = z$SE_input )
years = z$Yr

pngfun(wd = savedir, 'hkl_index.png', w = 10, h = 7)	
plot(0, type = 'n', xlim = range(years), ylim = c(0, max(1.1 * hi2)), 
	xlab = "Year", ylab = "Index", yaxs = 'i', main = "NWFSC Hook and Line",
	cex = 1.5, cex.axis = 1.25, cex.lab = 1.5, cex.main = 1.5)
arrows(x0 = years, y0 = lo2, x1 = years, y1 = hi2, angle = 90, code = 3, length = 0.01, lwd = 2)
points(years, z$Obs, pch = 21, bg = 'white', cex = 1.2)
dev.off()


test <- SSplotSelex(model,subplot=1)
test <- test$infotable[test$infotable$Sex == 1, ]
test$FleetName = c("Commercial", "Recreational", "NWFSC Hook and Line")

pngfun(wd = savedir, 'selectivity.png', w = 12, h = 9)
SSplotSelex(model, infotable=test$infotable, 
	subplot=1, legendloc='topleft', showmain=FALSE)
grid()
dev.off()
