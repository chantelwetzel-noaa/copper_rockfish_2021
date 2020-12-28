######################################################################
#
#     Code to Modify Files for Sensitivities
#
#		         Copper Rockfish 2021
#
######################################################################

library(r4ss)
wd = "C:/Assessments/2021/copper_rockfish_2021/models"

# Washington ==============================================
area = "wa"
base.model = "7.0_base"
sens.folder = "_sensitivities"
indir = file.path(wd, area, sens.folder)

m_low = 0.097
m_hi = 0.119
linf_f_low = 47.2
linf_m_low = 45.7
linf_f_hi = 52.2
linf_m_hi = 50.5

exist.files = dir(indir, pattern = base.model)
day = Sys.Date()

# If there are sensitivity runs with the same base model, copy and move these folders
if(length(exist.files) > 0){
	archive = paste0(wd, sens.folder, "/_", day)
	dir.create(archive)
	for(i in 1:length(exist.files)) { 
		old.loc = paste0(wd, sens.folder, "/", exist.files[i])
		new.loc = paste0(archive, "/")
		file.copy(old.loc, new.loc, recursive = TRUE)
	}

	for(i in 1:length(exist.files)) {
		old.loc = paste0(wd, sens.folder, "/", exist.files[i])
		unlink(old.loc, recursive=TRUE)
	}
}

removevarpars <- function(file.in, file.out = NULL, removefactor) {
  reg <- paste(paste0("^\\s*", removefactor), collapse = "|")
  ctl <- readLines(file.in)
  ii <- grep("Variance", ctl, ignore.case = TRUE)
  while (grepl("\\s*#", ctl[ii])) ii <- ii + 1
  while (!grepl("\\s*-999", ctl[ii])) {
    if (grepl(reg, ctl[ii])) {
      ctl <- ctl[-ii]
    } else {ii <- ii + 1}
  }
  if (!is.null(file.out)) writeLines(ctl, file.out)
  invisible(ctl)
}

###############################################################################################
# Low natural mortality sensitivity
sens.name = file.path(indir, paste0(base.model,"_low_m"))
newctl = paste0("2021_", area, "_copper_low_m.ctl")

file.copy(file.path(wd, area, base.model), indir, recursive = TRUE)
file.rename(file.path(indir, base.model),  sens.name)

#Change the m value
setwd(sens.name)
SS_changepars(ctlfile = paste0("2021_", area, "_copper.ctl"), 
              newctlfile = newctl, 
              strings = c("NatM_p_1_Fem_GP_1","NatM_p_1_Mal_GP_1"), 
              newvals = c(m_low, m_low), 
              estimate = c(FALSE, FALSE))
starter = SS_readstarter("starter.ss")
starter$ctlfile = newctl
starter$init_values_src = 0
SS_writestarter(starter, overwrite = TRUE)
system("ss -nohess")

###############################################################################################
# High natural mortality sensitivity
sens.name = file.path(indir, paste0(base.model,"_high_m"))
newctl = paste0("2021_", area, "_copper_high_m.ctl")

file.copy(file.path(wd, area, base.model), indir, recursive = TRUE)
file.rename(file.path(indir, base.model),  sens.name)

#Change the female m value
setwd(sens.name)
SS_changepars(ctlfile = paste0("2021_", area, "_copper.ctl"), 
              newctlfile = newctl, 
			        strings = c("NatM_p_1_Fem_GP_1","NatM_p_1_Mal_GP_1"), 
              newvals = c(m_hi, m_hi), estimate = c(FALSE, FALSE))

starter = SS_readstarter("starter.ss")
starter$ctlfile = newctl
starter$init_values_src = 0
SS_writestarter(starter, overwrite = TRUE)
system("ss -nohess")

###############################################################################################
# Maximum Length - Low
sens.name = file.path(indir, paste0(base.model,"_linf_low"))
newctl = paste0("2021_", area, "_copper_low_linf.ctl")

file.copy(file.path(wd, area, base.model), indir, recursive = TRUE)
file.rename(file.path(indir, base.model),  sens.name)

setwd(sens.name)
SS_changepars(ctlfile = paste0("2021_", area, "_copper.ctl"), 
        newctlfile = newctl, 
			  strings = c("L_at_Amax_Fem_GP_1", "L_at_Amax_Mal_GP_1"), 
			  newvals = c(linf_f_low, linf_m_low), estimate = c(FALSE, FALSE))
starter = SS_readstarter("starter.ss")
starter$ctlfile = newctl
SS_writestarter(starter, overwrite = TRUE)
system("ss -nohess")

###############################################################################################
# Maximum Length - High
sens.name = file.path(indir, paste0(base.model,"_linf_hi"))
newctl = paste0("2021_", area, "_copper_hi_linf.ctl")

file.copy(file.path(wd, area, base.model), indir, recursive = TRUE)
file.rename(file.path(indir, base.model),  sens.name)

setwd(sens.name)
SS_changepars(ctlfile = paste0("2021_", area, "_copper.ctl"), 
        newctlfile = newctl, 
			  strings = c("L_at_Amax_Fem_GP_1", "L_at_Amax_Mal_GP_1"), 
			  newval = c(linf_f_hi, linf_m_hi), estimate = c(FALSE, FALSE))
starter = SS_readstarter("starter.ss")
starter$ctlfile = newctl
SS_writestarter(starter, overwrite = TRUE)
system("ss -nohess")

###############################################################################################
# Run Rec Devs

sens.name = file.path(indir, paste0(base.model,"_recdevs"))
newctl = paste0("2021_", area, "_copper_recdevs.ctl")

file.copy(file.path(wd, area, base.model), indir, recursive = TRUE)
file.rename(file.path(indir, base.model),  sens.name)


###############################################################################################
# Dirichlet Weights
sens.name = file.path(indir, paste0(base.model,"_dirichlet"))
newctl = paste0("2021_", area, "_copper_dirichlet.ctl")
newdat = paste0("2021_", area, "_copper_dirichlet.dat")

file.copy(file.path(wd, area, base.model), indir, recursive = TRUE)
file.rename(file.path(indir, base.model),  sens.name)

setwd(sens.name)
file.copy(paste0("2021_", area, "_copper.ctl"), newctl)
file.copy(paste0("2021_", area, "_copper.dat"), newdat)

starter = SS_readstarter("starter.ss")
starter$ctlfile = newctl
starter$datfile = newdat
SS_writestarter(starter, overwrite = TRUE)

###############################################################################################
# Francis Weights
sens.name = file.path(indir, paste0(base.model,"_francis"))
newctl = paste0("2021_", area, "_copper_francis.ctl")

file.copy(file.path(wd, area, base.model), indir, recursive = TRUE)
file.rename(file.path(indir, base.model),  sens.name)

setwd(sens.name)
file.copy(paste0("2021_", area, "_copper.ctl"), newctl)

system("ss -nohess")

rep = SS_output(sens.name)
tune = SS_tune_comps(replist = rep, option = "Francis", digits = 4)
ctl <- readLines(newctl)

start <- grep("Factor", ctl)
end <- grep("-9999", ctl)
end <- end[end > start][1]
new.ctl.lines <- c(ctl[1:start],
                   apply(tune, 1, FUN = paste, collapse = " "),
                   ctl[end:length(ctl)])
writeLines(new.ctl.lines, newctl)
starter = SS_readstarter("starter.ss")
starter$ctlfile = newctl
SS_writestarter(starter, overwrite = TRUE)
system("ss -nohess")

###############################################################################################
# MI Weights
sens.name = file.path(indir, paste0(base.model,"_mi"))
newctl = paste0("2021_", area, "_copper_francis.ctl")

file.copy(file.path(wd, area, base.model), indir, recursive = TRUE)
file.rename(file.path(indir, base.model),  sens.name)

setwd(sens.name)
file.copy(paste0("2021_", area, "_copper.ctl"), newctl)
#system("ss -nohess")

rep = SS_output(sens.name)
tune = SS_tune_comps(replist = rep, option = "MI", digits = 4)
ctl <- readLines(newctl)

start <- grep("Factor", ctl)
end <- grep("-9999", ctl)
end <- end[end > start][1]
new.ctl.lines <- c(ctl[1:start],
                   apply(tune, 1, FUN = paste, collapse = " "),
                   ctl[end:length(ctl)])
writeLines(new.ctl.lines, newctl)
starter = SS_readstarter("starter.ss")
starter$ctlfile = newctl
SS_writestarter(starter, overwrite = TRUE)
system("ss -nohess")

###############################################################################################
# Platoons
sens.name = file.path(indir, paste0(base.model,"_platoons"))
newctl = paste0("2021_", area, "_copper_platoons.ctl")

file.copy(file.path(wd, area, base.model), indir, recursive = TRUE)
file.rename(file.path(indir, base.model),  sens.name)

setwd(sens.name)
file.copy(paste0("2021_", area, "_copper.ctl"), newctl)

ctl <- readLines(newctl)
start <- grep("N_Growth_Patterns", ctl)
end <- grep("recr_dist", ctl)
end <- end[end > start][1]
new.ctl.lines <- c(ctl[1:start],
                   paste0(paste(5, "# N_platoons"), collapse = " "),
                   paste0(paste(0.7, "# morph stdev"), collapse = " "),
                   paste0(paste(-1, 0.25, 0.5, 0.25, 0.125, "# vector"), collapse = " "),
                   ctl[end:length(ctl)])

writeLines(new.ctl.lines, newctl)
starter = SS_readstarter("starter.ss")
starter$ctlfile = newctl
SS_writestarter(starter, overwrite = TRUE)
system("ss -nohess")