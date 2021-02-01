library(r4ss)
library(HandyCode)
library(MCMCglmm)

wd = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/models/ca_s_pt_c/_bridge"
wd = "C://Assessments/2021/copper_rockfish_2021/models/ca_s_pt_c/_bridge"
xdb = read.csv(file.path(wd, "copper_south_xdbsra_2013_posteriors.csv"))

getmode <- function(v) {
   uniqv <- unique(v)
   uniqv[which.max(tabulate(match(v, uniqv)))]
}

m = median(xdb[,"M.vec"], na.rm = TRUE)
delta = median(xdb[,"Delta.vec"], na.rm = TRUE)
fmsy = median(xdb[,"FMSY"], na.rm = TRUE)
bmsy = median(xdb[,"BMSY"], na.rm = TRUE)
bmsy_b0 = median(xdb[,"BMSYtoB0.vec"], na.rm = TRUE)


m_mode = posterior.mode(as.matrix(xdb[1:15000,"M.vec"]))
delta_mode = posterior.mode(as.matrix(xdb[1:15000,"Delta.vec"]))
fmsy_mode = posterior.mode(as.matrix(xdb[1:15000,"FMSY"]))
bmsy_mode = posterior.mode(as.matrix(xdb[1:15000,"BMSY"]))
bmsy_b0_mode = posterior.mode(as.matrix(xdb[1:15000,"BMSYtoB0.vec"]))

ind = which(colnames(xdb) %in% c('B1916', 'B2013'))
ssb = apply(xdb[,ind[1]:ind[2]] / 2, 2, quantile, c(0.025, 0.50, 0.975), na.rm = TRUE) 
depl = ssb / ssb[,1]


tmp = as.matrix(xdb[1:15000,ind[1]:ind[2]])
ssb_mode = posterior.mode(tmp) / 2 
depl_mode = ssb_mode / ssb_mode[1]

####################################################################
# Grab the alternative models:
###################################################################
wd = "C:/Assessments/2021/copper_rockfish/models/ca_s_pt_c/_bridge"

all = SS_output(file.path(wd, "0.1.0_single_sex"))
growth = SS_output(file.path(wd, "0.3.0_single_sex_growth"))
mode = SS_output(file.path(wd, "0.1.0_single_sex_mode"))

ind = which(all$derived_quants$Label %in% c("SSB_1916", "SSB_2013"))
ss_ssb = all$derived_quants[ind[1]:ind[2], "Value"] / 2
ss_depl = ss_ssb / ss_ssb[1]

ind = which(growth$derived_quants$Label %in% c("SSB_1916", "SSB_2013"))
ss_ssb_g = growth$derived_quants[ind[1]:ind[2], "Value"] / 2
ss_depl_g = ss_ssb_g / ss_ssb_g[1]

ind = which(mode$derived_quants$Label %in% c("SSB_1916", "SSB_2013"))
ss_ssb_mode = mode$derived_quants[ind[1]:ind[2], "Value"] / 2
ss_depl_mode = ss_ssb_mode / ss_ssb_mode[1]

pngfun(wd = wd, file = "Initial_Bridge.png")

yrs = 1916:2013
par(mfrow = c(2, 1), mar = c(4, 4, 2,2))
plot(yrs, ssb[2,], type = 'l', lwd = 2, col = 'black', ylim = c(0, 1050), xlab = "Years", ylab = "SSB")
lines(yrs, ssb[1,], lty = 3, col = 'black')
#lines(yrs, ssb[3,], lty = 2, col = 'black')
lines(yrs, ssb_mode, lty = 1, lwd = 2, col = 'darkgrey')
lines(yrs, ss_ssb_g, lty = 2, lwd = 2, col = "green")
lines(yrs, ss_ssb, lty = 2, , lwd = 2, col = 'red')
#lines(yrs, ss_ssb_mode, lty = 2, , lwd = 2, col = 'purple')

plot(yrs, depl[2,], type = 'l', lwd = 2, col = 'black', ylim = c(0, 1.1), xlab = "Years", ylab = "Fraction Unfished")
lines(yrs, depl[1,], lty = 3, col = 'black')
lines(yrs, depl[3,], lty = 3, col = 'black')
lines(yrs, depl_mode, lty = 1, lwd = 2, col = 'darkgrey')
lines(yrs, ss_depl, lty = 2, , lwd = 2, col = 'red')
lines(yrs, ss_depl_g, lty = 2, lwd = 2, col = "green")
#lines(yrs, ss_depl_mode, lty = 2, lwd = 2, col = "purple")
legend("bottomleft", bty = 'n', col = c('black', 'black','darkgrey', 'red',  'green'), lwd = c(2,1,2,2,2), lty = c(1,3,1,2,2,2),
	legend = c("2013 - Median", "2013 - 95% Predictive Interval", "2013 - Mode", 
			   "2021 - Ricker Power", "2021 - Ricker Power & Growth"))

dev.off()


pngfun(wd = wd, file = "Growth.png")
par(mfrow = c(1, 1))
len = seq(0, 60, 1)
plot(len, all$parameters[7, "Value"]*len^all$parameters[8, "Value"], type = 'l', lwd = 2, ylab = "Weight", xlab = "Length" )
lines(len, growth$parameters[7, "Value"]*len^growth$parameters[8, "Value"], lwd = 2, lty = 2, col = 'red')
legend("topleft", bty = 'n', legend = c("2021 - LW", "Adjust LW to Match"), lwd = 2, lty = c(1,2), col = c('black', 'red'))
dev.off()



########################################################################
#
########################################################################

wd = "C:/Assessments/2021/copper_rockfish_2021/models/ca_s_pt_c/_bridge"

base = SS_output(file.path(wd, "1.0_single_sex_growth"))
depl = SS_output(file.path(wd, "2.0_remove_depl"))

modelnames <- c("Match XDB-SRA", "-Remove Depletion Survey")
mysummary <- SSsummarize(list(base,  depl))

SSplotComparisons(mysummary, 
				  subplots = 1:4,
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

# Biology
m = SS_output(file.path(wd, "3.1_bio_m"))
growth = SS_output(file.path(wd, "3.2_bio_growth"))
mat = SS_output(file.path(wd, "3.3_bio_mat"))
fecund = SS_output(file.path(wd, "3.4_bio_fecund"))
two_sex = SS_output(file.path(wd, "3.5_bio_2_sex"))

modelnames <- c("Match XDB-SRA", "-Remove Depletion Survey", 
				"Bio - M",
				"Bio - Growth (F)",
				"Bio - Maturity", 
				"Bio - Fecundity",
				"Bio - 2 Sex")
mysummary <- SSsummarize(list(base,  
							  depl,
							  m,
							  growth,
							  mat,
							  fecund,
							  two_sex))

SSplotComparisons(mysummary, 
				  subplots = 1:4,
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

# Stock - Recruit
bh = SS_output(file.path(wd, "4.1_srr_h"))
modelnames <- c("Match XDB-SRA", 
				"Remove Depletion Survey", 
				"Biology",
				"Beverton-Holt SS")
mysummary <- SSsummarize(list(base,  
							  depl,
							  two_sex, 
							  bh))

SSplotComparisons(mysummary, 
				  subplots = 1:4,
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"), 
				  pdf = TRUE)

# Catches
catch = SS_output(file.path(wd, "5.1_catches"))
modelnames <- c("Match XDB-SRA", 
				"- Remove Depletion Survey", 
				"+ Biology",
				"+ Beverton-Holt SS",
				"+ Updated Catches")
mysummary <- SSsummarize(list(base,  
							  depl,
							  two_sex, 
							  bh,
							  catch))

SSplotComparisons(mysummary, 
				  subplots = 1:4,
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"), 
				  pdf = TRUE)

# Lengths
# add the recreational lengths to fleet 1 in the bridge model - ignoring commercial lengths for now.
rec_len = SS_output(file.path(wd, "6.1_data_lengths"))

modelnames <- c(#"Match XDB-SRA", 
				#"- Remove Depletion Survey", 
				"+ Biology",
				"+ Beverton-Holt SS",
				"+ Updated Catches",
				"+ Rec. Lengths")
mysummary <- SSsummarize(list(#base,  
							  #depl,
							  two_sex, 
							  bh,
							  catch,
							  rec_len))

SSplotComparisons(mysummary, 
				  subplots = 1:4,
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"), 
				  pdf = TRUE)

# Remove Indices
no_indices = SS_output(file.path(wd, "7.1_indices_remove"))

modelnames <- c("Match XDB-SRA", 
				"- Remove Depletion Survey", 
				"+ Biology",
				"+ Beverton-Holt SS",
				"+ Updated Catches",
				"+ Rec. Lengths",
				"- Remove Indices")
mysummary <- SSsummarize(list(base,  
							  depl,
							  two_sex, 
							  bh,
							  catch,
							  rec_len,
							  no_indices))

SSplotComparisons(mysummary, 
				  subplots = 1:12,
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"), 
				  pdf = TRUE)

# fleets
hkl = SS_output(file.path(wd, "8.0_fleets_add_hkl"))
comm = SS_output(file.path(wd, "8.1_fleets_add_hkl_com"))

modelnames <- c(#"Match XDB-SRA", 
				#"- Remove Depletion Survey", 
				"+ Biology",
				"+ Beverton-Holt SS",
				"+ Updated Catches",
				"+ Rec. Lengths",
				"- Remove Indices",
				"+ Hook & Line",
				"+ Split Out Commercial")
mysummary <- SSsummarize(list(#base,  
							  #depl,
							  two_sex, 
							  bh,
							  catch,
							  rec_len,
							  no_indices,
							  hkl,
							  comm))

SSplotComparisons(mysummary, 
				  subplots = 1:12,
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"), 
				  pdf = TRUE)

########################################################
# Create Plots for Document
#########################################################

wd = "C:/Assessments/2021/copper_rockfish_2021/models/ca_s_pt_c/_bridge"

base = SS_output(file.path(wd, "1.0_single_sex_growth"))
depl = SS_output(file.path(wd, "2.0_remove_depl"))
two_sex = SS_output(file.path(wd, "3.5_bio_2_sex"))
bh = SS_output(file.path(wd, "4.1_srr_h"))
catch = SS_output(file.path(wd, "5.1_catches"))
rec_len = SS_output(file.path(wd, "6.1_data_lengths"))
no_indices = SS_output(file.path(wd, "7.1_indices_remove"))
hkl = SS_output(file.path(wd, "8.0_fleets_add_hkl"))
comm = SS_output(file.path(wd, "8.1_fleets_add_hkl_com"))
recdevs = SS_output(file.path(wd, "9.0_recdevs"))

modelnames <- c("Match XDB-SRA", 
				"- Remove Depletion Survey", 
				"+ Biology",
				"+ Beverton-Holt SS",
				"+ Updated Catches",
				"+ Rec. Lengths",
				"- Remove Indices",
				"+ Hook & Line",
				"+ Split Out Commercial",
				"+ Recruitment Devs.")
mysummary <- SSsummarize(list(base,  
							  depl,
							  two_sex, 
							  bh,
							  catch,
							  rec_len,
							  no_indices,
							  hkl,
							  comm,
							  recdevs))

SSplotComparisons(mysummary, 
				  subplots = c(1,3),
				  legendlabels = modelnames, 
				  filenameprefix = "1_bridge_all_",
				  plotdir = file.path(wd, "_plots"), 
				  print = TRUE, 
				  pdf = FALSE)

modelnames <- c("+ Biology",
				"+ Beverton-Holt SS",
				"+ Updated Catches",
				"+ Rec. Lengths",
				"- Remove Indices",
				"+ Hook & Line",
				"+ Split Out Commercial",
				"+ Recruitment Devs.")
mysummary <- SSsummarize(list(two_sex, 
							  bh,
							  catch,
							  rec_len,
							  no_indices,
							  hkl,
							  comm,
							  recdevs))

SSplotComparisons(mysummary, 
				  subplots = c(1,3),
				  legendlabels = modelnames, 
				  filenameprefix = "1_bridge_subset_",
				  plotdir = file.path(wd, "_plots"), 
				  print = TRUE, 
				  pdf = FALSE)


