
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/nwfscSurvey")
library(HandyCode)
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/dataModerate_2021")
library(ggplot2)

dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish"


hkl = read.csv(file.path(dir, "data", "survey", "qryGrandUnifiedThru2019_06182020.csv"))
hkl$areas <- ifelse( hkl$SITENAME >= 500, "CCA", "non_CCA")
hkl$length = hkl$LENGTH
hkl$lat = hkl$LATDD
hkl$long = hkl$LONDD
hkl$depth = hkl$DEPTHM
hkl$species = hkl$COMNAME

pngfun(wd = file.path(dir, "data", "survey", "plots"), file = "HKL_Site_Observations.png", w = 7, h = 7, pt = 12)
colors = c(rgb(128/255,128/255,128/255, alpha = 0.05),
		   rgb(0,1,0, alpha = 0.05), 
		   rgb(1, 165/255, 0, alpha = 1))
jitter = runif(nrow(hkl), 0.01, 0.1)
plot(-1*hkl$long+rev(jitter), hkl$lat+jitter, type = 'p', col = colors[1], 
	xlab = "Longitude", ylab = "Latitude")
find = which(hkl$areas == "CCA")
points(-1*hkl$long[find]+rev(jitter[find]), hkl$lat[find]+jitter[find], col = colors[2])
find = which(hkl$species == "Copper Rockfish")
points(-1*hkl$long[find]+rev(jitter[find]), hkl$lat[find]+jitter[find], pch = 16, col = colors[3])

colors = c(rgb(128/255,128/255,128/255, alpha = 1),
		   rgb(0,1,0, alpha = 1), 
		   rgb(1, 165/255, 0, alpha = 1))
legend('topright', bty = 'n', pch = c(16, 16, 16), col = colors, pt.cex = 2, 
	legend = c("Outside CCA Sites", "Inside CCA Sites", "Sites with Copper Rockfish Observed"))
dev.off()

pngfun(wd = file.path(dir, "data", "survey", "plots"), file = "HKL_Size_by_Depth.png", w = 7, h = 7, pt = 12)
color = rgb(1, 165/255, 0, alpha = 1)
find = which(hkl$species == "Copper Rockfish")
plot(hkl$depth[find], hkl$length[find], pch = 16, ylim = c(0, 55),
	ylab = "Length (cm)", xlab = "Depth (m)", col = color)
dev.off()


#################################################################################

dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data"
hkl_age = read.csv(file.path(dir, "survey", "nwfsc_hkl_ages.csv"))

plot(hkl_age$final_age, hkl_age$length_cm, xlim = c(0, 50), ylim = c(25, 55))

#################################################################################
find = which(hkl$species == "Copper Rockfish")
sub_hkl = hkl[find,]
find = which(sub_hkl$areas == "CCA")
in_hkl = sub_hkl[find,]
out_hkl = sub_hkl[-find,]

colors = c(rgb(127/255, 0, 1, alpha = 1),
		  rgb(1, 128/255, 0, alpha = 1))

pngfun(wd = file.path(dir, "data", "survey", "plots"), file = "HKL_Size_by_Lat_Lon.png", w = 7, h = 7, pt = 12)
par(mfrow = c(1, 2))
plot(out_hkl$LATDD, out_hkl$length, xlim = c(32, 35),  ylim = c(0, 60),
	xlab = "Latitude", ylab = "Length (cm)", col = colors[1], pch = 16, cex = 1.2)
points(in_hkl$LATDD, in_hkl$length, col = colors[2], pch = 16, cex = 1.2)

plot(out_hkl$LONDD, out_hkl$length, xlim = c(117, 121), ylim = c(0, 60),
	xlab = "Longitude", ylab = "Length (cm)", col = colors[1], pch = 16, cex = 1.2)
points(in_hkl$LONDD, in_hkl$length, col = colors[2], pch = 16, cex = 1.2)
legend("bottomleft", bty = 'n', legend  = c("Outside the CCA", "Inside the CCA"),
	col = colors, cex = 1.2, pch = 16)
dev.off()