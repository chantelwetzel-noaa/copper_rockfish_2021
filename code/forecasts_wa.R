
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/r4ss")
source("C:/Users/Chantel.Wetzel/Documents/GitHub/PEPtools/R/solve_numbers.R")

base_name = "7.6_base"
solve_numbers(mod_dir = file.path("C:/Assessments/2021/copper_rockfish_2021/models/wa", base_name), 
			  fore_yrs = 2021:2022, 
			  fleet_abc = c(2.11, 2.10), 
			  fleet = 1)