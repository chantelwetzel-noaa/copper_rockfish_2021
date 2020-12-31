
#detach("package:sa4ss", unload = TRUE)
#remotes::install_github("nwfsc-assess/sa4ss")
library(sa4ss)

devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/r4ss")

# Specify the directory for the document
setwd("C:/Assessments/2021/copper_rockfish_2021/write_up/or")

# Create the needed items to generate the "right" template that would be based on the inputs here:
sa4ss::draft(authors = c("Chantel R. Wetzel", "Brian J. Langseth", "Jason M. Cope", "Alison D. Whitman"),
  			 species = "Copper Rockfish",
  			 latin = "Sebastes caurinus",
  			 coast = "Oregon US West",
  			 type = c("sa"),
  			 create_dir = FALSE,
  			 edit = FALSE)

# Create a model Rdata object
sa4ss::read_model(
          		  mod_loc = "C:/Assessments/2021/copper_rockfish_2021/models/or/5.0_dw_francis",
				  create_plots = FALSE, 
				  save_loc = file.path(getwd(), "tex_tables"),
				  verbose = TRUE)

load("00mod.Rdata")

SSexecutivesummary(replist = model, format = FALSE)
es_table_tex(dir = mod_loc, table_folder = 'tables')
es_table_tex(dir = file.path(getwd(), 'tables'), 
            save_loc = file.path(getwd(), "tex_tables"), 
            csv_name = "all_tables.csv")

if(file.exists("_main.Rmd")){
	file.remove("_main.Rmd")
}
# Render the pdf
bookdown::render_book("00a.Rmd", clean=FALSE, output_dir = getwd())

#bookdown::render_book("00a.Rmd", clean = FALSE)


# Use to only render a specific section which can be quicker
bookdown::preview_chapter("01executive.Rmd", preview = TRUE, clean = FALSE)