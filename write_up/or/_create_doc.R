
#detach("package:sa4ss", unload = TRUE)
#remotes::install_github("nwfsc-assess/sa4ss")

# Always: Load packages
library(sa4ss)
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/r4ss")


# Always: Specify the directory for the document
setwd("C:/Assessments/2021/copper_rockfish_2021/write_up/or")

# Once: Define the title, species, and authors
#       Required author names here: https://github.com/nwfsc-assess/sa4ss/blob/master/data-raw/authors.csv
sa4ss::draft(authors = c("Chantel R. Wetzel", "Brian J. Langseth", "Jason M. Cope", "Alison D. Whitman"),
  			 species = "Copper Rockfish",
  			 latin = "Sebastes caurinus",
  			 coast = "Oregon US West",
  			 type = c("sa"),
  			 create_dir = FALSE,
  			 edit = FALSE)

# Sometimes: Create objects based on a base model:
sa4ss::read_model(
          mod_loc = "C:/Assessments/2021/copper_rockfish_2021/models/or/6.4_base",
				  create_plots = FALSE, 
				  save_loc = file.path(getwd(), "tex_tables"),
				  verbose = TRUE)

# Sometimes:
source("C:/Users/Chantel.Wetzel/Documents/GitHub/sa4ss/R/es_table_tex.R")
SSexecutivesummary(replist = model, format = FALSE)
es_table_tex(dir = mod_loc, 
            save_loc = file.path(getwd(), "tex_tables"), 
            csv_name = "table_labels.csv")

# Sometimes: Read and create tex files for tables listed in "table" folder in the doc
es_table_tex(dir = file.path(getwd(), 'tables'), 
            save_loc = file.path(getwd(), "tex_table-s"), 
            csv_name = "all_tables.csv")

# Render Call:
if(file.exists("_main.Rmd")){
	file.remove("_main.Rmd")
}
# Render the pdf
bookdown::render_book("00a.Rmd", clean=FALSE, output_dir = getwd())


# To do list:
# Redo the Linf profile



#bookdown::render_book("00a.Rmd", clean = FALSE)


# Use to only render a specific section which can be quicker
bookdown::preview_chapter("01executive.Rmd", preview = TRUE, clean = FALSE)