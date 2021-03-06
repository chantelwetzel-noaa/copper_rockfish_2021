#################################################################################################
#  Code to do Plots and Diagnostics for Retrospective Runs
#  Grab all the results 
#################################################################################################

library(r4ss)

state = "ca"
mydir = "C:/Assessments/2021/copper_rockfish_2021/models/ca"
base_name = "2.1_south_growth_no_hkl"

dir = file.path("C:/Assessments/2021/copper_rockfish_2021/models", state)
retro.folder = file.path("C:/Assessments/2021/copper_rockfish_2021/models",
                state, 
                paste0(base_name, "_retro"))

base   = SS_output(file.path(dir, base_name), printstats = FALSE, verbose = FALSE, covar = FALSE)
retro1 = SS_output(file.path(retro.folder, "retro", "retro-1"), printstats = FALSE, verbose = FALSE, covar = FALSE)
retro2 = SS_output(file.path(retro.folder, "retro", "retro-2"), printstats = FALSE, verbose = FALSE, covar = FALSE)
retro3 = SS_output(file.path(retro.folder, "retro", "retro-3"), printstats = FALSE, verbose = FALSE, covar = FALSE)
retro4 = SS_output(file.path(retro.folder, "retro", "retro-4"), printstats = FALSE, verbose = FALSE, covar = FALSE)
retro5 = SS_output(file.path(retro.folder, "retro", "retro-5"), printstats = FALSE, verbose = FALSE, covar = FALSE)
retro6 = SS_output(file.path(retro.folder, "retro", "retro-6"), printstats = FALSE, verbose = FALSE, covar = FALSE)
retro7 = SS_output(file.path(retro.folder, "retro", "retro-7"), printstats = FALSE, verbose = FALSE, covar = FALSE)
retro8 = SS_output(file.path(retro.folder, "retro", "retro-8"), printstats = FALSE, verbose = FALSE, covar = FALSE)
retro9 = SS_output(file.path(retro.folder, "retro", "retro-9"), printstats = FALSE, verbose = FALSE, covar = FALSE)
retro10 = SS_output(file.path(retro.folder, "retro", "retro-10"), printstats = FALSE, verbose = FALSE, covar = FALSE)
retro11 = SS_output(file.path(retro.folder, "retro", "retro-11"), printstats = FALSE, verbose = FALSE, covar = FALSE)
retro12 = SS_output(file.path(retro.folder, "retro", "retro-12"), printstats = FALSE, verbose = FALSE, covar = FALSE)
retro13 = SS_output(file.path(retro.folder, "retro", "retro-13"), printstats = FALSE, verbose = FALSE, covar = FALSE)
retro14 = SS_output(file.path(retro.folder, "retro", "retro-14"), printstats = FALSE, verbose = FALSE, covar = FALSE)
retro15 = SS_output(file.path(retro.folder, "retro", "retro-15"), printstats = FALSE, verbose = FALSE, covar = FALSE)
retro16 = SS_output(file.path(retro.folder, "retro", "retro-16"), printstats = FALSE, verbose = FALSE, covar = FALSE)
retro17 = SS_output(file.path(retro.folder, "retro", "retro-17"), printstats = FALSE, verbose = FALSE, covar = FALSE)
retro18 = SS_output(file.path(retro.folder, "retro", "retro-18"), printstats = FALSE, verbose = FALSE, covar = FALSE)
retro19 = SS_output(file.path(retro.folder, "retro", "retro-19"), printstats = FALSE, verbose = FALSE, covar = FALSE)
retro20 = SS_output(file.path(retro.folder, "retro", "retro-20"), printstats = FALSE, verbose = FALSE, covar = FALSE)


modelnames <- c("Base Model", paste0("Retro -", 1:20))

# Summarize the results across models
mysummary <- SSsummarize(list(base, retro1, retro2, retro3, retro4, retro5,
                              retro6, retro7, retro8, retro9, retro10,
                              retro11, retro12, retro13, retro14, retro15,
                              retro16, retro17, retro18, retro19, retro20))
# Create plots and save as png files
SSplotComparisons(mysummary, endyrvec = rev(2000:2021), legendlabels = modelnames,
    filenameprefix = paste0(base_name, "_20_yrs_"), 
    plotdir = retro.folder, subplot = seq(2, 4), legendloc = "topright", print = TRUE, pdf = FALSE)
SSplotComparisons(mysummary, endyrvec = rev(2000:2021), legendlabels = modelnames, 
    filenameprefix = paste0(base_name, "_20_yrs_"), 
    plotdir = retro.folder, legendloc = "bottomleft", subplot = c(10,12), print = TRUE, pdf = FALSE)

# Tables
x = mysummary
ii = 1:length(modelnames)
n = length(modelnames)
out<- matrix(NA, 16, max(ii))

out = rbind(
            as.numeric(x$likelihoods[x$likelihoods$Label == "TOTAL",1:n]), 
            as.numeric(x$likelihoods[x$likelihoods$Label == "Survey",1:n]), 
            as.numeric(x$likelihoods[x$likelihoods$Label == "Length_comp",1:n]),
            as.numeric(x$likelihoods[x$likelihoods$Label == "Recruitment",1:n]), 
            as.numeric(x$likelihoods[x$likelihoods$Label == "Forecast_Recruitment",1:n]),
            as.numeric(x$likelihoods[x$likelihoods$Label == "Parm_priors",1:n]),
            as.numeric(x$pars[x$pars$Label == "SR_LN(R0)", 1:n]), 
            as.numeric(x$SpawnBio[x$SpawnBio$Label == "SSB_Virgin", 1:n]),
            as.numeric(x$SpawnBio[x$SpawnBio$Label == "SSB_2021", 1:n]),
            as.numeric(x$Bratio[x$Bratio$Label == "Bratio_2021", 1:n]), 
            as.numeric(x$quants[x$quants$Label == "Dead_Catch_SPR", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_peak_CA_N_Commercial(1)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_end_logit_CA_N_Commercial(1)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_peak_CA_N_Recreational(2)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_end_logit_CA_N_Recreational(2)", 1:n]),
            as.numeric(x$pars[x$pars$Label == "Size_DblN_peak_CA_N_Commercial(1)_BLK1repl_1916", 1:n]))  

out = as.data.frame(out)
colnames(out) = modelnames
rownames(out) = c("Total Likelihood",
                  "Survey Likelihood",
                  "Length Likelihood",
                  "Recruitment Likelihood",
                  "Forecast Recruitment Likelihood",
                  "Parameter Priors Likelihood",
                  "log(R0)",
                  "SB Virgin",
                  "SB 2020",
                  "Fraction Unfished 2021",
                  "Total Yield - SPR 50",
                  "Com Peak",
                  "Com Final", 
                  "Rec Peak", 
                  "Rec Final",
                  "Com Peak Early")


write.csv(out, file = file.path(retro.folder, paste0(base_name, "_retros.csv")))







mohns = SSmohnsrho(summaryoutput = mysummary,
           endyrvec = rev(2006:2021),
           startyr = 2006,
           verbose = TRUE)
write.csv(mohns, file = file.path(dir, paste0(base_name, "_retro"), "mohns.csv"))


sb = mysummary$SpawnBio
depl = mysummary$Bratio
recr = mysummary$recruits

pngfun <- function(wd, file,w=7,h=7,pt=12){
  file <- file.path(wd, file)
  cat('writing PNG to',file,'\n')
  png(filename=file,
      width=w,height=h,
      units='in',res=300,pointsize=pt)
}

n = 10
sb.rho = (sb[,1:n] - sb[,1]) / sb[,1]
sb.rho = cbind(sb$Yr, sb.rho)
colnames(sb.rho) = c("Yr", colnames(sb.rho)[2:n])

depl.rho = (depl[,1:n] - depl[,1]) / depl[,1]
depl.rho = cbind(depl$Yr, depl.rho)
colnames(depl.rho) = c("Yr", colnames(depl.rho)[2:n])

recr.rho = (recr[,1:n] - recr[,1]) / recr[,1]
recr.rho = cbind(recr$Yr, recr.rho)
colnames(recr.rho) = c("Yr", colnames(recr.rho)[2:n])


cols = c('pink', "yellow", "orange",  "red","green", "blue")
cols = rich.colors.short(16)
ymax = 0.75
ymin = -0.75
endyr = rev(2006:2021)

xstart = 1950

pngfun(wd = retro.folder, file = "Mohs.png", h = 12, w = 7)
par(mfrow = c(3, 1))
find = which(sb.rho$Yr ==xstart | sb.rho$Yr == endyr[1])
plot(sb.rho[find[1]:find[2],1], sb.rho[find[1]:find[2],1], ylim = c(ymin, ymax), col = cols[1], ylab = "SB Relative Error", xlab = "Year", lwd = 2)
abline(h = 0, lty = 2)
for(a in 2:length(endyr)){
  find = which(sb.rho$Yr ==xstart | sb.rho$Yr == endyr[a])
  lines(sb.rho[find[1]:find[2], 1], sb.rho[find[1]:find[2], a+1], col = cols[a], lwd = 2)
}
mtext(side = 3, paste0("Mohn's Rho = ", round(mohns$AFSC_Hurtado_SSB,3)) ) 
#legend("topleft", legend = c("Retro -1", "Retro -2", "Retro -3", "Retro -4", "Retro -5"), col = cols[2:length(endyr)], lty =1, lwd =2, bty = 'n')

find = which(depl.rho$Yr ==xstart | depl.rho$Yr == endyr[1])
plot(depl.rho[find[1]:find[2],1], depl.rho[find[1]:find[2],1], ylim = c(ymin, ymax), col = cols[1], ylab = "Relative Unfished Relative Error", xlab = "Year", lwd = 2)
abline(h = 0, lty = 2)
for(a in 2:length(endyr)){
  find = which(depl.rho$Yr ==xstart | depl.rho$Yr == endyr[a])
  lines(depl.rho[find[1]:find[2], 1], depl.rho[find[1]:find[2], a+1], col = cols[a], lwd = 2)
}
mtext(side = 3, paste0("Mohn's Rho = ", round(mohns$AFSC_Hurtado_Bratio,3)) ) 
#legend("topleft", legend = c("Retro -1", "Retro -2", "Retro -3", "Retro -4", "Retro -5"), col = cols[2:length(endyr)], lty =1, lwd =2, bty = 'n')

ymax = 0.75
ymin = -0.75
find = which(recr.rho$Yr ==xstart | recr.rho$Yr == endyr[1])
plot(recr.rho[find[1]:find[2],1], recr.rho[find[1]:find[2],1], ylim = c(ymin, ymax), col = cols[1], ylab = "Relative Recruitment Error", xlab = "Year", lwd = 2)
abline(h = 0, lty = 2)
for(a in 2:length(endyr)){
  find = which(recr.rho$Yr ==xstart | recr.rho$Yr == endyr[a])
  lines(recr.rho[find[1]:find[2], 1], recr.rho[find[1]:find[2], a+1], col = cols[a], lwd = 2)
}
mtext(side = 3, paste0("Mohn's Rho = ", round(mohns$AFSC_Hurtado_Rec,3)) ) 
#legend("topleft", legend = c("Retro -1", "Retro -2", "Retro -3", "Retro -4", "Retro -5"), col = cols[2:length(endyr)], lty =1, lwd =2, bty = 'n')

dev.off()


##################################################################
# Squid Plot
##################################################################

pngfun(wd = retro.folder, file = "Squid_RecDevs.png", h = 7, w = 7)
SSplotRetroRecruits(retroSummary = mysummary,
                    endyrvec = rev(2000:2021),
                    cohorts = 1995:2019,
                    ylim=NULL,uncertainty=FALSE,
                    labels=c('Recruitment deviation', 'Recruitment (billions)', 'relative to recent estimate', 'Age'),
                    main="",
                    mcmcVec=FALSE,devs=TRUE,
                    relative=FALSE,labelyears=TRUE,legend=FALSE,leg.ncols=4)
dev.off()