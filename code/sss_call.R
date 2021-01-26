############################################################
# EXAMPLE RUN SSS
############################################################
# load the library

devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/SSS/SSS")
install.packages(c("tmvtnorm", "msm", "EnvStats"))

# Assume a Beverton-Holt Stock Recruit relationship
# define the directory
Dir.in <-"C:/Assessments/2021/copper_rockfish_2021/models/sss/wa_7.0_base"

SSS.BH <- SSS(filepath= Dir.in, # location to run the model
              file.name=c("2021_wa_copper.dat","2021_wa_copper.ctl"), # data and ctl file names
              reps = 1000, # number of model runs
              seed.in = 19, # seed number
              Dep.in = c(2, 0.60, 0.15), # c(distribution shape, mean, sd)
              M.in = c(3, 0.108, 0.24, 3, 0.108, 0.24), # c(distribution shape for females, mean for females, sd for females, distribution shape for males, mean for males, sd for males)
              h.in = c(2, 0.72, 0.09), # c(distribution, mean, sd)
              R_start = c(0, 3), # c( switch option, input value)
              ts_yrs = c(1935, 2020),
              sexes = TRUE)  # unique male and female M

