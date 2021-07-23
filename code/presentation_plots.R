library(ggplot2); library(HandyCode)
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/r4ss")

loc = "C:/Assessments/2021/copper_rockfish_2021/models"

sca <- SS_output(file.path(loc, "ca_s_pt_c", "12.1_base"), printstats=FALSE, verbose=FALSE)
nca <- SS_output(file.path(loc, "ca_n_pt_c", "10.3_base"), printstats=FALSE, verbose=FALSE)
or  <- SS_output(file.path(loc, "or", "10.5_base"), printstats=FALSE, verbose=FALSE)
wa  <- SS_output(file.path(loc, "wa", "7.7_base"), printstats=FALSE, verbose=FALSE)

or_rec  <- SS_output("C:/Assessments/2021/copper_rockfish_2021/models/or/_sensitivities/10.5_base_recdevs", printstats=FALSE, verbose=FALSE)
wa_rec  <- SS_output("C:/Assessments/2021/copper_rockfish_2021/models/wa/_sensitivities/7.7_base_recdevs", printstats=FALSE, verbose=FALSE)
sca_rec  <- SS_output("C:/Assessments/2021/copper_rockfish_2021/models/ca_s_pt_c/_sensitivities/12.1_base_recdevs", printstats=FALSE, verbose=FALSE)


gg_color_hue <- function(n) {
  hues <- seq(15, 375, length = n + 1)
  grDevices::hcl(h = hues, l = 65, c = 100)[1:n]
}
colors <- gg_color_hue(20)

###################################################################################################

loc = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/commercial_comps"
sca_com_len <- read.csv(file.path(loc, "forSS", "CA_S_Samples.csv"))
nca_com_len <- read.csv(file.path(loc, "forSS", "CA_N_Samples.csv"))
or_com_len <- read.csv(file.path(loc, "forSS", "OR_Com_Samples.csv"))
wa_com_len <- read.csv(file.path(loc, "forSS", "WA_Samples.csv"))

sca_com_len$com_total = apply(sca_com_len[,3:5], 1, sum)
nca_com_len$com_total = apply(nca_com_len[,3:5], 1, sum)
or_com_len$com_total  = apply(or_com_len[,3:5], 1, sum)
wa_com_len$com_total  = apply(wa_com_len[,3:5], 1, sum)

loc = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/recreational_comps"
sca_rec_len <- read.csv(file.path(loc, "forSS", "s_ca_rec_len_samples_may2021.csv"))
nca_rec_len <- read.csv(file.path(loc, "forSS", "n_ca_rec_len_samples_may2021.csv"))
or_rec_len <- read.csv(file.path(loc, "forSS", "or_samples_all.csv"))
wa_rec_len <- read.csv(file.path(loc, "forSS", "wa_samples.csv"))

loc = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/survey"
hkl_len <- read.csv(file.path(loc, "forSS", "sca_hkl_length_SampleSize.csv"))

sca_len = data.frame(Year = c(sca_com_len$Year, sca_rec_len$Year, hkl_len$Year),
					Source = c(rep("Commercial", nrow(sca_com_len)), 
							   rep("Recreational", nrow(sca_rec_len)),
							   rep("NWFSC HKL", nrow(hkl_len))),
					Number = c(sca_com_len$com_total, sca_rec_len$All_Fish, hkl_len$All_Fish))
nca_len = data.frame(Year = c(nca_com_len$Year, nca_rec_len$Year),
					Source = c(rep("Commercial", nrow(nca_com_len)), 
							   rep("Recreational", nrow(nca_rec_len))),
					Number = c(nca_com_len$com_total, nca_rec_len$All_Fish))
or_len = data.frame(Year = c(or_com_len$Year, or_rec_len$Year),
					Source = c(rep("Commercial", nrow(or_com_len)), 
							   rep("Recreational", nrow(or_rec_len))),
					Number = c(or_com_len$com_total, or_rec_len$All_Fish))
wa_len = data.frame(Year = c(wa_com_len$Year, wa_rec_len$Year),
					Source = c(rep("Commercial", nrow(wa_com_len)), 
							   rep("Recreational", nrow(wa_rec_len))),
					Number = c(wa_com_len$com_total, wa_rec_len$All_Fish))

sca_len$Source = factor(sca_len$Source, 
			   levels = c( "Recreational", "Commercial", "NWFSC HKL"))
nca_len$Source = factor(nca_len$Source, levels = c( "Recreational", "Commercial"))
or_len$Source = factor(or_len$Source, levels = c( "Recreational", "Commercial"))
wa_len$Source = factor(wa_len$Source, levels = c( "Recreational", "Commercial"))

loc = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/presentations"
pngfun(wd = file.path(loc, "_plots"), file = "Lengths_by_Source_SCA.png", w = 9, h = 7, pt = 12)
ggplot(sca_len, aes(fill = Source, y = Number, x = Year)) + 
    geom_bar(position="stack", stat="identity")+
    coord_cartesian(ylim = c(0, 4000)) + 
    theme(axis.text.y = element_text(size = 13, color = 1),
          axis.text.x = element_text(size = 13, color = 1), 
          legend.text.align = 0,
          axis.title.x = element_text(size = 18),
          axis.title.y = element_text(size = 18),
          legend.text = element_text(size = 18),
          legend.title = element_text(size = 18),
          panel.grid.minor = element_blank())  +
    xlab("Year") + ylab("Length Samples (#)")
dev.off()

pngfun(wd = file.path(loc, "_plots"), file = "Lengths_by_Source_NCA.png", w = 9, h = 7, pt = 12)
ggplot(nca_len, aes(fill = Source, y = Number, x = Year)) + 
    geom_bar(position="stack", stat="identity")+
    coord_cartesian(ylim = c(0, 4000)) + 
    theme(axis.text.y = element_text(size = 13, color = 1),
          axis.text.x = element_text(size = 13, color = 1), 
          legend.text.align = 0,
          axis.title.x = element_text(size = 18),
          axis.title.y = element_text(size = 18),
          legend.text = element_text(size = 18),
          legend.title = element_text(size = 18),
          panel.grid.minor = element_blank())  +
    xlab("Year") + ylab("Length Samples (#)")
dev.off()

pngfun(wd = file.path(loc, "_plots"), file = "Lengths_by_Source_OR.png", w = 9, h = 7, pt = 12)
ggplot(or_len, aes(fill = Source, y = Number, x = Year)) + 
    geom_bar(position="stack", stat="identity")+
    coord_cartesian(ylim = c(0, 2000)) + 
    theme(axis.text.y = element_text(size = 13, color = 1),
          axis.text.x = element_text(size = 13, color = 1), 
          legend.text.align = 0,
          axis.title.x = element_text(size = 18),
          axis.title.y = element_text(size = 18),
          legend.text = element_text(size = 18),
          legend.title = element_text(size = 18),
          panel.grid.minor = element_blank())  +
    xlab("Year") + ylab("Length Samples (#)")
dev.off()

pngfun(wd = file.path(loc, "_plots"), file = "Lengths_by_Source_WA.png", w = 9, h = 7, pt = 12)
ggplot(wa_len, aes(fill = Source, y = Number, x = Year)) + 
    geom_bar(position="stack", stat="identity")+
    coord_cartesian(ylim = c(0, 2000)) + 
    theme(axis.text.y = element_text(size = 13, color = 1),
          axis.text.x = element_text(size = 13, color = 1), 
          legend.text.align = 0,
          axis.title.x = element_text(size = 18),
          axis.title.y = element_text(size = 18),
          legend.text = element_text(size = 18),
          legend.title = element_text(size = 18),
          panel.grid.minor = element_blank())  +
    xlab("Year") + ylab("Length Samples (#)")
dev.off()

sca_len$Area = "South of Point Conception"
nca_len$Area = "North of Point Conception"
or_len$Area = "Oregon"
wa_len$Area = "Washington"

all_len = rbind(sca_len,
				nca_len, 
				or_len, 
				wa_len)

all_len$Area = factor(all_len$Area, 
			   levels = c("South of Point Conception", "North of Point Conception",
			   "Oregon", "Washington"))

pngfun(wd = file.path(loc, "_plots"), file = "Lengths_by_Source_All.png", w = 14, h = 7, pt = 12)
ggplot(all_len, aes(fill = Source, y = Number, x = Year)) + 
    geom_bar(position="stack", stat="identity") +
    facet_wrap(facets = c("Area")) +
    coord_cartesian(ylim = c(0, 4000)) + 
    theme(axis.text.y = element_text(size = 13, color = 1),
          axis.text.x = element_text(size = 13, color = 1), 
          legend.text.align = 0,
          strip.text = element_text(size = 18), 
          axis.title.x = element_text(size = 18),
          axis.title.y = element_text(size = 18),
          legend.text = element_text(size = 18),
          legend.title = element_text(size = 18),
          panel.grid.minor = element_blank())  +
    xlab("Year") + ylab("Length Samples (#)")
dev.off()

#######################################################################################
# Maturity
#######################################################################################
len_bin = seq(0, 60, 1)

get_mat <- function(len_bin, l50, slope){
	mat = 1 / (1 + exp(slope*(len_bin - l50)))
	return(mat)
}

pngfun(wd = file.path(loc, "_plots"), file = "Maturity_Comparison.png", w = 12, h = 7, pt = 12)
plot(len_bin, get_mat(len_bin, 34.83, -0.6), type = 'l', lwd = 3,
	col = 'purple', ylab = "Proportion Mature", xlab = "Length (cm)", yaxs="i",
	cex.axis = 1.5, cex.lab = 1.5)
abline(v = 34.83, col = 'purple', lty = 2, lwd = 2)
lines(len_bin, get_mat(len_bin, 34.315, -0.369), lwd = 3,
	lty = 3, col = 'red')
abline(v = 34.315, col = 'red', lty = 2 , lwd = 2)
legend('topleft', bty = 'n', legend = c("Maturity: NCA, OR, WA", "Maturity: SCA"), 
	col = c('purple', 'red'), lwd = 4, lty = c(1, 3), cex = 1.5)
dev.off()

#######################################################################################
# Compare RecDevs
#######################################################################################
loc = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/presentations"

modelnames <- c("South of Point Conception", "North of Point Conception",
				"Oregon", "Washington")
x <- SSsummarize(list(sca_rec, nca, or_rec, wa_rec))

SSplotComparisons(x, endyrvec = 2021, 
                  legendlabels = modelnames, 
                  ylimAdj = 1.1,
                  plotdir = file.path(loc, '_plots'), 
                  legendloc = "topleft", 
                  filenameprefix = paste0("recdev_"),
                  subplot = c(11), 
                  print = TRUE, 
                  pdf = FALSE)


modelnames <- c("South of Point Conception", "North of Point Conception")
x <- SSsummarize(list(sca_rec, nca))

SSplotComparisons(x, endyrvec = 2021, 
                  legendlabels = modelnames, 
                  ylimAdj = 1.1,
                  plotdir = file.path(loc, '_plots'), 
                  legendloc = "topleft", 
                  filenameprefix = paste0("ca_recdev_"),
                  subplot = c(11), 
                  print = TRUE, 
                  pdf = FALSE)

modelnames <- c("Oregon", "Washington")
x <- SSsummarize(list(or_rec, wa_rec))

SSplotComparisons(x, endyrvec = 2021, 
                  legendlabels = modelnames, 
                  ylimAdj = 1.1,
                  plotdir = file.path(loc, '_plots'), 
                  legendloc = "topleft", 
                  filenameprefix = paste0("or_wa_recdev_"),
                  subplot = c(11), 
                  print = TRUE, 
                  pdf = FALSE)


#####################################################################################
# Prior Distributions
#####################################################################################
loc = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/presentations"

rbeta.ab <- function(n, m, s, a, b)
{
  # calculate mean of corresponding standard beta dist
  mu.std <- (m-a)/(b-a)

  # calculate parameters of std. beta with mean=mu.std and sd=s
  alpha <- (mu.std^2 - mu.std^3 - mu.std*s^2) / s^2
  beta  <- (mu.std - 2*mu.std^2 + mu.std^3 - s^2 + mu.std*s^2) / s^2

  # generate n draws from standard beta
  b.std <- rbeta(n, alpha, beta)

  # linear transformation from beta(0,1) to beta(a,b)
  b.out <- (b-a)*b.std + a

  return(b.out)
}
m = rlnorm(10000, log(0.108), 0.20) 
dep = rbeta.ab(10000, 0.40, 0.10, 0.01, 0.99)
fmsy.m = rnorm(10000, 0.80, 0.20)
bmsy.b0 = rbeta.ab(10000, 0.40, 0.10, 0.01, 0.99)
yield = rlnorm(10000, log(100), 0.20)

pngfun(wd = file.path(loc, "_plots"), file = "Parameter_Distributions_Example.png", w = 7, h = 7, pt = 12)
par(mfrow = c(2, 2))
hist(m, xlab = "Natural Mortality (M)", main = "", col = 'red', xlim = c(0, 0.3), cex.lab = 1.5, cex.axis = 1.2)
abline (v = 0.108, lwd = 3, lty = 2)
hist(dep, xlab = "Stock Status in 2000", col = 'orange', main = "", cex.lab = 1.5, cex.axis = 1.2, xlim = c(0, 1))
abline (v = 0.4, lwd = 3, lty = 2)
hist(fmsy.m, xlab = "Fmsy/M", col = 'blue', main = "", cex.lab = 1.5, cex.axis = 1.2)
abline (v = 0.8, lwd = 3, lty = 2)
hist(bmsy.b0, xlab = "Bmsy/B0", col = 'green', main = "", cex.lab = 1.5, cex.axis = 1.2, xlim = c(0, 1))
abline (v = 0.4, lwd = 3, lty = 2)
dev.off()

pngfun(wd = file.path(loc, "_plots"), file = "Yield_Example.png", w = 7, h = 7, pt = 12)
hist(yield, xlab = "Yield", col = 'purple', main = "", cex.lab = 1.5, cex.axis = 1.2)
abline (v = 100, lwd = 3, lty = 2)
dev.off()

################################################################################
#  California Comparison of Growth
################################################################################

sca_f <- sca$endgrowth[sca$endgrowth$Sex == 1, "Len_Beg"]
sca_m <- sca$endgrowth[sca$endgrowth$Sex == 2, "Len_Beg"]
nca_f <- nca$endgrowth[nca$endgrowth$Sex == 1, "Len_Beg"]
nca_m <- nca$endgrowth[nca$endgrowth$Sex == 2, "Len_Beg"]

a = 0:50
pngfun(wd = file.path(loc, "_plots"), file = "Growth_by_Area.png", w = 7, h = 7, pt = 12)
plot(a, sca_f, ylim = c(0, 55), col = 'red', lwd = 3, type = 'l',
  xlab = "Age (yr)", ylab = "Length (cm)")
lines(a, sca_m, col = 'blue', lwd = 3, lty = 1)
lines(a, nca_f, col = 'orange', lwd = 2, lty = 2)
lines(a, nca_m, col = 'purple', lwd = 2, lty = 2)
legend('bottomright', col = c("red", 'blue', 'orange', 'purple'), lwd = 2,
  lty = c(1,1,2,2), bty = 'n', cex = 1.25,
  legend = c("SCA - Females", "SCA - Males", "NCA/OR/WA - Females", "NCA/OR/WA - Males"))
dev.off()

pngfun(wd = file.path(loc, "_plots"), file = "Growth_by_Area_1x2.png", w = 7, h = 7, pt = 12)
par(mfrow = c(1,2))
plot(a, sca_f, ylim = c(0, 55), col = 'red', lwd = 3, type = 'l',
  xlab = "Age (yr)", ylab = "Length (cm)")
lines(a, sca_m, col = 'blue', lwd = 3, lty = 1)
legend('bottomright', col = c("red", 'blue'), lwd = 2,
  lty = c(1,1), bty = 'n', cex = 1.25,
  legend = c("SCA - Females", "SCA - Males"))
plot(a, nca_f, col = 'red', lwd = 3, type = 'l', ylim = c(0,55),
  xlab = "Age (yr)", ylab = "Length (cm)")
lines(a, nca_m, col = 'blue', lwd = 3, lty = 1)
legend('bottomright', col = c("red", 'blue'), lwd = 2,
  lty = c(1,1), bty = 'n', cex = 1.25,
  legend = c("NCA/OR/WA - Females", "NCA/OR/WA - Males"))
dev.off()


################################################################################
#  SCA Selectivity
################################################################################
model = sca
# Create selectivity plots
fleets = model$FleetNames

test <- SSplotSelex(model, fleets=1:3, fleetnames=fleets, subplot=1)
test$infotable$col <- c("red", "blue", "purple")
test$infotable$lwd <- rep(3,3)
pngfun(wd = file.path(loc, "_plots"), 'sca_selectivity.png', w = 10, h = 7)
par(mfrow=c(1,1), mar=c(4,4,3,1))
SSplotSelex(model, infotable=test$infotable, 
	subplot=1, legendloc='topleft', showmain=FALSE)
grid()
dev.off()


################################################################################
#  NCA Selectivity
################################################################################
model = nca
fleets = c("Commercial", "Recreational")

com_selex <- SSplotSelex(model, fleets = 1, fleetnames = fleets, subplot = 1, year = c(2008, 2020))
com_selex$infotable$longname = c("Commercial 1927-2008", "Commercial 2009-2020")
com_selex$infotable$col <- rep(rich.colors.short(n = 8)[2],2)
rec_selex <- SSplotSelex(model, fleets = 2, fleetnames = fleets, subplot = 1)
rec_selex$infotable$longname = c("Recreational 1927-2020")
rec_selex$infotable$col <- 'red'

pngfun(wd = file.path(loc, "_plots"), file = "nca_selectivity.png", w = 14, h = 7, pt = 12)
	par(mfrow=c(1,2))
	SSplotSelex(model, fleets=1,  infotable=com_selex$infotable, 
				subplot = 1, legendloc = 'topleft', showmain=FALSE, year = c(2008, 2020))
	#legend("topleft", legend = com_selex$infotable$longname, 
	#	col = com_selex$infotable$col, lwd = 2, lty = 1, pch = 16, bty = 'n')
	grid()
	SSplotSelex(model, fleets = 2, infotable = rec_selex$infotable, 
				subplot = 1, legendloc = 'bottomright', showmain=FALSE)	
	legend("topleft", legend = rec_selex$infotable$longname, 
		col = rec_selex$infotable$col, lwd = 2, lty = 1, pch = 16, bty = 'n')
	grid()
dev.off()

################################################################################
#  Aggregated Fits
################################################################################

SSplotComps(replist = model, subplots = 21, print = TRUE,
            kind = "LEN", fleets = 1:3, pwidth = 12, pheight = 7,
            plotdir = file.path(loc, "_plots"), maxrows = 1, maxcols = 3,
            cex.main = 2, datonly = FALSE, showeffN = TRUE)

SSplotComps(replist = model, subplots = 2, print = TRUE,
            kind = "LEN", fleets = 2, pwidth = 12, pheight = 7,
            plotdir = file.path(loc, "_plots"), maxrows = 1, maxcols = 3,
            cex.main = 2, datonly = TRUE, showeffN = TRUE)


################################################################################
#  Washington Rec. Catch
################################################################################
model = wa
pngfun(wd = file.path(loc, "_plots"), file = "catches_wa.png", w = 12, h = 7, pt = 12)
#Plot the catches special because of numbers and biomass mix
par(mfrow = c(1,1))
yr = model$catch[model$catch$Fleet == 1, "Yr"]
rec = model$catch[model$catch$Fleet == 1, "kill_bio"]
barplot(rec, main = "Recreational", col = "blue", names.arg = yr)
mtext(side = 1, "Year", line = 2.5)
mtext(side = 2, "Catch (mt)", line = 2.5)
dev.off()

################################################################################
#  Washington Mean Lengths
################################################################################

SSplotComps(replist = model, subplots = 8, print = TRUE,
            kind = "LEN", pwidth = 12, pheight = 7,
            plotdir = file.path(loc, "_plots"), maxrows = 1, maxcols = 3,
            cex.main = 2, datonly = TRUE, showeffN = TRUE)


