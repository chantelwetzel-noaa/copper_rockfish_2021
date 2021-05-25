library(sa4ss)

setwd("C:/Assessments/2021/copper_rockfish_2021/write_up/s_ca")

load("00mod.Rdata")
save_loc = file.path(getwd(), "tex_tables")


##########################################################################################
# Let's create index tables
##########################################################################################
names =  unique(model$cpue[,"Fleet_name"])

i = 1
grab = model$cpue[model$cpue$Fleet_name == names[i], c("Obs", "SE_input") ]
survey.list = data.frame(Year = model$cpue[model$cpue$Fleet_name == names[i], "Yr" ],
						 Obs = grab$Obs,
						 SE = grab$SE_input)

colnames(survey.list) = c("Year", "Obs", "SE_input")

t = table_format(x = survey.list,
       caption = "Summary of the NWFSC Hook and Line relative biomass/abundance time series observartions (Obs.) and input standard error (SE) used in the stock assessment.",
       label = "hkl-index",
       align = 'l')

kableExtra::save_kable(t,
					   file = file.path(save_loc, paste0('hkl_index.tex')))
