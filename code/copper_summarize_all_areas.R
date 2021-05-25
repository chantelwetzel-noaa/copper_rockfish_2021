######################################################
#
#		Create summary figures across areas
#
######################################################
library(r4ss)
wd = file.path("C:/Assessments/2021/copper_rockfish_2021/models/")

south  = SS_output(file.path(wd, "ca_s_pt_c", "12.1_base"))
north  = SS_output(file.path(wd, "ca_n_pt_c", "10.2_base"))
oregon = SS_output(file.path(wd, "or", "10.5_base"))
wash   = SS_output(file.path(wd, "wa", "7.7_base"))

modelnames <- c("CA: South of Point Conception",
				"CA: North of Point Conception",
				"Oregon", "Washington")

x <- SSsummarize(list(south, north, oregon, wash))

SSplotComparisons(x, endyrvec = 2021, 
                  legendlabels = modelnames, 
                  ylimAdj = 1,
                  plotdir = file.path(wd, '_plots'), 
                  legendloc = "topright", 
                  filenameprefix = "comprare_",
                  subplot = 4, 
                  print = TRUE, 
                  pdf = FALSE)

modelnames <- c("CA: South of Point Conception",
				"CA: North of Point Conception")

x <- SSsummarize(list(south, north))

SSplotComparisons(x, endyrvec = 2021, 
                  legendlabels = modelnames, 
                  ylimAdj = 1,
                  plotdir = file.path(wd, '_plots'), 
                  legendloc = "topright", 
                  filenameprefix = "ca_comprare_",
                  subplot = 2, 
                  print = TRUE, 
                  pdf = FALSE)

modelnames <- c(
				"Oregon", "Washington")

x <- SSsummarize(list(oregon, wash))


SSplotComparisons(x, endyrvec = 2021, 
                  legendlabels = modelnames, 
                  ylimAdj = 1,
                  plotdir = file.path(wd, '_plots'), 
                  legendloc = "topright", 
                  filenameprefix = "or_wa_comprare_",
                  subplot = 2, 
                  print = TRUE, 
                  pdf = FALSE)