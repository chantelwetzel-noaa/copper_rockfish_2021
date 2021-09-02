
#detach("package:sa4ss", unload = TRUE)
#remotes::install_github("nwfsc-assess/sa4ss")
library(sa4ss)
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/r4ss")


# Specify the directory for the document
setwd("C:/Assessments/2021/copper_rockfish_2021/write_up/s_ca_rebuild")

# Create the needed items to generate the "right" template that would be based on the inputs here:
# sa4ss::draft(authors = c("Chantel R. Wetzel"),
#   			 species = "Copper Rockfish",
#   			 latin = "Sebastes caurinus",
#   			 coast = "California South of Pt. Conception US West",
#   			 type = c("sa"),
#   			 create_dir = FALSE,
#   			 edit = FALSE)

source("C:/Assessments/2021/copper_rockfish_2021/code/get_values_rebuilder.R")
rebuild_dir = "C:/Assessments/2021/copper_rockfish_2021/models/ca_s_pt_c/_rebuilder"
run <- c(
		 "spr_fine_step_no_abc_max",
		 "spr_no_abc_max",
		 "spr_50mt_21_22_no_abc_max")
reb <- list()
for (a in 1:length(run)){
	reb[[a]]  <- get_values(rebuild_dir = file.path(rebuild_dir, run[a]))
}
save(reb, file = file.path(getwd(), "00mod.Rdata"))


if(file.exists("_main.Rmd")){
	file.remove("_main.Rmd")
}
# Render the pdf
bookdown::render_book("00a.Rmd", clean=FALSE, output_dir = getwd())
