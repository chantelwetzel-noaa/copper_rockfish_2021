library(sa4ss)
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/r4ss")

# Specify the directory for the document
setwd("C:/Assessments/2021/copper_rockfish_2021/write_up/council_requests")

if(file.exists("_main.Rmd")){
	file.remove("_main.Rmd")
}
# Render the pdf
bookdown::render_book("Copper_Responses.Rmd", clean=FALSE, output_dir = getwd())



