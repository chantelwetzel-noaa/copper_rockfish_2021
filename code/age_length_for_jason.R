load(file.path(dir, "data", "commercial_comps", "PacFIN.COPP.bds.16.Oct.2020.RData"))
pacfin = cleanColumns(data = out, use = c("vdrfd", "raw"))
pac_age = pacfin[which(!is.na(pacfin$FISH_AGE_YEARS_FINAL)), ]
tmp_pac = data.frame(Length_cm = pac_age$FISH_LENGTH/10,
					 Age = pac_age$FISH_AGE_YEARS_FINAL,
					 Sex = pac_age$SEX,
					 Source = "PacFIN")

or_recfin_age = read.csv(file.path(dir, "data", "recreational_comps", "Oregon", "copper_recfin_bio_age_2005_2019.csv"))
tmp_or = data.frame(Length_cm = or_recfin_age$MEASURED_LENGTH/10, 
					Age = or_recfin_age$USE_THIS_AGE,
					Sex = or_recfin_age$RECFIN_SEX_CODE,
					Source = "ODFW_Rec")

wa_recfin = read.csv(file.path(dir, "data", "recreational_comps",  "wa_rec_bds_copper.csv"))
wa_age = wa_recfin[which(!is.na(wa_recfin$best_age)), ]

tmp_wa = data.frame(Length_cm = wa_age$fish_length_cm, 
					   Age = wa_age$best_age, 
					   Sex = ifelse(wa_age$sex_name == "Female", "F", 
					   		 ifelse(wa_age$sex_name == "Male", "M", "U")),
					   Source = "WDFW_Rec")


ca_age = read.csv(file.path(dir, "data", "biology", "ca_copper_budrick_lea_ages.csv"))
ca_age = ca_age[which(ca_age$Source == "Lea"), ]
tmp_lea = data.frame(Length_cm = ca_age$Length,
					 Age = ca_age$Age,
					 Sex = "U",
					 Source = ca_age$Source)

df = rbind(tmp_pac, tmp_or, tmp_wa, tmp_lea)
save(df, file = "N:/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/biology/age_length_only.Rdat")


ggplot(df, aes(Age, Length_cm)) + 
	geom_point(aes(colour =  paste0(Source, "_",Sex)))