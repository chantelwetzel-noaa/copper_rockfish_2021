############################################################
# EXAMPLE RUN SSS
############################################################
# load the library

devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/SSS/SSS")
#install.packages(c("tmvtnorm", "msm", "EnvStats"))
library(tmvtnorm)
library(msm)
library(EnvStats)
library(r4ss)

# Assume a Beverton-Holt Stock Recruit relationship
# define the directory
Dir.in <-"C:/Assessments/2021/copper_rockfish_2021/models/sss/wa/7.7_base_depl_67"
Dir.in <-"C:/Assessments/2021/copper_rockfish_2021/models/sss/wa/7.7_base_depl_44"


SSS.BH <- SSS(filepath= Dir.in, # location to run the model
              file.name=c("2021_wa_copper.dat","2021_wa_copper.ctl"), # data and ctl file names
              reps = 1000, # number of model runs
              seed.in = 19, # seed number
              Dep.in = c(2, 0.44, 0.20), # c(distribution shape, mean, sd)
              M.in = c(3, 0.108, 0.22, 3, 0.108, 0.22), # c(distribution shape for females, mean for females, sd for females, distribution shape for males, mean for males, sd for males)
              h.in = c(1, 0.72, 0.15), # c(distribution, mean, sd)
              R_start = c(0, 3), # c( switch option, input value)
              ts_yrs = c(1935, 2022),
              sexes = TRUE)  # unique male and female M

#######################################################################
#
# Evaluate the estimates, create figures, and tables
#
#######################################################################
library(HandyCode)
library(sa4ss)
dep = 44 # 67
base = paste0("7.7_base_depl_", dep)
dir = "C:/Assessments/2021/copper_rockfish_2021/models/sss/wa"
load(file.path(dir, base , "SSS_out.DMP"))
load(file.path(dir, base, "SSSoutput.DMP"))
out = SSS.out
reps = SSS.output.list

ssb = apply(out$SB_series, 2, quantile, c(0.025, 0.5, 0.975))
depl = apply(out$Rel_Stock_status_series, 2, quantile, c(0.025, 0.5, 0.975))
m.f = out$Priors$M_f
m.m = out$Priors$M_m
h   = out$Priors$h
depl.prior = out$Priors$Dep
abc = apply(out$ABC, 2, quantile, c(0.025, 0.50, 0.975))
ofl = apply(out$OFL, 2, quantile, c(0.025, 0.50, 0.975))

library(ggplot2)
library(ggthemes)
library(gridExtra)

p1 = ggplot(out$Priors, aes(x=M_f)) + 
  geom_histogram(bins = 17, aes(y = stat(density)), color = 'black', fill = 'white') +
  geom_vline(aes(xintercept = median(M_f)), linetype = 'dashed', size = 0.8, color = 'red') +
  labs (x = "Natural Mortality (F)", y = "Density") + xlim(0, 0.25)

p2 = ggplot(out$Priors, aes(x=M_m)) + 
  geom_histogram(bins = 17, aes(y = stat(density)), color = 'black', fill = 'white') +
  geom_vline(aes(xintercept = median(M_f)), linetype = 'dashed', size = 0.8, color = 'red') +
  labs (x = "Natural Mortality (M)", y = "Density") + xlim(0, 0.25)

p3 = ggplot(out$Priors, aes(x=h)) + 
  geom_histogram(bins = 17, aes(y = stat(density)), color = 'black', fill = 'white') +
  geom_vline(aes(xintercept = median(h)), linetype = 'dashed', size = 0.8, color = 'red') +
  labs (x = "Steepness", y = "Density") + xlim(0.2, 1)

p4 = ggplot(out$Priors, aes(x=Dep)) + 
  geom_histogram(bins = 17, aes(y = stat(density)), color = 'black', fill = 'white') +
  geom_vline(aes(xintercept = median(Dep)), linetype = 'dashed', size = 0.8, color = 'red') +
  labs (x = "Fraction Unfished", y = "Density") + xlim(0, 1)

pngfun(wd = file.path(dir, "_plots"), file = paste0(base, "_Priors_ggplot.png"), w = 7, h = 7, pt = 12)
grid.arrange(p1, p2, p3, p4, nrow = 2, ncol = 2)
dev.off()

pngfun(wd = file.path(dir, "_plots"), file = paste0(base, "_Priors.png"), w = 7, h = 7, pt = 12)
par(mfrow = c(2,2))
hist(m.f, xlab = "Natural Mortality (f)", main = "", xlim = c(0, 0.25))
abline(v = median(m.f), col = 'red', lwd = 3)
hist(m.m, xlab = "Natural Mortality (m)", main = "", xlim = c(0, 0.25))
abline(v = median(m.m), col = 'red', lwd = 3)
hist(h, xlab = "Steepness", main = "", xlim = c(0.20, 1))
abline(v = mean(h), col = 'red', lwd = 3)
hist(depl.prior, xlab = "Fraction Unfished", main = "", xlim = c(0,1))
abline(v = mean(depl.prior), col = 'red', lwd = 3)
dev.off()

pngfun(wd = file.path(dir, "_plots"), file = paste0(base, "_quants.png"), w = 7, h = 7, pt = 12)
par(mfrow = c(2,2))
plot(colnames(ssb)[1:ncol(ssb)-1], ssb[2,1:ncol(ssb)-1], ylim = c(0, max(ssb)), type = 'l', lwd = 2, 
	ylab = "Spawning output", xlab = "Year")
lines(colnames(ssb)[1:ncol(ssb)-1], ssb[1,1:ncol(ssb)-1], lty = 2)
lines(colnames(ssb)[1:ncol(ssb)-1], ssb[3,1:ncol(ssb)-1], lty = 2)
plot(colnames(depl)[1:ncol(depl)-1], depl[2,1:ncol(depl)-1], ylim = c(0, 1), type = 'l', lwd = 2,
	ylab = "Fraction unfished", xlab = "Year")
lines(colnames(depl)[1:ncol(depl)-1], depl[1,1:ncol(depl)-1], lty = 2)
lines(colnames(depl)[1:ncol(depl)-1], depl[3,1:ncol(depl)-1], lty = 2)
abline(h = 0.40, lty = 3, col = 'red')
abline(h = 0.25, lty = 3, col = 'red')
boxplot(ofl[,1:10], ylab = "OFL (mt)", xlab = "Year")
boxplot(abc[,1:10], ylab = "ABC (mt)", xlab = "Year")
dev.off()

final = "2021"
fore = "2023"
depl_year = "2021"

df = rbind(
	 ssb_unfished = c(ssb[2,1], ssb[1,1], ssb[3,1]),
	 ssb_final = c(ssb[2,final], ssb[1,final], ssb[3,final]),
	 depl_final = c(depl[2, final], depl[1, final], depl[3,final]),
	 ofl = c(ofl[2, fore], ofl[1, fore], ofl[3, fore]),
	 abc = c(abc[2, fore], abc[1, fore], abc[3, fore]))
df = round(df,2)

col_names = c("Median", "Lower Interval", "Upper Interval")
rownames(df) = c("SSB Unfished", paste("SSB", final), 
				 paste("Fraction Unfished", final), paste("OFL", fore), paste("ABC", fore))

t = table_format(x = df,
      caption = paste('Derived quantities from SSS based on assuming fraction unfished of', dep, 'percent in', final, "."),
      label = paste0("SSS_", dep),
      longtable = TRUE,
      font_size = 9,
      #digits = 3,
      landscape = FALSE,
      col_names = col_names,
      format.args = list(big.mark = ','))

kableExtra::save_kable(t,
file = paste0("C:/Assessments/2021/copper_rockfish_2021/write_up/wa/tex_tables/sss_", dep,".tex"))
