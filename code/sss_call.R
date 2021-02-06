############################################################
# EXAMPLE RUN SSS
############################################################
# load the library

devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/SSS/SSS")
#install.packages(c("tmvtnorm", "msm", "EnvStats"))
library(tmvtnorm)
library(msm)
library(EnvStats)

# Assume a Beverton-Holt Stock Recruit relationship
# define the directory
Dir.in <-"C:/Assessments/2021/copper_rockfish_2021/models/sss/wa_7.7_base_depl_40"

SSS.BH <- SSS(filepath= Dir.in, # location to run the model
              file.name=c("2021_wa_copper.dat","2021_wa_copper.ctl"), # data and ctl file names
              reps = 1000, # number of model runs
              seed.in = 19, # seed number
              Dep.in = c(2, 0.40, 0.20), # c(distribution shape, mean, sd)
              M.in = c(3, 0.108, 0.24, 3, 0.108, 0.22), # c(distribution shape for females, mean for females, sd for females, distribution shape for males, mean for males, sd for males)
              h.in = c(1, 0.72, 0.15), # c(distribution, mean, sd)
              R_start = c(0, 3), # c( switch option, input value)
              ts_yrs = c(1935, 2020),
              sexes = TRUE)  # unique male and female M

#######################################################################
#
# Evaluate the estimates, create figures, and tables
#
#######################################################################
library(HandyCode)
dir = "C:/Assessments/2021/copper_rockfish_2021/models/sss"
load(file.path(dir, "wa_7.7_base_depl_60", "SSS_out.DMP"))
out = SSS.out

ssb = apply(out$SB_series, 2, quantile, c(0.025, 0.5, 0.975))
depl = apply(out$Rel_Stock_status_series, 2, quantile, c(0.025, 0.5, 0.975))
m.f = out$Posteriors$M_f
m.m = out$Posteriors$M_m
h   = out$Posteriors$h
depl.prior = out$Posteriors$Dep.Obs
abc = apply(out$ABC, 2, quantile, c(0.025, 0.50, 0.975))
ofl = apply(out$OFL, 2, quantile, c(0.025, 0.50, 0.975))

par(mfrow = c(2,2))
hist(m.f, xlab = "Natural Mortality (f)")
hist(m.m, xlab = "Natural Mortality (m)")
hist(h, xlab = "Steepness")
hist(depl.prior, xlab = "Fraction Unfished")

par(mfrow = c(2,2))
plot(colnames(ssb), ssb[2,], ylim = c(0, max(ssb)), type = 'l', lwd = 2, 
	ylab = "Spawning output", xlab = "Year")
lines(colnames(ssb), ssb[1,], lty = 2)
lines(colnames(ssb), ssb[3,], lty = 2)
plot(colnames(depl), depl[2,], ylim = c(0, 1), type = 'l', lwd = 2,
	ylab = "Fraction unfished", xlab = "Year")
lines(colnames(depl), depl[1,], lty = 2)
lines(colnames(depl), depl[3,], lty = 2)
abline(h = 0.40, lty = 3, col = 'red')
abline(h = 0.25, lty = 3, col = 'red')
boxplot(ofl, ylab = "OFL (mt)", xlab = "Year")
boxplot(abc, ylab = "ABC (mt)", xlab = "Year")
