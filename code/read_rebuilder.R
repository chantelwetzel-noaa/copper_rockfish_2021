# Source in the res.csv reading function
source("C:/Assessments/2021/copper_rockfish_2021/code/get_values_rebuilder.R")

# Set the working directory where runs are located
rebuild_dir = "C:/Assessments/2021/copper_rockfish_2021/models/ca_s_pt_c/_rebuilder"

# Read in rebuilding options
reb_spr  <- get_values(rebuild_dir = file.path(rebuild_dir, "spr"))
reb_prob <- get_values(rebuild_dir = file.path(rebuild_dir, "prob"))


library(reshape2)
library(ggplot2)

YE.rb.probs<-read.csv("Probs.csv",header=T)
YE.rb.ct<-read.csv("Catches.csv",header=T)
YE.rb.sb<-read.csv("SB.csv",header=T)

#Probability Plots
probs_gg <-reshape2::melt(data = reb_spr$prob_matrix[,2:ncol(reb_spr$prob_matrix)])
colnames(probs_gg)<-c("Year", "Scenario", "Prob")
probs_gg[,"Year"] = rep(reb_spr$prob_matrix[,1], length(2:ncol(reb_spr$prob_matrix)))
find = which(probs_gg$Prob <=1.0 & probs_gg$Year <= (reb_spr$tmax + reb_spr$mean_gen))
ggplot2::ggplot(probs_gg[find,], aes(x = Year,y = Prob, color = Scenario)) + 
		geom_line(lwd = 1.5) + ylab("Prob SB > TRP")

#Catches
acl_gg <- reshape2::melt(reb_spr$acl_matrix[,2:ncol(reb_spr$acl_matrix)])
colnames(acl_gg)<-c("Year", "Scenario", "Catch")
acl_gg[,"Year"] = rep(reb_spr$acl_matrix[,1], length(2:ncol(reb_spr$acl_matrix)))
find = which(acl_gg$Year > 2023 & acl_gg$Year <= (reb_spr$tmax + reb_spr$mean_gen))
ggplot2::ggplot(acl_gg[find,], aes(x = Year, y = Catch, color = Scenario)) + 
		geom_line(lwd=1.5) + ylab("ACL Catches (mt)")

#Spawning output
sb_gg <- reshape2::melt(reb_spr$ssb_matrix[,2:ncol(reb_spr$ssb_matrix)])
colnames(sb_gg)<-c("Year","Scenario","SB")
sb_gg[,"Year"] = rep(reb_spr$ssb_matrix[,1], length(2:ncol(reb_spr$ssb_matrix)))
find = which(sb_gg$Year > 2023 & sb_gg$Year <= (reb_spr$tmax + reb_spr$mean_gen))
ggplot(sb_gg[find,], aes(x = Year, y = SB, color = Scenario)) + 
		geom_line(lwd = 1.5) + ylab("Spawning output")

