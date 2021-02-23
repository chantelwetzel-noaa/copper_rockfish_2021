library(r4ss)
or_wd = "C:/Assessments/2021/copper_rockfish_2021/models/or"
wa_wd = "C:/Assessments/2021/copper_rockfish_2021/models/wa"
both_wd = "C:/Assessments/2021/copper_rockfish_2021/models/or_wa"

model = "6.5_base_nodevs_dm"
or_determ = SS_output(file.path(or_wd, model))

model = "7.7_base"
wa_determ = SS_output(file.path(wa_wd, model))

model = "2.2.2020_no_devs_asym_com"
both_determ = SS_output(file.path(both_wd, model))

model = "2.2.2020_no_devs_asym_com_dm"
both_determ_dm = SS_output(file.path(both_wd, model))

modelnames <- c( "Both - Francis",
				 "Both - DM",
				 "OR",
				 "WA")
mysummary  <- SSsummarize(list(both_determ, both_determ_dm, or_determ, wa_determ))
SSplotComparisons(mysummary, 
				  filenameprefix = "Compare_",
				  legendlabels = modelnames, 
				  plotdir = file.path(both_wd),
				  pdf = TRUE)


model = "6.5_base"
or = SS_output(file.path(or_wd, model))

model = "7.7_base"
wa_determ = SS_output(file.path(wa_wd, model))

model = "2.2.2020"
both = SS_output(file.path(both_wd, model))

model = "2.2.2020_no_devs_asym_com_dm"
both_determ_dm = SS_output(file.path(both_wd, model))

modelnames <- c( "Both",
				 "Both - Determine",
				 "OR Base",
				 "WA Base")
mysummary  <- SSsummarize(list(both, both_determ_dm, or, wa_determ))
SSplotComparisons(mysummary, 
				  filenameprefix = "Compare_",
				  legendlabels = modelnames, 
				  plotdir = file.path(both_wd),
				  pdf = TRUE)

