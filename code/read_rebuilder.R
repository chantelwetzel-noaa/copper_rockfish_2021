# Load packages
library(r4ss)
library(reshape2)
library(ggplot2)

# Source in the res.csv reading function
source("C:/Assessments/2021/copper_rockfish_2021/code/get_values_rebuilder.R")

# Set the working directory where runs are located
rebuild_dir = "C:/Assessments/2021/copper_rockfish_2021/models/ca_s_pt_c/_rebuilder"

# Create a rebuilding that incorporates uncertainity around R0
# make a table of the 3 states of nature with information about each one
# Code stolen from 2011 yelloweye rockfish rebuilder analysis
statetable <- data.frame(iR0=rep(NA, 3), R0=rep(NA,3), dir=rep(NA,3), weight = rep(NA,3),weight_frac=rep(NA,3))
st_dir = file.path(rebuild_dir, "states_of_nature")
n <- 1
for(iR0 in 1:length(dir(st_dir))){
    mydir <- file.path(st_dir, dir(st_dir)[iR0])
    # set index and text for steepness
    statetable$iR0[n] <- iR0
    statetable$R0[n] <- c("mle","high", "low")[iR0]
    # set directory where files are located
    statetable$dir[n] <- mydir
    # set weighting of 1, 2, or 4
    statetable$weight[n] <- c(2, 1, 1)[iR0]
    statetable$weight_frac[n] <- c(0.50, 0.25, 0.25)[iR0]
    n <- n+1
}

rebuildblend <- NULL
for(i in 1:nrow(statetable)){
  # read rebuild.sso from directories
  rebuildlines <- readLines(paste(statetable$dir[i],"/rebuild.sso",sep=""))
  # take only final section of this file
  # (because file doesn't get deleted when model is rerun and may contain out-of-date values)
  rebuildlines <- rebuildlines[max(1+grep("in maximization mode",rebuildlines)):length(rebuildlines)]
  # print first line to confirm that it looks like some numbers
  print(rebuildlines[1])
  for(j in 1:statetable$weight[i]){
  	header <- c(paste("# values from ",statetable$dir[i],sep=""),
  	            paste("# this is state of nature ",i," out of ",3," (in no particular order)",sep=""),
  	            paste("# and parameter set number ", j, " out of ", statetable$weight[i], sep=""))
  	# can only have 1 header line, must collapse header into 1 line
  	header <- paste(header, collapse=" ")
  	# concatenate new header and lines to existing stuff
  	rebuildblend <- c(rebuildblend, header, rebuildlines)  	
  }
}

# write resulting file
writeLines(rebuildblend, file.path(rebuild_dir, "rebuildblend.sso")))

setwd(file.path(rebuild_dir, 'states_of_nature'))
dirs <- dir()
states <- r4ss::SSgetoutput(dirvec = paste(getwd(), dirs, sep = "/"), getcovar = FALSE)
summaries <- r4ss::SSsummarize(states)

# Double check that the rebuildblend file appears to have the correct values from the state of nature models
a1 <- unique(sort(as.numeric(substring(rebuildblend[grep("#R0", rebuildblend, fixed = TRUE) + 1], 1, 3))))
# a2 is subset of summaries of 9 models with 1916 recruitment (first year after equilbrium for yelloweye)
a2 <- floor(sort(as.numeric(summaries$recruits[summaries$recruits$Yr==1914,1:3])))
# difference between sorted, unique values to check for something out of place
a1-a2

# Now run the rebuilder using the "rebuild_r0_states_2021.dat" by entering into the 
# rebuild.dat file under the "# File with multiple parameter vectors " section

# Read in rebuilding options
#run <- c(
#		 "spr_fine_step_no_abc_max",
#		 "spr_fine_step_no_abc_max_50mt_21_22",
#		 "year_no_abc_max",
#		 "spr_fine_step",
#		 "spr_no_abc_max")#,
		 #"spr_fine_step_50mt_21_22")
run <- c("spr", "spr_high", "spr_fine_step")
reb <- list()
for(a in 1:length(run)){
	reb[[a]]  <- get_values(rebuild_dir = file.path(rebuild_dir, run[[a]]))	
}


# This function currently works to create figures but could use so refinement
# None of the below figures were included in the final document
r4ss::DoProjectPlots(
	dirn = reb[[1]]$loc, 
	fileN = "RES.CSV",
	ncols = 200,
	Outlines = c(2, 2),
	OutlineMulti = c(2,3),
	pdf = TRUE)

stuff <- r4ss::DoProjectPlots(dirn = reb[[1]]$loc, 
	fileN = "RES.CSV",
	ncols = 200,, Plots = 4)


# Here is some modified code that does the cummalative figures in a nice way using 
# ggplot
# Loop over the length of runs in the reb list object

#run <- c("spr_fine_step_no_abc_max",
#		 "spr_fine_step")

# Franken-the results to deal with the ABC Rule
reb[[1]]$prob_matrix = cbind(reb[[1]]$prob_matrix[,1:9], reb[[4]]$prob_matrix[,10], reb[[3]]$prob_matrix[,2:6])
reb[[1]]$acl_matrix = cbind(reb[[1]]$acl_matrix[,1:9], reb[[4]]$acl_matrix[,10], reb[[3]]$acl_matrix[,2:6])
reb[[1]]$ofl_matrix = cbind(reb[[1]]$ofl_matrix[,1:9], reb[[4]]$ofl_matrix[,10], reb[[3]]$ofl_matrix[,2:6])
reb[[1]]$ssb_matrix = cbind(reb[[1]]$ssb_matrix[,1:9], reb[[4]]$ssb_matrix[,10], reb[[3]]$ssb_matrix[,2:6])
reb[[1]]$relativeb_matrix = cbind(reb[[1]]$relativeb_matrix[,1:9], reb[[2]]$relativeb_matrix[,10], reb[[3]]$relativeb_matrix[,2:6])

reb[[1]]$prob_matrix = cbind(reb[[1]]$prob_matrix[,1:9], reb[[2]]$prob_matrix[,2:6])
reb[[1]]$acl_matrix = cbind(reb[[1]]$acl_matrix[,1:9],   reb[[2]]$acl_matrix[,2:6])
reb[[1]]$ofl_matrix = cbind(reb[[1]]$ofl_matrix[,1:9],   reb[[2]]$ofl_matrix[,2:6])
reb[[1]]$ssb_matrix = cbind(reb[[1]]$ssb_matrix[,1:9],   reb[[2]]$ssb_matrix[,2:6])
reb[[1]]$relativeb_matrix = cbind(reb[[1]]$relativeb_matrix[,1:9], reb[[2]]$relativeb_matrix[,2:6])



colnames(reb[[1]]$prob_matrix)[10] = colnames(reb[[1]]$acl_matrix)[10]  = colnames(reb[[1]]$ssb_matrix)[10]  = colnames(reb[[1]]$relativeb_matrix)[10]  = "ABC Rule" 
#colnames(reb[[1]]$prob_matrix)[11:16] = colnames(reb[[1]]$acl_matrix)[11:16]  = colnames(reb[[1]]$ssb_matrix)[11:16]  = colnames(reb[[1]]$relativeb_matrix)[11:16]  = colnames(reb[[3]]$prob_matrix)[2:6])

type = "single"
type = 'binded'

for (a in 1:length(run)){
	x = reb[[a]]

	#Probability Plots
	probs_gg <-reshape2::melt(data = x$prob_matrix[,2:ncol(x$prob_matrix)])
	colnames(probs_gg)<-c("Year", "Scenario", "Prob")
	probs_gg[,"Year"] = rep(x$prob_matrix[,1], length(2:ncol(x$prob_matrix)))
	find = which(probs_gg$Prob <=1.0 & probs_gg$Year <= (x$tmax + 3*x$mean_gen))
	ggplot2::ggplot(probs_gg[find,], aes(x = Year,y = Prob, color = Scenario)) + 
			geom_line(lwd = 1.5) + ylab("Probability Relative Spawning Output > 40% Spawning Output")
	ggsave(file.path(x$loc, paste0("rebuilding_probability_", type, ".png")), width = 10, height = 7)
	
	#Catches
	acl_gg <- reshape2::melt(x$acl_matrix[,2:ncol(x$acl_matrix)])
	colnames(acl_gg)<-c("Year", "Scenario", "Catch")
	acl_gg[,"Year"] = rep(x$acl_matrix[,1], length(2:ncol(x$acl_matrix)))
	find = which(acl_gg$Year > 2023 & acl_gg$Year <= (x$tmax + 3*x$mean_gen))
	ggplot2::ggplot(acl_gg[find,], aes(x = Year, y = Catch, color = Scenario)) + 
			geom_line(lwd=1.5) + ylab("Catches (mt)")
	ggsave(file.path(x$loc, paste0("rebuilding_acl_", type, ".png")), width = 10, height = 7)
	
	
	#Spawning output
	sb_gg <- reshape2::melt(x$ssb_matrix[,2:ncol(x$ssb_matrix)])
	colnames(sb_gg)<-c("Year","Scenario","SB")
	sb_gg[,"Year"] = rep(x$ssb_matrix[,1], length(2:ncol(x$ssb_matrix)))
	find = which(sb_gg$Year > 2023 & sb_gg$Year <= (x$tmax + 3*x$mean_gen))
	ggplot(sb_gg[find,], aes(x = Year, y = SB, color = Scenario)) + 
			geom_line(lwd = 1.5) + ylab("Spawning output")
	ggsave(file.path(x$loc, paste0("rebuilding_ssb_", type, ".png")), width = 10, height = 7)


	#Spawning output relative to the target
	sb_gg <- reshape2::melt(x$relativeb_matrix[,2:ncol(x$relativeb_matrix)])
	colnames(sb_gg)<-c("Year","Scenario","SB")
	sb_gg[,"Year"] = rep(x$relativeb_matrix[,1], length(2:ncol(x$relativeb_matrix)))
	find = which(sb_gg$Year > 2023 & sb_gg$Year <= (x$tmax + 3*x$mean_gen))
	ggplot(sb_gg[find,], aes(x = Year, y = SB, color = Scenario)) + 
			geom_line(lwd = 1.5) + 
			geom_hline(yintercept=1, linetype="dashed", color = "grey", size=1) + 
			ylab("Spawning output relative to 40% spawning output")
	ggsave(file.path(x$loc, paste0("rebuilding_relative_sb_", type, ".png")), width = 10, height = 7)

}


years = 2021:2220
sigma = 1.0
pstar = 0.45
	y = 1:(length(years) - 1)
	r = 0.075 # the rate of change in sigma approved by the SSC
	# This is the equation for the rate of change in sigma
	sigma_calc =  c(sigma, sigma * (1+(y-1)*r))
	buffer = exp(stats::qnorm(pstar, 0, sigma_calc))
	# Set the buffer for fixed catch years to 1.0
	buffer[1:2] = 1
	out = cbind(years, round(buffer, 3))


