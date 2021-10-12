
detach("package:sa4ss", unload = TRUE)

remotes::install_github("nwfsc-assess/sa4ss")
library(sa4ss)

devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/r4ss")

# Specify the directory for the document
setwd("C:/Assessments/2021/copper_rockfish_2021/write_up/wa")

# Create the needed items to generate the "right" template that would be based on the inputs here:
sa4ss::draft(authors = c("Chantel R. Wetzel", "Brian J. Langseth", "Jason M. Cope", "Theresa Tsou", "Kristen E. Hinton"),
  			 species = "copper rockfish",
  			 latin = "Sebastes caurinus",
  			 coast = "Washington US West",
  			 type = c("sa"),
  			 create_dir = FALSE,
  			 edit = FALSE)

# Create a model Rdata object
sa4ss::read_model(mod_loc = "C:/Assessments/2021/copper_rockfish_2021/models/wa/7.7_base",
				  create_plots = FALSE, 
				  save_loc = file.path(getwd(), "tex_tables"),
				  verbose = TRUE)

load("00mod.Rdata")

# Executive Summary Tables
source("C:/Users/Chantel.Wetzel/Documents/GitHub/sa4ss/R/es_table_tex.R")
SSexecutivesummary(replist = model, format = FALSE)
es_table_tex(dir = mod_loc, 
            save_loc = file.path(getwd(), "tex_tables"), 
            csv_name = "table_labels.csv")

# Read and create tex files for tables listed in "table" folder in the doc
es_table_tex(dir = file.path(getwd(), 'tables'), 
            save_loc = file.path(getwd(), "tex_tables"), 
            csv_name = "all_tables.csv")

# If there is an error in the build - this file will need to be removed before next render
if(file.exists("_main.Rmd")){
	file.remove("_main.Rmd")
}
# Render the pdf
# Put the pdf in the folder where compiled
bookdown::render_book("00a.Rmd", clean=FALSE, output_dir = getwd())

