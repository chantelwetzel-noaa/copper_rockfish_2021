
pngfun <- function(wd, file,w=7,h=7,pt=12){
  file <- file.path(wd, file)
  cat('writing PNG to',file,'\n')
  png(filename=file,
      width=w,height=h,
      units='in',res=300,pointsize=pt)
}

pngfun(wd = file.path(getwd(), "figs"), file = "catches_wa.png", w = 7, h = 7, pt = 12)
#Plot the catches special because of numbers and biomass mix
par(mfrow = c(2,1))

yr = model$catch[model$catch$Fleet == 1, "Yr"]
rec = model$catch[model$catch$Fleet == 1, "kill_num"]
barplot(rec, main = "Recreational", col = "blue", ylim = c(0, 5), names.arg = yr)
mtext(side = 1, "Year", line = 2.5)
mtext(side = 2, "Catch (numbers - 1000s)", line = 2.5)

yr = model$catch[model$catch$Fleet == 2, "Yr"]
com = model$catch[model$catch$Fleet == 2, "kill_bio"]
barplot(com, main = "Commercial",col = "red", ylim = c(0, 1.2), names.arg = yr)
mtext(side = 1, "Year", line = 2.5)
mtext(side = 2, "Catch (mt)", line = 2.5)

dev.off()

