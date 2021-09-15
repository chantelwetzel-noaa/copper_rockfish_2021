devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/PacFIN.Utilities")
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/datamoderate_2021")
dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish"


load(file.path(dir, "data", "commercial_comps", "early data pulls", "PacFIN.COPP.bds.16.Oct.2020.RData"))
pacfin = cleanColumns(data = out)
pac_age = pacfin[which(!is.na(pacfin$FISH_AGE_YEARS_FINAL)), ]
pac_age$Area = "Oregon"
find = which(pac_age$SOURCE_AGID == "W")
pac_age[find,"Area"] =  "Washington"
tmp_pac = data.frame(Length_cm = pac_age$FISH_LENGTH / 10,
					 Age = pac_age$FISH_AGE_YEARS_FINAL,
					 Sex = pac_age$SEX,
					 Source = "PacFIN",
					 Area = pac_age$Area)

or_recfin_age = read.csv(file.path(dir, "data", "recreational_comps", "Oregon", "copper_recfin_bio_age_2005_2019.csv"))
tmp_or = data.frame(Length_cm = or_recfin_age$MEASURED_LENGTH/10, 
					Age = or_recfin_age$USE_THIS_AGE,
					Sex = or_recfin_age$RECFIN_SEX_CODE,
					Source = "ODFW_Rec",
				    Area = "Oregon")

wa_recfin = read.csv(file.path(dir, "data", "recreational_comps", "wa", "wa_rec_bds_copper.csv"))
wa_age = wa_recfin[which(!is.na(wa_recfin$best_age)), ]

tmp_wa = data.frame(Length_cm = wa_age$fish_length_cm, 
					   Age = wa_age$best_age, 
					   Sex = ifelse(wa_age$sex_name == "Female", "F", 
					   		 ifelse(wa_age$sex_name == "Male", "M", "U")),
					   Source = "WDFW_Rec",
					   Area = "Washington")

# Survey ages
hkl_ages = read.csv(file.path(dir, "data", "survey", "nwfsc_hkl_ages.csv"))
tmp_hkl = data.frame(Length_cm = hkl_ages$length_cm, 
					Age = hkl_ages$final_age,
					Sex = hkl_ages$Sex,
					Source = "NWFSC_HKL",
				    Area = "South_CA")

wcgbt_age = read.csv(file.path(dir, "data", "survey", "wcgbts_ages.csv"))
tmp_wcgbt = data.frame(Length_cm = wcgbt_age$length_cm, 
					   Age = wcgbt_age$Age,
					   Sex = wcgbt_age$sex,
					   Source = "NWFSC_WCGBT",
				       Area = "South_CA")

ca_age = read.csv(file.path(dir, "data", "biology", "ca_copper_budrick_lea_ages.csv"))
ca_age = ca_age[which(ca_age$Source == "Lea"), ]
#tmp_lea = data.frame(Length_cm = ca_age$Length,
#					 Age = ca_age$Age,
#					 Sex = "U",
#					 Source = ca_age$Source,
#					 Area = "All")

#Lea at al. 1999 Copper data
age0<-cbind(0,rnorm(5,8.2,0.84))
age1<-cbind(1,rnorm(8,12.3,1.78))
age2<-cbind(2,rnorm(36,18.1,3.29))
age3<-cbind(3,rnorm(66,24.5,2.92))
age4<-cbind(4,rnorm(37,28.5,2.58))

age_lt<-rbind(age0,age1,age2,age3,age4)
colnames(age_lt)<-c("Age","Length")
tmp_lea = data.frame(Length_cm = age_lt[,"Length"],
					 Age = age_lt[,"Age"],
					 Sex = "U",
					 Source = "Lea",
					 Area = "All")

# Newest age reads from Patrick - post assessment
new_ages = read.csv(file.path(dir, "data", "biology", "ageing", "Copp_ReleasedAgesSummary_20210910.csv"))
new_ages$Sex[new_ages$Sex == 9] = "U"
find = which(new_ages[,"Latitude"] < 3500)
tmp_south_ca = new_ages[find, ]
tmp_north_ca = new_ages[-find, ]

new_south_ca = data.frame(Length_cm = tmp_south_ca$Length / 10,
					      Age = tmp_south_ca$Final.Age,
					      Sex = tmp_south_ca$Sex,
					      Source = tmp_south_ca$Program,
					  	  Area = "South_CA")

new_north_ca = data.frame(Length_cm = tmp_north_ca$Length / 10,
					      Age = tmp_north_ca$Final.Age,
					      Sex = tmp_north_ca$Sex,
					      Source = tmp_north_ca$Program,
					  	  Area = "North_CA")


df = rbind(tmp_pac, 
		   tmp_or, 
		   tmp_wa, 
		   tmp_lea, 
		   new_south_ca, 
		   new_north_ca,
		   tmp_hkl, 
		   tmp_wcgbt)
remove = which(is.na(df$Age) | is.na(df$Length_cm))
df = df[-remove,]
save(df, 
	file = "N:/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/biology/age_length_only_september_2021.Rdat")

library(ggplot2)
ggplot(df, aes(Age, Length_cm)) + 
	geom_point(aes(colour =  paste0(Source, "_",Sex)))

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "all_areas_growth_mop-up.png", w = 12, h = 12)
ggplot(df[df$Area != "All",], aes(Age, Length_cm)) + 
	facet_wrap(facets = "Area") + 
	geom_point(aes(colour =  Sex), size = 3, alpha = 0.75)	
dev.off()

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "source_growth_mop-up.png", w = 15, h = 12)
ggplot(df, aes(Age, Length_cm)) + 
	facet_wrap(facets = "Source", ncol = 6) + 
	geom_point(aes(colour =  Sex), size = 3, alpha = 0.75)	
dev.off()

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "north_by_source_growth_mop-up.png", w = 12, h = 7)
ggplot(df[df$Area == "North_CA",], aes(Age, Length_cm)) + 
	geom_point(aes(colour =  Source), size = 3, alpha = 0.75)
dev.off()

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "north_by_source_panels_growth_mop-up.png", w = 12, h = 7)
ggplot(df[df$Area == "North_CA",], aes(Age, Length_cm)) + 
	facet_wrap(facets = "Source") + ylim(0, 60) +
	geom_point(aes(colour =  Sex), size = 3, alpha = 0.75)
dev.off()

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "all_areas_by_source_growth_mop-up.png", w = 12, h = 7)
ggplot(df, aes(Age, Length_cm)) + 
	geom_point(aes(colour =  Source), size = 3, alpha = 0.75)
dev.off()

ggplot(df, aes(Age, Length_cm)) + 
	geom_point(aes(colour =  Area), size = 3, alpha = 0.75)

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "research_by_lat_growth_mop-up.png", w = 12, h = 7)
ggplot(new_ages[!is.na(new_ages$Latitude),], aes(Final.Age, Length)) + 
	geom_point(aes(colour =  Latitude))
dev.off()

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "ca_by_port_growth_mop-up.png", w = 12, h = 7)
ggplot(new_ages[is.na(new_ages$Latitude),], aes(Final.Age, Length)) + 
	geom_point(aes(colour =  Location), size = 3, alpha = 0.75) +
	xlim(0, 50) + ylim(0, 600)
dev.off()

#============================================================================
linf = 45; l0 = 10; k = 0.15
# Remove unsexed that are not from Lea
df_main = df
find = which(df$Source != "Lea" & df$Sex == "U" )
df = df[-find, ]

#============================================================================
# Only Southern California
#============================================================================
sub_data = df[df$Area %in% c("All", "South_CA"), ]

growth = checkLenAge(Pdata = sub_data,
  Par = list(K = k, Linf = linf, L0 = l0, CV0 = 0.10, CV1 = 0.10),
  len_col = "Length_cm", age_col = "Age", sex_col = "Sex",
  mult = 1, keepAll = TRUE, sdFactor = 4, Optim = TRUE,
  precision = 1, verbose = FALSE)
remove = which(growth[,'Length_cm'] > growth[,'Lhat_high'] | growth[,'Length_cm'] < growth[,'Lhat_low'])
plot(growth$Age, growth$Length_cm, ylim = c(0,60), type = 'p')
#points(growth$Age[remove], growth$Length_cm[remove], col = 'red', pch = 20)
#growth = growth[-remove,]

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "southern_ca_growth_mop-up.png", w = 12, h = 7)
ggplot(growth, aes(Age, Length_cm)) + 
	geom_point(aes(colour =  Sex), size = 2, alpha = 0.75) +
	xlim(0,50) +  ylim(0, 60) +
	labs(title = "Southern California", y = "Length (cm)", x = "Age", cex = 1.5)
dev.off()

south_growth <- list()
data = growth #growth[growth$Sex == "F", ]
south_growth[[1]] <- optim(c(linf, l0, k), vb_opt_fn, 
		age = data$Age, lengths = data$Length_cm)$par	

sex = c("M","F")
for (a in 1:2){
	tmp = data[data$Sex %in% c(sex[a],"U"), ]
	south_growth[[a+1]] <- optim(c(linf, l0, k), vb_opt_fn, 
		age = tmp$Age, lengths = tmp$Length_cm)$par
}
names(south_growth) <- c("Combined", sex)

#============================================================================
# Only Northern California
#============================================================================
sub_data = df[df$Area %in% c("All", "North_CA"), ]

growth = checkLenAge(Pdata = sub_data,
  Par = list(K = k, Linf = linf, L0 = l0, CV0 = 0.10, CV1 = 0.10),
  len_col = "Length_cm", age_col = "Age", sex_col = "Sex",
  mult = 1, keepAll = TRUE, sdFactor = 4, Optim = TRUE,
  precision = 1, verbose = FALSE)
remove = which(growth[,'Length_cm'] > growth[,'Lhat_high'] | growth[,'Length_cm'] < growth[,'Lhat_low'])

plot(growth$Age, growth$Length_cm, ylim = c(0,60), type = 'p')
points(growth$Age[remove], growth$Length_cm[remove], col = 'red', pch = 20)

growth = growth[-remove,]

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "north_ca_growth_mop-up.png", w = 12, h = 7)
ggplot(growth, aes(Age, Length_cm)) + 
	geom_point(aes(colour =  Sex), size = 2) +
	xlim(0,50) +  ylim(0, 60) +
	labs(title = "Northern California", y = "Length (cm)", x = "Age", cex = 1.5)
dev.off()

north_growth <- list()
data = growth 
north_growth[[1]] <- optim(c(linf, l0, k), vb_opt_fn, 
		age = data$Age, lengths = data$Length_cm)$par	
sex = c("M", "F")
for (a in 1:2){
	tmp = data[data$Sex %in% c("U",sex[a]), ]
	north_growth[[a+1]] <- optim(c(linf, l0, k), vb_opt_fn, 
		age = tmp$Age, lengths = tmp$Length_cm)$par
}
names(north_growth) <- c("Combined", sex)

#============================================================================
# Only Northern California
#============================================================================
sub_data = df[df$Area %in% c("All", "North_CA"), ]

growth = checkLenAge(Pdata = sub_data,
  Par = list(K = k, Linf = linf, L0 = l0, CV0 = 0.10, CV1 = 0.10),
  len_col = "Length_cm", age_col = "Age", sex_col = "Sex",
  mult = 1, keepAll = TRUE, sdFactor = 3, Optim = TRUE,
  precision = 1, verbose = FALSE)
remove = which(growth[,'Length_cm'] > growth[,'Lhat_high'] | growth[,'Length_cm'] < growth[,'Lhat_low'])

plot(growth$Age, growth$Length_cm, ylim = c(0,60), type = 'p')
points(growth$Age[remove], growth$Length_cm[remove], col = 'red', pch = 20)

growth = growth[-remove,]

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "north_ca_growth_mop-up.png", w = 12, h = 7)
ggplot(growth, aes(Age, Length_cm)) + 
	geom_point(aes(colour =  Sex), size = 2) +
	xlim(0,50) +  ylim(0, 60) +
	labs(title = "Northern California", y = "Length (cm)", x = "Age", cex = 1.5)
dev.off()

north_growth <- list()
data = growth 
north_growth[[1]] <- optim(c(linf, l0, k), vb_opt_fn, 
		age = data$Age, lengths = data$Length_cm)$par	
sex = c("M", "F")
for (a in 1:2){
	tmp = data[data$Sex %in% c("U",sex[a]), ]
	north_growth[[a+1]] <- optim(c(linf, l0, k), vb_opt_fn, 
		age = tmp$Age, lengths = tmp$Length_cm)$par
}
names(north_growth) <- c("Combined", sex)


#============================================================================
# All California
#============================================================================
sub_data = df[df$Area %in% c("All", "North_CA", "South_CA"), ]

growth = checkLenAge(Pdata = sub_data,
  Par = list(K = 0.13, Linf = 45, L0 = 15, CV0 = 0.10, CV1 = 0.10),
  len_col = "Length_cm", age_col = "Age", sex_col = "Sex",
  mult = 1, keepAll = TRUE, sdFactor = 4, Optim = TRUE,
  precision = 1, verbose = FALSE)

remove = which(growth[,'Length_cm'] > growth[,'Lhat_high'] | growth[,'Length_cm'] < growth[,'Lhat_low'])
plot(growth$Age, growth$Length_cm, ylim = c(0,60), type = 'p')
points(growth$Age[remove], growth$Length_cm[remove], col = 'red', pch = 20)
growth = growth[-remove,]

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "california_growth_mop-up.png", w = 12, h = 7)
ggplot(growth, aes(Age, Length_cm)) + 
	geom_point(aes(colour =  Sex), size = 2) +
	xlim(0,50) +  ylim(0, 60) +
	labs(title = "All of California", y = "Length (cm)", x = "Age", cex = 1.5)
dev.off()

ca_growth <- list()
data = growth #growth[growth$Sex == "F", ]
ca_growth[[1]] <- optim(c(linf, l0, k), vb_opt_fn, 
		age = data$Age, lengths = data$Length_cm)$par	
sex = c("M", "F")
for (a in 1:2){
	tmp = data[data$Sex %in% c(sex[a], "U"), ]
	ca_growth[[a+1]] <- optim(c(linf, l0, k), vb_opt_fn, 
		age = tmp$Age, lengths = tmp$Length_cm)$par
}
names(ca_growth) <- c("Combined", sex)


#============================================================================
# Oregon
#============================================================================
sub_data = df[df$Area %in% c("All", "Oregon"), ]

growth = checkLenAge(Pdata = sub_data,
  Par = list(K = 0.13, Linf = 45, L0 = 15, CV0 = 0.10, CV1 = 0.10),
  len_col = "Length_cm", age_col = "Age", sex_col = "Sex",
  mult = 1, keepAll = TRUE, sdFactor = 3, Optim = TRUE,
  precision = 1, verbose = FALSE)

remove = which(growth[,'Length_cm'] > growth[,'Lhat_high'] | growth[,'Length_cm'] < growth[,'Lhat_low'])
plot(growth$Age, growth$Length_cm, ylim = c(0,60), type = 'p')
points(growth$Age[remove], growth$Length_cm[remove], col = 'red', pch = 20)
growth = growth[-remove,]

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "or_growth_mop-up.png", w = 12, h = 7)
ggplot(growth, aes(Age, Length_cm)) + 
	geom_point(aes(colour =  Sex), size = 2) +
	xlim(0,50) +  ylim(0, 60) +
	labs(title = "Oregon", y = "Length (cm)", x = "Age", cex = 1.5)
dev.off()

or_growth <- list()
data = growth #growth[growth$Sex == "F", ]
or_growth[[1]] <- optim(c(linf, l0, k), vb_opt_fn, 
		age = data$Age, lengths = data$Length_cm)$par	
sex = c("M", "F")
for (a in 1:2){
	tmp = data[data$Sex %in% c(sex[a], "U"), ]
	or_growth[[a+1]] <- optim(c(linf, l0, k), vb_opt_fn, 
		age = tmp$Age, lengths = tmp$Length_cm)$par
}
names(or_growth) <- c("Combined", sex)



#============================================================================
# All California
#============================================================================
sub_data = df[df$Area %in% c("All", "North_CA", "South_CA"), ]

growth = checkLenAge(Pdata = sub_data,
  Par = list(K = 0.13, Linf = 45, L0 = 15, CV0 = 0.10, CV1 = 0.10),
  len_col = "Length_cm", age_col = "Age", sex_col = "Sex",
  mult = 1, keepAll = TRUE, sdFactor = 3, Optim = TRUE,
  precision = 1, verbose = FALSE)

remove = which(growth[,'Length_cm'] > growth[,'Lhat_high'] | growth[,'Length_cm'] < growth[,'Lhat_low'])
plot(growth$Age, growth$Length_cm, ylim = c(0,60), type = 'p')
points(growth$Age[remove], growth$Length_cm[remove], col = 'red', pch = 20)
growth = growth[-remove,]

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "california_growth_mop-up.png", w = 12, h = 7)
ggplot(growth, aes(Age, Length_cm)) + 
	geom_point(aes(colour =  Sex), size = 2) +
	xlim(0,50) +  ylim(0, 60) +
	labs(title = "All of California", y = "Length (cm)", x = "Age", cex = 1.5)
dev.off()

ca_growth <- list()
data = growth #growth[growth$Sex == "F", ]
ca_growth[[1]] <- optim(c(linf, l0, k), vb_opt_fn, 
		age = data$Age, lengths = data$Length_cm)$par	
sex = c("M", "F")
for (a in 1:2){
	tmp = data[data$Sex %in% c(sex[a], "U"), ]
	ca_growth[[a+1]] <- optim(c(linf, l0, k), vb_opt_fn, 
		age = tmp$Age, lengths = tmp$Length_cm)$par
}
names(ca_growth) <- c("Combined", sex)

#============================================================================
# Washington
#============================================================================
sub_data = df[df$Area %in% c("All", "Washington"), ]

growth = checkLenAge(Pdata = sub_data,
  Par = list(K = 0.13, Linf = 45, L0 = 15, CV0 = 0.10, CV1 = 0.10),
  len_col = "Length_cm", age_col = "Age", sex_col = "Sex",
  mult = 1, keepAll = TRUE, sdFactor = 3, Optim = TRUE,
  precision = 1, verbose = FALSE)

remove = which(growth[,'Length_cm'] > growth[,'Lhat_high'] | growth[,'Length_cm'] < growth[,'Lhat_low'])
plot(growth$Age, growth$Length_cm, ylim = c(0,60), type = 'p')
points(growth$Age[remove], growth$Length_cm[remove], col = 'red', pch = 20)
growth = growth[-remove,]

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "wa_growth_mop-up.png", w = 12, h = 7)
ggplot(growth, aes(Age, Length_cm)) + 
	geom_point(aes(colour =  Sex), size = 2) +
	xlim(0,50) +  ylim(0, 60) +
	labs(title = "Washington", y = "Length (cm)", x = "Age", cex = 1.5)
dev.off()

wa_growth <- list()
data = growth #growth[growth$Sex == "F", ]
wa_growth[[1]] <- optim(c(linf, l0, k), vb_opt_fn, 
		age = data$Age, lengths = data$Length_cm)$par	
sex = c("M", "F")
for (a in 1:2){
	tmp = data[data$Sex %in% c(sex[a], "U"), ]
	wa_growth[[a+1]] <- optim(c(linf, l0, k), vb_opt_fn, 
		age = tmp$Age, lengths = tmp$Length_cm)$par
}
names(wa_growth) <- c("Combined", sex)

#============================================================================
# Oregon-Washington
#============================================================================
sub_data = df_main[df_main$Area %in% c("All", "Oregon", "Washington"), ]

growth = checkLenAge(Pdata = sub_data,
  Par = list(K = 0.13, Linf = 45, L0 = 15, CV0 = 0.10, CV1 = 0.10),
  len_col = "Length_cm", age_col = "Age", sex_col = "Sex",
  mult = 1, keepAll = TRUE, sdFactor = 4, Optim = TRUE,
  precision = 1, verbose = FALSE)

remove = which(growth[,'Length_cm'] > growth[,'Lhat_high'] | growth[,'Length_cm'] < growth[,'Lhat_low'])
plot(growth$Age, growth$Length_cm, ylim = c(0,60), type = 'p')
points(growth$Age[remove], growth$Length_cm[remove], col = 'red', pch = 20)
growth = growth[-remove,]

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "or_wa_growth_mop-up.png", w = 12, h = 7)
ggplot(growth, aes(Age, Length_cm)) + 
	geom_point(aes(colour =  Sex), size = 2) +
	xlim(0,50) +  ylim(0, 60) +
	labs(title = "Oregon-Washington", y = "Length (cm)", x = "Age", cex = 1.5)
dev.off()

or_wa_growth <- list()
data = growth #growth[growth$Sex == "F", ]
or_wa_growth[[1]] <- optim(c(linf, l0, k), vb_opt_fn, 
		age = data$Age, lengths = data$Length_cm)$par	
sex = c("M", "F")
for (a in 1:2){
	tmp = data[data$Sex %in% c(sex[a], "U"), ]
	or_wa_growth[[a+1]] <- optim(c(linf, l0, k), vb_opt_fn, 
		age = tmp$Age, lengths = tmp$Length_cm)$par
}
names(or_wa_growth) <- c("Combined", sex)


#============================================================================
# Coastwide
#============================================================================
sub_data = df

growth = checkLenAge(Pdata = sub_data,
  Par = list(K = 0.13, Linf = 45, L0 = 15, CV0 = 0.10, CV1 = 0.10),
  len_col = "Length_cm", age_col = "Age", sex_col = "Sex",
  mult = 1, keepAll = TRUE, sdFactor = 4, Optim = TRUE,
  precision = 1, verbose = FALSE)

remove = which(growth[,'Length_cm'] > growth[,'Lhat_high'] | growth[,'Length_cm'] < growth[,'Lhat_low'])
plot(growth$Age, growth$Length_cm, ylim = c(0,60), type = 'p')
points(growth$Age[remove], growth$Length_cm[remove], col = 'red', pch = 20)
growth = growth[-remove,]

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "coastwide_growth_mop-up.png", w = 12, h = 7)
ggplot(sub_data, aes(Age, Length_cm)) + 
	geom_point(aes(colour =  Sex), size = 2) +
	xlim(0,50) +  ylim(0, 60) +
	labs(title = "Coastwide", y = "Length (cm)", x = "Age", cex = 1.5)
dev.off()

coastwide_growth <- list()
data = growth #growth[growth$Sex == "F", ]
coastwide_growth[[1]] <- optim(c(linf, l0, k), vb_opt_fn, 
		age = data$Age, lengths = data$Length_cm)$par	
sex = c("M", "F")
for (a in 1:2){
	tmp = data[data$Sex %in% c(sex[a], "U"), ]
	coastwide_growth[[a+1]] <- optim(c(linf, l0, k), vb_opt_fn, 
		age = tmp$Age, lengths = tmp$Length_cm)$par
}
names(coastwide_growth) <- c("Combined", sex)

#======================================================================================
# Plot by Area
#======================================================================================
ymax = 60
plot(0:ymax, vb_fn(age = 0:ymax, 
	Linf = coastwide_growth$F[1], L0 = coastwide_growth$F[2], k = coastwide_growth$F[3]), 
	col = "black", type = 'l', ylim = c(0, 55), xlim = c(0, 50), lwd = 2,
	ylab = "Length (cm)", xlab = "Age", xaxs = 'i', yaxs = 'i')
lines(0:ymax, vb_fn(age = 0:ymax, 
	Linf = coastwide_growth$M[1], L0 = coastwide_growth$M[2], k = coastwide_growth$M[3]), 
	col = "black", lty = 2, lwd = 3)
lines(0:ymax, vb_fn(age = 0:ymax, 
	Linf = south_growth$F[1], L0 = south_growth$F[2], k = south_growth$F[3]), 
	col = "orange", lty = 3, lwd = 3)
lines(0:ymax, vb_fn(age = 0:ymax, 
	Linf = south_growth$M[1], L0 = south_growth$M[2], k = south_growth$M[3]), 
	col = "orange", lty = 2, lwd = 3)
lines(0:ymax, vb_fn(age = 0:ymax, 
	Linf = north_growth$F[1], L0 = north_growth$F[2], k = north_growth$F[3]), 
	col = "green", lty = 3, lwd = 3)
lines(0:ymax, vb_fn(age = 0:ymax, 
	Linf = north_growth$M[1], L0 = north_growth$M[2], k = north_growth$M[3]), 
	col = "green", lty = 2, lwd = 3)
lines(0:ymax, vb_fn(age = 0:ymax, 
	Linf = or_wa_growth$F[1], L0 = or_wa_growth$F[2], k = or_wa_growth$F[3]), 
	col = "purple", lty = 3, lwd = 3)
lines(0:ymax, vb_fn(age = 0:ymax, 
	Linf = or_wa_growth$M[1], L0 = or_wa_growth$F[2], k = or_wa_growth$M[3]), 
	col = "purple", lty = 2, lwd = 3)
legend("bottomright", bty = 'n', legend = c("Coastwide", "Southern CA", "Northern CA", "Oregon-Washington"),
col = c("black", "orange", "green", "purple"), lty = 1, lwd = 4)
legend("topleft", bty = 'n', legend = c("Female", "Male"), lty = c(3, 2), lwd = 4)


#=================================================================================
# North of Point Conception Model
#=================================================================================
# North of Point Conception Growth
# log( 418.405 / 163.51) = 0.94
# North of Point Conception Growth - t0
# log( 403.406 / 163.51) = 0.903
# Model recommends downweighting the comp data further with the new growth
# After DW: log( 393.892 / 163.51) = 0.88
# The sensitivity that estimated Linf for both sexes estimated
# Female = 47.13 cm and Male = 46.87 cm compared to the new external growth
# estimates for Linf of 45.27 and 44.26 cm.

# California Coastwide Growth
# log( 299.103 / 163.51) = 0.60 
# California Coastwide Growth - t0
# log( 302.003 / 163.51) = 0.601
# South of Poiont Conception Growth - New Estimate
# log( 207.105 / 163.51) = 0.24
# South of Poiont Conception Growth t0- New Estimate
# log( 209.257 / 163.51) = 0.25

#=================================================================================
# South of Point Conception Model
#=================================================================================
# log( 43.1403 / 42.2812) = 0.02
# North of Point Conception Growth
# log( 39.183 / 42.2812) = 0.08

 

 plot(0:ymax, vb_fn(age = 0:ymax, 
	Linf = coastwide_growth$F[1], L0 = coastwide_growth$F[2], k = coastwide_growth$F[3]), 
	col = "black", type = 'l', ylim = c(0, 55), xlim = c(0, 50), lwd = 2,
	ylab = "Length (cm)", xlab = "Age", xaxs = 'i', yaxs = 'i')
lines(0:ymax, vb_fn(age = 0:ymax, 
	Linf = coastwide_growth$F[1], L0 = 11, k = coastwide_growth$F[3]), 
	col = "black", lty = 2, lwd = 3)
lines(0:ymax, vb_fn(age = 0:ymax, 
	Linf = north_growth$F[1], L0 = north_growth$F[2], k = north_growth$F[3]), 
	col = "orange", lty = 3, lwd = 3)
lines(0:ymax, vb_fn(age = 0:ymax, 
	Linf = north_growth$F[1], L0 = 11, k = north_growth$F[3]), 
	col = "orange", lty = 2, lwd = 3)
