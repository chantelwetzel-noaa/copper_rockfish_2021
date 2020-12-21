############################################################################################
#	Recreational data-processing for copper rockfish
#
#				September, 2020
#
#				 Chantel Wetzel
############################################################################################

devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/nwfscSurvey")
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/PacFIN.Utilities")
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/dataModerate_2021")

library(ggplot2)

dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish"

len_bin = seq(10, 54, 2)
############################################################################################
#	Load Data
############################################################################################

# California Recreational
ca_recfin = read.csv(file.path(dir, "data", "recreational_comps", "ca_rec_lengths_2004_2020_updated.csv"))
ca_recfin = ca_recfin[ca_recfin$Species.Name == "COPPER ROCKFISH", ]
ca_recfin = rename_budrick_recfin(data = ca_recfin)
ca_recfin_data = rename_recfin(data = ca_recfin,
					      area_grouping = list(c("CHANNEL", "SOUTH"), c("BAY AREA", "WINE", "CENTRAL", "REDWOOD", "NOT KNOWN")),
					      area_names = c("south_pt_concep", "north_pt_concep"),
					      area_column_name = "RECFIN_PORT_NAME",
					      mode_grouping = list(c("BEACH/BANK", "MAN-MADE/JETTY"), c("PARTY/CHARTER BOATS", "PRIVATE/RENTAL BOATS"), "NOT KNOWN"),
					      mode_names = c("rec_shore", "rec_boat", "rec_unknown"),
					      mode_column_name = "RecFIN.Mode.Name" )
ca_recfin_data$Source = "RecFIN_MRFSS"


ca_mrfss = read.csv(file.path(dir, "data", "recreational_comps", "ca_mrfss_bio_1980_2003.csv"))
ca_mrfss = ca_mrfss[ca_mrfss$ST == 6 & ca_mrfss$SP_CODE == 8826010108, ]
ca_mrfss = ca_mrfss[!is.na(ca_mrfss$CNTY), ] # remove records without a county
ca_mrfss$STATE_NAME = "CA"
spc = c(59, 73, 37, 111, 83)
npc = unique(ca_mrfss[!ca_mrfss$CNTY %in% spc, "CNTY"]) 

ca_mrfss_data = rename_mrfss(data = ca_mrfss,
							 len_col = "LNGTH",
							 area_grouping = list(spc, npc), 
							 area_names = c("south_pt_concep", "north_pt_concep"), 
							 area_column_name = "CNTY", 
							 mode_grouping = list(c(1,2), c(6, 7)),
					      	 mode_names = c("rec_shore", "rec_boat"),
					      	 mode_column_name = "MODE_FX" )

# Oregon Recreational
or_mrfss = read.csv(file.path(dir, "data", "recreational_comps", "Oregon", "copper_mrfss_bio_1980_2003.csv"))
or_mrfss$STATE_NAME = "OR"
# Ali recommends using fork length (Length column) rather than total length
# The difference between the computed and measured lengths is small < +- 0.5 which should keep lengths in the same bins
# table(or_mrfss$Length_Flag, or_mrfss$Total.Length_Flag)
or_mrfss_data = rename_mrfss(data = or_mrfss,
							 len_col = "Length",
							 area_grouping = list(421), 
							 area_names = c("OR"),
							 area_column_name = "ORBS_SPP_Code", # This is essentially a cheat
							 mode_grouping = list(c(1,2), c(6, 7)),
					      	 mode_names = c("rec_shore", "rec_boat"),
					      	 mode_column_name = "MRFSS_MODE_FX" )

or_recfin_len = read.csv(file.path(dir, "data", "recreational_comps", "Oregon", "copper_recfin_bio_lw_2001_2020.csv"), skip = 22)
# Ali recommends using fork length rather than total length
# remove the fish lengths that were sampled for age as well
# or_recfin_len = or_recfin_len[or_recfin_len$Source.Code %in% c("BIO", "CPFV"), ]
or_recfin_len_data = rename_recfin(data = or_recfin_len, 
								   area_column_name = "State.Name",
								   area_grouping = list("Oregon"), 
								   area_names = "OR",
								   mode_grouping = list(c("BEACH/BANK", "MAN-MADE/JETTY"), c("PARTY/CHARTER BOATS", "PRIVATE/RENTAL BOATS"), "NOT KNOWN"),
					      		   mode_names = c("rec_shore", "rec_boat", "rec_unknown"),
					      		   mode_column_name = "RecFIN.Mode.Name" )
or_recfin_len_data$Source = "RecFIN_MRFSS"

or_recfin_age = read.csv(file.path(dir, "data", "recreational_comps", "Oregon", "copper_recfin_bio_age_2005_2019.csv"))
or_recfin_age_data = rename_recfin(data = or_recfin_age, 
								   area_grouping = list("ODFW"), 
								   area_names = c("OR"), 
								   area_column_name = "SAMPLING_AGENCY_NAME",
								   mode_grouping = list( c("PARTY/CHARTER BOATS", "PRIVATE/RENTAL BOATS")),
					      		   mode_names = c("rec_boat"),
					      		   mode_column_name = "RECFIN_MODE_NAME" )
or_recfin_age_data$Source = "RecFIN_MRFSS"

# Washington Recreational
# According to Theresa WA lengths are all FL
wa_recfin = read.csv(file.path(dir, "data", "recreational_comps",  "wa_rec_bds_copper.csv"))
wa_recfin = rename_wa_recfin( data = wa_recfin)
wa_recfin_data = rename_recfin(data = wa_recfin, 
						  area_grouping = list(unique(wa_recfin$RECFIN_PORT_NAME)), 
						  area_names = c("WA"),
						  area_column_name = "RECFIN_PORT_NAME",
						  mode_grouping = list( c("C", "B","\\?", "^$")),
					      mode_names = c("rec_boat"),
					      mode_column_name = "boat_mode_code"  )
wa_recfin_data$State_Areas = "WA"
wa_recfin_data$Source = "RecFIN_MRFSS"

############################################################################################
# Put all the data into one list
############################################################################################
input = list()
input[[1]] = ca_recfin_data
input[[2]] = ca_mrfss_data
input[[3]] = or_mrfss_data
input[[4]] = or_recfin_len_data
input[[5]] = wa_recfin_data


############################################################################################
#	Create data frame with all the input data
############################################################################################
out = create_data_frame(data_list = input)


############################################################################################
# Clean up the data
############################################################################################
# Now lets do a check length check to filter out any anomolysis lengths
remove = which(out$Length > 65 | out$Length < 8)
#     Year Lat Lon State     State_Areas Areas Depth Sex  Length Weight Age Fleet Data_Type       Source Lhat_pred Lhat_low Lhat_high
# 2017  NA  NA    CA north_pt_concep  <NA>    NA   U 66.8000      -  NA  boat  RETAINED       RecFIN        NA       NA        NA
# 2008  NA  NA    CA north_pt_concep  <NA>    NA   U  4.2000   2.34  NA  boat  RETAINED       RecFIN        NA       NA        NA
# 1998  NA  NA    CA south_pt_concep  <NA>    NA   U  0.2649   <NA>  NA  boat      <NA> RecFIN_MRFSS        NA       NA        NA
# 1985  NA  NA    CA south_pt_concep  <NA>    NA   U 80.2000    9.5  NA  boat      <NA> RecFIN_MRFSS        NA       NA        NA
# 2012  NA  NA    OR              OR  <NA>    NA   U 66.8000   3.10  NA  boat  RETAINED       RecFIN        NA       NA        NA

# Looks good - let's remove those few lengths
out = out[-remove, ]

# Remove the released for the rest of the summaries for now:
released = out[which(out$Data_Type == "RELEASED"), ]

out = out[out$Data_Type %in% c("RETAINED", NA), ]



############################################################################################
#	Washington recreational length data
############################################################################################


wa = out[which(out$State == "WA"), ]
wa$Length_cm = wa$Length

# create a table of the samples available by year
wa$Trawl_id = 1:nrow(wa)
GetN.fn(dir = file.path(dir, "data", "recreational_comps"), dat = wa, type = "length", species = 'others')
n = read.csv(file.path(dir, "data", "recreational_comps", "forSS", "length_SampleSize.csv"))
n = n[,c('Year', 'All_Fish', 'Sexed_Fish', 'Unsexed_Fish')]
write.csv(n, file = file.path(dir, "data", "recreational_comps", "forSS", "wa_samples.csv"), row.names = FALSE)

GetN.fn(dir = file.path(dir, "data", "recreational_comps"), dat = wa, 
	type = "age", species = 'others')
n = read.csv(file.path(dir, "data", "recreational_comps", "forSS", "age_SampleSize.csv"))
n = n[,c('Year', 'All_Fish', 'Sexed_Fish', 'Unsexed_Fish')]
write.csv(n, file = file.path(dir, "data", "recreational_comps", "forSS", "wa_age_samples.csv"), row.names = FALSE)


lfs = UnexpandedLFs.fn(dir = file.path(dir, "data", "recreational_comps"), 
                       datL = wa, lgthBins = len_bin,
                       sex = 3,  partition = 0, fleet = 1, month = 1)
file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Survey_notExpanded_Length_comp_Sex_0_bin=10-54.csv"), 
			to= file.path(dir, "data", "recreational_comps", "forSS", "wa_rec_notExpanded_Length_comp_Sex_0_bin=10-54.csv")) 
file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Survey_notExpanded_Length_comp_Sex_3_bin=10-54.csv"), 
			to= file.path(dir, "data", "recreational_comps", "forSS", "wa_rec_notExpanded_Length_comp_Sex_3_bin=10-54.csv")) 

PlotFreqData.fn(dir = file.path(dir, "data", "recreational_comps"), 
    dat = lfs$comps_u, ylim=c(0, max(len_bin)), 
    main = "WA Recreational - Unsexed", yaxs="i", ylab="Length (cm)", dopng = TRUE)


PlotFreqData.fn(dir = file.path(dir, "data", "recreational_comps"), 
    dat = lfs$comps, ylim=c(0, max(len_bin)), 
    main = "WA Recreational - Sexed", yaxs="i", ylab="Length (cm)", dopng = TRUE)

age_bins = 1:50
afs = UnexpandedAFs.fn(dir = file.path(dir, "data", "recreational_comps"), 
                       datA = wa, ageBins = age_bins,
                       sex = 3,  partition = 0, fleet = 1, month = 1)
file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Survey_notExpanded_Age_comp_Sex_0_bin=1-50.csv"), 
			to= file.path(dir, "data", "recreational_comps", "forSS", "wa_rec_notExpanded_Age_comp_Sex_0_bin=1-50.csv")) 
file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Survey_notExpanded_Age_comp_Sex_3_bin=1-50.csv"), 
			to= file.path(dir, "data", "recreational_comps", "forSS", "wa_rec_notExpanded_Age_comp_Sex_3_bin=1-50.csv")) 



############################################################################################
#	Oregon recreational length data
############################################################################################

or = out[which(out$State == "OR"), ]
or$Length_cm = or$Length
or$Trawl_id = 1:nrow(or)

# create a table of the samples available by year
GetN.fn(dir = file.path(dir, "data", "recreational_comps"), dat = or, type = "length", species = 'others')
n = read.csv(file.path(dir, "data", "recreational_comps", "forSS", "length_SampleSize.csv"))
n = n[,c('Year', 'All_Fish', 'Sexed_Fish', 'Unsexed_Fish')]
write.csv(n, file = file.path(dir, "data", "recreational_comps", "forSS", "or_samples.csv"), row.names = FALSE)

or_age = or_recfin_age_data
or_age$Trawl_id = or_age$SAMPLE_ID
or_age$Length_cm = or_age$Length
GetN.fn(dir = file.path(dir, "data", "recreational_comps"), dat = or_age, 
	type = "age", species = 'others')
n = read.csv(file.path(dir, "data", "recreational_comps", "forSS", "age_SampleSize.csv"))
n = n[,c('Year', 'All_Fish', 'Sexed_Fish', 'Unsexed_Fish')]
write.csv(n, file = file.path(dir, "data", "recreational_comps", "forSS", "or_age_samples.csv"), row.names = FALSE)


lfs = UnexpandedLFs.fn(dir = file.path(dir, "data", "recreational_comps"), 
                       datL = or, lgthBins = len_bin,
                       sex = 3, partition = 0, fleet = 2, month = 1)

file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Survey_notExpanded_Length_comp_Sex_3_bin=10-54.csv"), 
			to= file.path(dir, "data", "recreational_comps", "forSS", "or_rec_notExpanded_Length_comp_Sex_3_bin=10-54.csv")) 
file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Survey_notExpanded_Length_comp_Sex_0_bin=10-54.csv"), 
			to= file.path(dir, "data", "recreational_comps", "forSS", "or_rec_notExpanded_Length_comp_Sex_0_bin=10-54.csv")) 


PlotFreqData.fn(dir = file.path(dir, "data", "recreational_comps"), 
    dat = lfs$comps, ylim=c(0, max(len_bin)+4), 
    main = "OR Recreational - Sexed", yaxs="i", ylab="Length (cm)", dopng = TRUE)

PlotFreqData.fn(dir = file.path(dir, "data", "recreational_comps"), 
    dat = lfs$comps_u, ylim=c(0, max(len_bin)+4), 
    main = "OR Recreational - Unsexed", yaxs="i", ylab="Length (cm)", dopng = TRUE)


or_rel = released[which(released$State == "OR"), ]
or_rel$Length_cm = or_rel$Length
or_rel$Sex = "U"
lfs = UnexpandedLFs.fn(dir = file.path(dir, "data", "recreational_comps"), 
                       datL = or_rel, lgthBins = len_bin,
                       sex = 0, partition = 0, fleet = 2, month = 1)

file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Survey_notExpanded_Length_comp_Sex_0_bin=10-54.csv"), 
			to= file.path(dir, "data", "recreational_comps", "forSS", "released_or_rec_notExpanded_Length_comp_Sex_0_bin=10-54.csv")) 

afs = UnexpandedAFs.fn(dir = file.path(dir, "data", "recreational_comps"), 
                       datA = or_age, ageBins = age_bins,
                       sex = 3, partition = 0, fleet = 2, month = 1)

file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Survey_notExpanded_Age_comp_Sex_3_bin=1-50.csv"), 
			to= file.path(dir, "data", "recreational_comps", "forSS", "or_rec_notExpanded_Age_comp_Sex_3_bin=1-50.csv")) 
file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Survey_notExpanded_Age_comp_Sex_0_bin=1-50.csv"), 
			to= file.path(dir, "data", "recreational_comps", "forSS", "or_rec_notExpanded_Age_comp_Sex_0_bin=1-50.csv")) 




############################################################################################
#	North of Pt. Conception - California recreational length data
############################################################################################

nca = out[which(out$State_Areas == "north_pt_concep"), ]
nca$Length_cm = nca$Length

# There are only 10 fish sexed - change them to unsexed
nca$Sex = "U"


lfs = UnexpandedLFs.fn(dir = file.path(dir, "data", "recreational_comps"), 
                       datL = nca, lgthBins = len_bin,
                       sex = 0, partition = 0, fleet = 2, month = 1)

file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Survey_notExpanded_Length_comp_Sex_0_bin=10-54.csv"), 
			to= file.path(dir, "data", "recreational_comps", "forSS", "nca_rec_notExpanded_Length_comp_Sex_0_bin=10-54.csv")) 

PlotFreqData.fn(dir = file.path(dir, "data", "recreational_comps"), 
    dat = lfs$comps, ylim=c(0, max(len_bin) + 4), 
    main = "CA N. Pt. Conception Recreational - Unsexed", yaxs="i", ylab="Length (cm)", dopng = TRUE)


rel = released[which(released$State_Area == "north_pt_concep"), ]
rel$Length_cm = rel$Length
rel$Sex = "U"
lfs = UnexpandedLFs.fn(dir = file.path(dir, "data", "recreational_comps"), 
                       datL = rel, lgthBins = len_bin,
                       sex = 0, partition = 0, fleet = 2, month = 1)

file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Survey_notExpanded_Length_comp_Sex_0_bin=10-54.csv"), 
			to= file.path(dir, "data", "recreational_comps", "forSS", "released_nca_rec_notExpanded_Length_comp_Sex_0_bin=10-54.csv")) 

############################################################################################
#	South of Pt. Conception - California recreational length data
############################################################################################

sca = out[which(out$State_Areas == "south_pt_concep"), ]
sca$Length_cm = sca$Length

# There are only 2 fish sexed - change them to unsexed
sca$Sex = "U"


lfs = UnexpandedLFs.fn(dir = file.path(dir, "data", "recreational_comps"), 
                       datL = sca, lgthBins = len_bin,
                       sex = 0, partition = 0, fleet = 2, month = 1)

file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Survey_notExpanded_Length_comp_Sex_0_bin=10-54.csv"), 
			to= file.path(dir, "data", "recreational_comps", "forSS", "sca_rec_notExpanded_Length_comp_Sex_0_bin=10-54.csv")) 

PlotFreqData.fn(dir = file.path(dir, "data", "recreational_comps"), 
    dat = lfs$comps, ylim=c(0, max(len_bin) + 4), 
    main = "CA S. Pt. Conception Recreational - Unsexed", yaxs="i", ylab="Length (cm)", dopng = TRUE)

rel = released[which(released$State_Area == "south_pt_concep"), ]
rel$Length_cm = rel$Length
rel$Sex = "U"
lfs = UnexpandedLFs.fn(dir = file.path(dir, "data", "recreational_comps"), 
                       datL = rel, lgthBins = len_bin,
                       sex = 0, partition = 0, fleet = 2, month = 1)

file.rename(from = file.path(dir, "data", "recreational_comps", "forSS", "Survey_notExpanded_Length_comp_Sex_0_bin=10-54.csv"), 
			to= file.path(dir, "data", "recreational_comps", "forSS", "released_sca_rec_notExpanded_Length_comp_Sex_0_bin=10-54.csv")) 



