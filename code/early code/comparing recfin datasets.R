###
#Compare recfin sampling data to see differences in chantel's  
#comprehensive data and whats available from the public facing 
#data pull
#
#Brian Langseth
#August 11, 2020
###


#Read in the full comprehensive datasets
#Comprehensive data from Chantel (in Feb) simplified to only quillback, copper, or squarespot
load("L:\\Assessments\\CurrentAssessments\\DataModerate_2021\\Quillback_Rockfish\\data\\RecFIN Sample Data\\wetzel_comp_bio_age_inventory_20200117.RData")


###
#Compare yearly records from public data pull versus comprehensive data provided
###
#species is the species name in the dataset. ALL CAPS
#abbr is the abbreviation to use in ploting
#folder is the folder for each species.
compare.public.recfin = function(species, abbr, folder){
    
    setwd(paste0("L:\\Assessments\\CurrentAssessments\\DataModerate_2021\\",folder,"\\data\\RecFIN Sample Data\\"))

    #Public available data
    pub_bds <- read.csv("RecFIN_SD001_28Jul2020.csv", header = TRUE)
    pub_bdsW <- subset(pub_bds, STATE_NAME == "WASHINGTON")
    pub_bdsO <- subset(pub_bds, STATE_NAME == "OREGON")
    pub_bdsC <- subset(pub_bds, STATE_NAME == "CALIFORNIA")
    
    comp_bdsW <- subset(wa, SPECIES_NAME == species)
    comp_bdsO <- subset(or, SPECIES_NAME == species)
    comp_bdsC <- subset(ca, SPECIES_NAME == species)
    
    
    png(filename = paste0("Comparing_RecFIN_sources",abbr,".png"), width = 7, height = 7, units = 'in', res = 300)
    
    par(mfrow=c(3,1),
        mar = c(0.2,0.2,1,0.2),
        oma = c(4,4,1,1))
    
    plot(0, type = "n", ylim = c(0,max(0,table(pub_bdsW$RECFIN_YEAR),table(comp_bdsW$RECFIN_YEAR))), 
         xlim = c(1993,2019), xlab = "Year", ylab = "# of records")
    lines(table(pub_bdsW$RECFIN_YEAR), col = rgb(1,0,0,alpha=0.5), type = "l")
    lines(table(comp_bdsW$RECFIN_YEAR), col = rgb(0,0,1,alpha=0.5), type = "l")
    legend("top",c("Public","Comprehensive"),lty = 1, col = c(rgb(1,0,0,alpha=0.5),rgb(0,0,1,alpha=0.5)),
           bty = "n", lwd = 3)
    mtext("a) Washington", side = 1, adj = 0.01, line = -2)
    
    plot(0, type = "n", ylim = c(0,max(0,table(pub_bdsO$RECFIN_YEAR),table(comp_bdsO$RECFIN_YEAR))), 
         xlim = c(1993,2019), xlab = "Year", ylab = "# of records")
    lines(table(pub_bdsO$RECFIN_YEAR), col = rgb(1,0,0,alpha=0.5), type = "l")
    lines(table(comp_bdsO$RECFIN_YEAR), col = rgb(0,0,1,alpha=0.5), type = "l")
    mtext("b) Oregon",side = 1, adj = 0.01, line = -2)
    
    plot(0, type = "n", ylim = c(0,max(0,table(pub_bdsC$RECFIN_YEAR),table(comp_bdsC$RECFIN_YEAR))), 
         xlim = c(1993,2019), xlab = "Year", ylab = "# of records")
    lines(table(pub_bdsC$RECFIN_YEAR), col = rgb(1,0,0,alpha=0.5), type = "l")
    lines(table(comp_bdsC$RECFIN_YEAR), col = rgb(0,0,1,alpha=0.5), type = "l")
    mtext("c) California", side = 1, adj = 0.01, line = -2)
    
    mtext("Number of records", side = 2, line = 2, outer = TRUE)
    mtext(paste("RecFIN records",abbr), side = 3, line = -1, outer = TRUE)
    
    dev.off()
}

compare.public.recfin("QUILLBACK ROCKFISH", "QLBK", "Quillback_Rockfish")
compare.public.recfin("SQUARESPOT ROCKFISH", "SQSP", "Squarespot_Rockfish")

