
#detach("package:sa4ss", unload = TRUE)
#remotes::install_github("nwfsc-assess/sa4ss")
library(sa4ss); library(r4ss)
#devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/r4ss")


# Specify the directory for the document
setwd("C:/Assessments/2021/copper_rockfish_2021/write_up/decision_table")

# Create the needed items to generate the "right" template that would be based on the inputs here:
# sa4ss::draft(authors = c("Chantel R. Wetzel"),
#   			 species = "Copper Rockfish",
#   			 latin = "Sebastes caurinus",
#   			 coast = "California South of Pt. Conception US West",
#   			 type = c("sa"),
#   			 create_dir = FALSE,
#   			 edit = FALSE)


if(file.exists("_main.Rmd")){
	file.remove("_main.Rmd")
}
# Render the pdf
bookdown::render_book("00a.Rmd", clean=FALSE, output_dir = getwd())
