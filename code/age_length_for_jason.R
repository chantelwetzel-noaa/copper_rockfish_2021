library(PacFIN.Utilities)
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
					 Source = "PacFIN_OR",
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

#ca_age = read.csv(file.path(dir, "data", "biology", "ca_copper_budrick_lea_ages.csv"))
#ca_age = ca_age[which(ca_age$Source == "Lea"), ]
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
remove = which(new_ages$Concern.About.Otolith == "flag")
new_ages = new_ages[-remove, ]
find = which(new_ages[,"Latitude"] < 3500)
tmp_south_ca = new_ages[find, ]
tmp_north_ca = new_ages[-find, ]

save(new_ages, 
	file = "C:/Assessments/2021/copper_rockfish_2021/write_up/mop_up_growth/new_ca_reads.Rdat")


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

save(df, 
	file = "C:/Assessments/2021/copper_rockfish_2021/write_up/mop_up_growth/all_ages.Rdat")

#====================================================================================================================

library(ggplot2)
ggplot(df, aes(Age, Length_cm)) + 
	geom_point(aes(colour =  paste0(Source, "_",Sex)))

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "all_areas_growth_mop-up.png", w = 12, h = 12)
ggplot(df[df$Area != "All",], aes(Age, Length_cm)) + 
	facet_wrap(facets = "Area") + 
	geom_point(aes(colour =  Sex), size = 3, alpha = 0.75)	
dev.off()

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "source_growth_mop-up.png", w = 15, h = 12)
ggplot(df[df$Source != "Lea",], aes(Age, Length_cm)) + 
	facet_wrap(facets = "Source", ncol = 6) + 
	ylim(0, 60) + 
	geom_point(aes(colour =  Sex), size = 3, alpha = 0.75)	
dev.off()

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "north_by_source_growth_mop-up.png", w = 12, h = 7)
ggplot(df[df$Area == "North_CA",], aes(Age, Length_cm)) + 
	ylim(0, 60) +
	geom_point(aes(colour =  Source), size = 3, alpha = 0.75)
dev.off()

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "north_by_source_panels_growth_mop-up.png", w = 12, h = 7)
ggplot(df[df$Area == "North_CA",], aes(Age, Length_cm)) + 
	facet_wrap(facets = "Source") + ylim(0, 60) +
	geom_point(aes(colour =  Sex), size = 3, alpha = 0.75)
dev.off()

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "all_areas_by_source_growth_mop-up.png", w = 12, h = 7)
ggplot(df[df$Source != "Lea", ] , aes(Age, Length_cm)) + ylim(0, 60) +
	geom_point(aes(colour =  Source), size = 3, alpha = 0.75)
dev.off()

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "data_by_area_mop-up.png", w = 12, h = 7)
ggplot(df[df$Source != "Lea", ] , aes(Age, Length_cm)) + ylim(0, 60) +
	geom_point(aes(colour =  Area), size = 3, alpha = 0.5)
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

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "south_ca_source_mop-up.png", w = 12, h = 7)
ggplot(df[df$Area == "South_CA",], aes(Age, Length_cm)) + 
	geom_point(aes(colour =  Source), size = 3, alpha = 0.75) +
	xlim(0, 50) + ylim(0, 60)
dev.off()



ggplot(df[df$Source != "Lea", ], aes(Age, fill = Area, color = Area)) +
#	facet_wrap(facets = c("State")) +
	geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5)

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
#plot(growth$Age, growth$Length_cm, ylim = c(0,60), type = 'p')
#points(growth$Age[remove], growth$Length_cm[remove], col = 'red', pch = 20)
growth = growth[-remove,]

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
# Only Southern California- Survey Only
#============================================================================
sub_data = df[df$Source %in% c("Lea", "NWFSC_HKL", "NWFSC_WCGBT"), ]

growth = checkLenAge(Pdata = sub_data,
  Par = list(K = k, Linf = linf, L0 = l0, CV0 = 0.10, CV1 = 0.10),
  len_col = "Length_cm", age_col = "Age", sex_col = "Sex",
  mult = 1, keepAll = TRUE, sdFactor = 4, Optim = TRUE,
  precision = 1, verbose = FALSE)
remove = which(growth[,'Length_cm'] > growth[,'Lhat_high'] | growth[,'Length_cm'] < growth[,'Lhat_low'])
#plot(growth$Age, growth$Length_cm, ylim = c(0,60), type = 'p')
#points(growth$Age[remove], growth$Length_cm[remove], col = 'red', pch = 20)
growth = growth[-remove,]

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "southern_ca_growth_mop-up.png", w = 12, h = 7)
ggplot(growth, aes(Age, Length_cm)) + 
	geom_point(aes(colour =  Sex), size = 2, alpha = 0.75) +
	xlim(0,50) +  ylim(0, 60) +
	labs(title = "Southern California", y = "Length (cm)", x = "Age", cex = 1.5)
dev.off()

south_growth_orig <- list()
data = growth #growth[growth$Sex == "F", ]
south_growth_orig[[1]] <- optim(c(linf, l0, k), vb_opt_fn, 
		age = data$Age, lengths = data$Length_cm)$par	

sex = c("M","F")
for (a in 1:2){
	tmp = data[data$Sex %in% c(sex[a],"U"), ]
	south_growth_orig[[a+1]] <- optim(c(linf, l0, k), vb_opt_fn, 
		age = tmp$Age, lengths = tmp$Length_cm)$par
}
names(south_growth_orig) <- c("Combined", sex)

#============================================================================
# Only Northern California w/o Lea
#============================================================================
sub_data = df[df$Area %in% c("North_CA"), ]

growth = checkLenAge(Pdata = sub_data,
  Par = list(K = k, Linf = linf, L0 = l0, CV0 = 0.10, CV1 = 0.10),
  len_col = "Length_cm", age_col = "Age", sex_col = "Sex",
  mult = 1, keepAll = TRUE, sdFactor = 4, Optim = TRUE,
  precision = 1, verbose = FALSE)
remove = which(growth[,'Length_cm'] > growth[,'Lhat_high'] | growth[,'Length_cm'] < growth[,'Lhat_low'])

plot(growth$Age, growth$Length_cm, ylim = c(0,60), type = 'p')
points(growth$Age[remove], growth$Length_cm[remove], col = 'red', pch = 20)

growth = growth[-remove,]

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "north_ca_growth_mop-up_no_lea.png", w = 12, h = 7)
ggplot(growth, aes(Age, Length_cm)) + 
	geom_point(aes(colour =  Sex), size = 2) +
	xlim(0,50) +  ylim(0, 60) +
	labs(title = "Northern California", y = "Length (cm)", x = "Age", cex = 1.5)
dev.off()

north_growth_no_lea <- list()
data = growth 
north_growth_no_lea[[1]] <- optim(c(linf, l0, k), vb_opt_fn, 
		age = data$Age, lengths = data$Length_cm)$par	
sex = c("M", "F")
for (a in 1:2){
	tmp = data[data$Sex %in% c("U",sex[a]), ]
	north_growth_no_lea[[a+1]] <- optim(c(linf, l0, k), vb_opt_fn, 
		age = tmp$Age, lengths = tmp$Length_cm)$par
}
names(north_growth_no_lea) <- c("Combined", sex)

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
remove = c(remove) #, which(growth[,"Age"] >= 29))

plot(growth$Age, growth$Length_cm, ylim = c(0,60), type = 'p')
points(growth$Age[remove], growth$Length_cm[remove], col = 'red', pch = 20)
growth = growth[-remove,]

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

# Growth estimates do not change if fish > 28 are removed, indicating that the Linf is 
# being informed by the younger ages.


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
# All California - Fix Linf
#============================================================================
sub_data = df[df$Area %in% c("All", "North_CA", "South_CA"), ]
sub_data = sub_data[!sub_data$Source %in% c("NWFSC_WCGBT", "NWFSC_HKL"), ]

growth = checkLenAge(Pdata = sub_data,
  Par = list(K = 0.13, Linf = 45, L0 = 15, CV0 = 0.10, CV1 = 0.10),
  len_col = "Length_cm", age_col = "Age", sex_col = "Sex",
  mult = 1, keepAll = TRUE, sdFactor = 4, Optim = TRUE,
  precision = 1, verbose = FALSE)

remove = which(growth[,'Length_cm'] > growth[,'Lhat_high'] | growth[,'Length_cm'] < growth[,'Lhat_low'])
growth = growth[-remove,]

vb_fn_f <- function(age, L0, k) {
    #vec <- Linf * (1 - exp( -k * (age - t0)))
    vec <- 47.2 - (47.2 - L0) * exp(-age * k)
    return(vec)
}

vb_fn_m <- function(age, L0, k) {
    vec <- 46.6 - (46.6 - L0) * exp(-age * k)
    return(vec)
}

vb_opt_fn_fix_f <- function(x, age, lengths) { 
	sum( (lengths - vb_fn_f( age, L0 = x[2], k = x[3]) )^2 )
}

vb_opt_fn_fix_m <- function(x, age, lengths) { 
	sum( (lengths - vb_fn_m( age, L0 = x[2], k = x[3]) )^2 )
}

ca_growth_linf <- list()
tmp = data[data$Sex %in% c("M", "U"), ]
ca_growth_linf[[1]] <- optim(c(l0, k), vb_opt_fn_fix_m, age = tmp$Age, lengths = tmp$Length_cm)$par
tmp = data[data$Sex %in% c("F", "U"), ]
ca_growth_linf[[2]] <- optim(c(l0, k), vb_opt_fn_fix_f, age = tmp$Age, lengths = tmp$Length_cm)$par

names(ca_growth_linf) <- c("M", "F")

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
# Oregon/Washington - Only Fish less than 15
#============================================================================
find  = which(df$Area %in% c("All", "Oregon", "Washington") & df$Source != "Lea" & df$Age <= 15)
sub_data = df[find, ]

growth = checkLenAge(Pdata = sub_data,
  Par = list(K = 0.13, Linf = 45, L0 = 15, CV0 = 0.10, CV1 = 0.10),
  len_col = "Length_cm", age_col = "Age", sex_col = "Sex",
  mult = 1, keepAll = TRUE, sdFactor = 3, Optim = TRUE,
  precision = 1, verbose = FALSE)

remove = which(growth[,'Length_cm'] > growth[,'Lhat_high'] | growth[,'Length_cm'] < growth[,'Lhat_low'])
plot(growth$Age, growth$Length_cm, ylim = c(0,60), xlim = c(0, 50), type = 'p')
#points(growth$Age[remove], growth$Length_cm[remove], col = 'red', pch = 20)
#growth = growth[-remove,]

or_wa_growth_20 <- list()
data = growth #growth[growth$Sex == "F", ]
or_wa_growth_20[[1]] <- optim(c(linf, l0, k), vb_opt_fn, 
		age = data$Age, lengths = data$Length_cm)$par	
sex = c("M", "F")
for (a in 1:2){
	tmp = data[data$Sex %in% c(sex[a], "U"), ]
	or_wa_growth_20[[a+1]] <- optim(c(linf, l0, k), vb_opt_fn, 
		age = tmp$Age, lengths = tmp$Length_cm)$par
}
names(or_wa_growth_20) <- c("Combined", sex)


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
xmax = 60
pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "coastwide_growth_fits.png", w = 12, h = 12)

plot(0:xmax, vb_fn(age = 0:xmax, 
	Linf = south_growth$F[1], L0 = south_growth$F[2], k = south_growth$F[3]), 
	col = "red", type = 'l', ylim = c(0, 55), xlim = c(0, 50), lwd = 2,
	ylab = "Length (cm)", xlab = "Age", xaxs = 'i', yaxs = 'i')
lines(0:xmax, vb_fn(age = 0:xmax, 
	Linf = south_growth$M[1], L0 = south_growth$M[2], k = south_growth$M[3]), 
	col = "red", lty = 2, lwd = 2)
lines(0:xmax, vb_fn(age = 0:xmax, 
	Linf = north_growth$F[1], L0 = north_growth$F[2], k = north_growth$F[3]), 
	col = "darkorange", lty = 3, lwd = 2)
lines(0:xmax, vb_fn(age = 0:xmax, 
	Linf = north_growth$M[1], L0 = north_growth$M[2], k = north_growth$M[3]), 
	col = "darkorange", lty = 2, lwd = 2)
lines(0:xmax, vb_fn(age = 0:xmax, 
	Linf = or_wa_growth$F[1], L0 = or_wa_growth$F[2], k = or_wa_growth$F[3]), 
	col = "darkorchid4", lty = 1, lwd = 2)
lines(0:xmax, vb_fn(age = 0:xmax, 
	Linf = or_wa_growth$M[1], L0 = or_wa_growth$F[2], k = or_wa_growth$M[3]), 
	col = "darkorchid4", lty = 2, lwd = 2)
legend("topleft", bty = 'n', legend = c("Female", "Male"), lty = c(1, 2), col = c("grey50", "grey50"), lwd = 2, cex = 1.5)
legend("bottomright", bty = 'n', legend = c("South of Point Conception", "North of Point Conception", "Oregon-Washington"),
col = c("red", "darkorange", "darkorchid4"), lty = 1, lwd = 3, cex = 1.5)
dev.off()

#======================================================================================
# Northern CA with Growth Curves
#======================================================================================
xmax = 50
use = which(df$Area == "North_CA" | df$Source == "Lea" & df$Age != 0)
tmp = df[use, ]
colors = c(alpha("red", 0.2), alpha("blue", 0.2))

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "north_ca_growth_fits.png", w = 12, h = 12)
plot(tmp[tmp$Sex == "F", "Age"], tmp[tmp$Sex == "F", "Length_cm"], 
	col = colors[1], type = 'p', ylim = c(0, 60), xlim = c(0, 50), 
	ylab = "Length (cm)", xlab = "Age", yaxs = 'i', xaxs = 'i')
points(tmp[tmp$Sex == "F", "Age"], tmp[tmp$Sex == "F", "Length_cm"], col = colors[1], pch = 16)
points(tmp[tmp$Sex == "M", "Age"], tmp[tmp$Sex == "M", "Length_cm"], col = colors[2], pch = 16)
points(tmp[tmp$Source == "Lea", "Age"], tmp[tmp$Source == "Lea", "Length_cm"], col = 'grey', pch = 16)
lines(0:xmax, vb_fn(age = 0:xmax, 
	Linf = north_growth$F[1], L0 = north_growth$F[2], k = north_growth$F[3]), 
	col = "darkorange", lty = 1, lwd = 3)
lines(0:xmax, vb_fn(age = 0:xmax, 
	Linf = north_growth$M[1], L0 = north_growth$M[2], k = north_growth$M[3]), 
	col = "darkorange", lty = 2, lwd = 3)
lines(0:xmax, vb_fn(age = 0:xmax, 
	Linf = north_growth_no_lea$F[1], L0 = north_growth_no_lea$F[2], k = north_growth_no_lea$F[3]), 
	col = "forestgreen", lty = 1, lwd = 3)
lines(0:xmax, vb_fn(age = 0:xmax, 
	Linf = north_growth_no_lea$M[1], L0 = north_growth_no_lea$M[2], k = north_growth_no_lea$M[3]), 
	col = "forestgreen", lty = 2, lwd = 3)
lines(0:xmax, vb_fn(age = 0:xmax, 
	Linf = or_wa_growth$F[1], L0 = or_wa_growth$F[2], k = or_wa_growth$F[3]), 
	col = "darkorchid4", lty = 1, lwd = 3)
lines(0:xmax, vb_fn(age = 0:xmax, 
	Linf = or_wa_growth$M[1], L0 = or_wa_growth$F[2], k = or_wa_growth$M[3]), 
	col = "darkorchid4", lty = 2, lwd = 3)
legend("bottomright", bty = 'n', 
	legend = c("Northern CA w/o Lea - Female", "Northern CA w/o Lea - Female",
		       "Northern CA w/ Lea - Female", "Northern CA w/ Lea - Male",  
		       "Adopted Base Model Growth - Female", "Adopted Base Model Growth - Male"),
col = c(rep("forestgreen",2), rep("darkorange",2), rep("darkorchid4",2)), lty = rep(c(1, 2), 3), lwd = 3, cex = 1.5)
legend("topleft", bty = 'n', legend = c("Female", "Male", "Unsexed"), col = c('red', 'blue', 'grey'), 
	pch = rep(16, 3), cex = 1.5)
dev.off()

#======================================================================================
# Southern CA with Growth Curves
#======================================================================================
xmax = 50
use = which(df$Area == "South_CA" | df$Source == "Lea" & df$Age != 0)
tmp = df[use, ]
colors = c(alpha("red", 0.5), alpha("blue", 0.5))

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "south_ca_growth_fits.png", w = 12, h = 12)
plot(tmp[tmp$Sex == "F", "Age"], tmp[tmp$Sex == "F", "Length_cm"], 
	col = colors[1], type = 'p', ylim = c(0, 60), xlim = c(0, 50), 
	ylab = "Length (cm)", xlab = "Age", yaxs = 'i', xaxs = 'i')
points(tmp[tmp$Sex == "F", "Age"], tmp[tmp$Sex == "F", "Length_cm"], col = colors[1], pch = 16)
points(tmp[tmp$Sex == "M", "Age"], tmp[tmp$Sex == "M", "Length_cm"], col = colors[2], pch = 16)
points(df[df$Source == "Lea", "Age"], df[df$Source == "Lea", "Length_cm"], col = 'grey', pch = 16)
points(tmp[tmp$Sex == "F" & tmp$Source == "Research", "Age"], tmp[tmp$Sex == "F" & tmp$Source == "Research", "Length_cm"], col = 'red',  pch = 17, cex = 1.5)
points(tmp[tmp$Sex == "M" & tmp$Source == "Research", "Age"], tmp[tmp$Sex == "M" & tmp$Source == "Research", "Length_cm"], col = 'blue', pch = 17, cex = 1.5)

lines(0:xmax, vb_fn(age = 0:xmax, 
	Linf = south_growth$F[1], L0 = south_growth$F[2], k = south_growth$F[3]), 
	col = "darkorange", lty = 1, lwd = 3)
lines(0:xmax, vb_fn(age = 0:xmax, 
	Linf = south_growth$M[1], L0 = south_growth$M[2], k = south_growth$M[3]), 
	col = "darkorange", lty = 2, lwd = 3)
lines(0:xmax, vb_fn(age = 0:xmax, 
	Linf = 47.36, L0 = 2.5, k = 0.231), 
	col = "darkorchid4", lty = 1, lwd = 3)
lines(0:xmax, vb_fn(age = 0:xmax, 
	Linf = 47.09, L0 = 2.5, k = 0.238), 
	col = "darkorchid4", lty = 2, lwd = 3)
legend("topleft", bty = 'n', legend = c("New Estimates of Southern CA w/ Lea", "Adopted Base Model Growth"),
col = c("darkorange", "darkorchid4"), lty = c(1, 1), lwd = 3, cex = 1.5)
legend("bottomright", bty = 'n', legend = c("Female", "Male", "Unsexed"), col = c(colors, 'grey'), pch = 16,  cex = 1.5)
legend("right", bty = 'n', legend = c("Original Data", "New Data"),  col = c(colors[1], colors[1]), pch = c(16, 17),  cex = 1.5)

dev.off()

#======================================================================================
# CV at Age 
#======================================================================================

cv_age = aggregate(Length_cm~Age + Area, df[df$Age < 35, ], function(x) sd(x) / mean(x))

all = unique(cv_age[cv_age$Area != "All", "Area"])
color = c("darkorange", "darkorchid4", "red", "blue")

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "cv_by_age_area.png", w = 12, h = 12)
par(mfrow = c(2, 2))
for (a in 1:length(all)){
	plot(cv_age[cv_age$Area == all[a], "Age"], cv_age[cv_age$Area == all[a], "Length_cm"], type = 'p',
		xlim = c(0, 40), ylim = c(0, 0.20), xlab = "Age", ylab = "Coefficient of Variation", pch = 16,
		main = all[a], col = color[a])
}
dev.off()


#======================================================================================
# 95% of Linf
#======================================================================================

or_wa_f = vb_fn(age = 0:xmax,  Linf = or_wa_growth$F[1], L0 = or_wa_growth$F[2], k = or_wa_growth$F[3])
north_f = vb_fn(age = 0:xmax,  Linf = north_growth$F[1], L0 = north_growth$F[2], k = north_growth$F[3])
north_m = vb_fn(age = 0:xmax,  Linf = north_growth$M[1], L0 = north_growth$M[2], k = north_growth$M[3])

south_f = vb_fn(age = 0:xmax,  Linf = south_growth$F[1], L0 = south_growth$F[2], k = south_growth$F[3])
south_m = vb_fn(age = 0:xmax,  Linf = south_growth$M[1], L0 = south_growth$M[2], k = south_growth$M[3])

plot(0:xmax, or_wa_f / max(or_wa_f), type = 'l', lwd = 2, col = 'darkorchid4')
lines(0:xmax, north_f / max(north_f), lwd = 2, lty = 2, col = "darkorange")
lines(0:xmax, south_f / max(south_f), lwd = 2, lty = 3, col = 'red')
abline(h = 0.95, lty = 2)

#======================================================================================
# Random Draw from Oregon and Washington
#======================================================================================
sub_data = df[df$Area %in% c("All", "North_CA"),]
growth = checkLenAge(Pdata = sub_data,
  Par = list(K = k, Linf = linf, L0 = l0, CV0 = 0.10, CV1 = 0.10),
  len_col = "Length_cm", age_col = "Age", sex_col = "Sex",
  mult = 1, keepAll = TRUE, sdFactor = 4, Optim = TRUE,
  precision = 1, verbose = FALSE)
remove = which(growth[,'Length_cm'] > growth[,'Lhat_high'] | growth[,'Length_cm'] < growth[,'Lhat_low'])
growth = growth[-remove,]
growth = growth[,1:5]

ind = which(df$Area %in% c("Oregon", "Washington") & df$Age > 15)

set.seed(98103)
growth_mat = matrix(NA, 1000, 6)
colnames(growth_mat) = c("Linf_m", "L0_m", "k_m", "Linf_f", "L0_f", "k_f")
for (i in 1:1000){
	draw = sample(ind, size = 50, replace = TRUE)
	data = rbind(growth, df[draw, ])
	sex = c("M", "F")
	for (a in 1:2){
		if(a == 1){ loc = 1:3 
		} else {
			loc = 4:6 }
		tmp = data[data$Sex %in% c("U",sex[a]), ]
		growth_mat[i, loc]<- optim(c(linf, l0, k), vb_opt_fn, 
			age = tmp$Age, lengths = tmp$Length_cm)$par
	}
}
med = apply(growth_mat,2,median)
#      Linf_m       L0_m        k_m     Linf_f       L0_f        k_f 
#  45.2037925  5.1218189  0.2148898 46.3600876  5.9155253  0.1989568
ggplot(data, aes(Age, Length_cm)) + 
	geom_point(aes(colour =  Source), size = 3, alpha = 0.75) +
	xlim(0, 50) + ylim(0, 60)

vb_fn(age = 0:xmax,  Linf = med[4], L0 = med[5], k = med[6])
vb_fn(age = 0:xmax,  Linf = med[1], L0 = med[2], k = med[3])

#=================================================================================
# North of Point Conception Growth Curves Model
#=================================================================================
library(r4ss)
new_growth = SS_output("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/models/ca_n_pt_c/_sensitivities/10.3_base_council_growth_north")
est_growth = SS_output("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/models/ca_n_pt_c/_sensitivities/10.3_base_est_linf")
base = SS_output("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/models/ca_n_pt_c/10.3_base")

growdat <- base[["endgrowth"]][base[["endgrowth"]][["Seas"]] == 1, ]
growdat[["CV_Beg"]] <- growdat[["SD_Beg"]] / growdat[["Len_Beg"]]
# female growth
growdatF <- growdat[growdat[["Sex"]] == 1 & growdat[["Morph"]] == 1, ]
growdatF[["Sd_Size"]] <- growdatF[["SD_Beg"]]
growdatF[["high"]] <- qnorm(0.975, mean = growdatF[["Len_Beg"]], sd = growdatF[["Sd_Size"]])
growdatF[["low"]] <- qnorm(0.025, mean = growdatF[["Len_Beg"]], sd = growdatF[["Sd_Size"]])

growdatM <- growdat[growdat[["Sex"]] == 2 & growdat[["Morph"]] == 2, ]
growdatM[["Sd_Size"]] <- growdatM[["SD_Beg"]]
growdatM[["high"]] <- qnorm(0.975, mean = growdatM[["Len_Beg"]], sd = growdatM[["Sd_Size"]])
growdatM[["low"]]  <- qnorm(0.025, mean = growdatM[["Len_Beg"]], sd = growdatM[["Sd_Size"]])
xm <- growdatM[["Age_Beg"]]

shadecolvec = c(alpha('red', 0.1), alpha('blue', 0.10))

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "north_growth_model_comparison.png", w = 12, h = 12)
plot(growdatF[, "Age_Mid"], growdatF[, "Len_Beg"],
	type = 'l', lwd = 3, col = 'red', xlab = "Age", ylab = "Length (cm)", ylim = c(0, 60), xaxs = 'i', yaxs = 'i')
lines(growdatM[, "Age_Beg"], growdatM[, "Len_Beg"], lty = 2, col = 'red', lwd = 3)
polygon(c(xm, rev(xm)), c(growdatF[["low"]], rev(growdatF[["high"]])), border = NA, col = shadecolvec[1])
polygon(c(xm, rev(xm)), c(growdatM[["low"]], rev(growdatM[["high"]])), border = NA, col = shadecolvec[2])
lines(new_growth$endgrowth[new_growth$endgrowth$Sex == 1, "Age_Beg"], new_growth$endgrowth[new_growth$endgrowth$Sex == 1, "Len_Beg"], 
	lty = 1, col = 'darkgreen', lwd = 2)
lines(new_growth$endgrowth[new_growth$endgrowth$Sex == 2, "Age_Beg"], new_growth$endgrowth[new_growth$endgrowth$Sex == 2, "Len_Beg"], 
	lty = 2, col = 'darkgreen', lwd = 2)
lines(est_growth$endgrowth[est_growth$endgrowth$Sex == 1, "Age_Beg"], est_growth$endgrowth[est_growth$endgrowth$Sex == 1, "Len_Beg"], 
	lty = 1, col = 'darkorange', lwd = 2)
lines(est_growth$endgrowth[est_growth$endgrowth$Sex == 2, "Age_Beg"], est_growth$endgrowth[est_growth$endgrowth$Sex == 2, "Len_Beg"], 
	lty = 2, col = 'darkorange', lwd = 2)
legend('bottomright', bty = 'n', legend = c("Adopted Base Model", "Adopted Base Model - Linf Estimated", "New North CA External Estimates"),
	col = c('red', 'darkorange', 'darkgreen'), lwd = 2, lty = 1, cex = 1.5)
legend('topleft', bty = 'n', legend = c("Female", "Male"), col = c('red', 'red'), lwd = 2, lty = c(1,2), cex = 1.5)
dev.off()

#================================================================================

x <- SSsummarize(list(base, new_growth, est_growth))
modelnames = c("Base Model", "New North CA External Estimate", "North CA Model Estimate")

SSplotComparisons(x, 
				  endyrvec = 2021, 
                  legendlabels = modelnames, 
                  plotdir =  file.path(dir, "data", "biology", "plots"), 
                  legendloc = "topright", 
                  filenameprefix = "model_growth_comparison",
                  subplot = c(2, 4), 
                  print = TRUE, 
                  pdf = FALSE)

#=================================================================================
# North of Point Conception Model
#=================================================================================
# North of Point Conception Growth
# log( 413.295 / 163.51) = 0.93
# Model recommends downweighting the comp data further with the new growth
# After DW: log( 402.587 / 163.51) = 0.90
# Base Model when Linf Estimated
# log(222.33 / 163.51) = 0.31

# The sensitivity that estimated Linf for both sexes estimated
# Female = 47.13 cm and Male = 46.87 cm compared to the new external growth
# estimates for Linf of 45.27 and 44.26 cm.

# Likelihood with new growth estimates using Lea
# Total = 201.429; Com Length = 90.5535; Rec. Length = 109.641
# Base Model Likelihood
# Total = 188.8; Com Length = 85.79; Rec Length = 105.68
# Likelihood when Linf is estimated
# Total = 187.405; Com Length = 86.16; Rec Length = 102.585


#=================================================================================
# South of Point Conception Model
#=================================================================================
# log( 42.7202 / 42.2812) = 0.01
# North of Point Conception Growth w/ Lea
# log( 38.2532/ 42.2812) = 0.10 (depl = 19% with lower SB0)

