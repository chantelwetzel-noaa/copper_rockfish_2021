all = read.csv("C:/Assessments/2020/assess_prioritization/survey_data/pulls/bio_collected_pull_01152020.csv")


ages = read.csv("//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/survey/NWFSC_Combo_2004-2017_COPP_AgeData_20210129.csv")

find = which(all$common_name == "copper rockfish")
copper = all[find,]
otosag_id
ages$otosag_id = ages$Barcode
Barcode

test = merge(all, ages, by = "otosag_id")

out = test[, c("common_name", "year", "depth_m", "latitude_dd", "length_cm", "sex", "Age", "otosag_id", "Barcode")]

f = which(out$sex == "F")
plot(out$Age[f], out$length_cm[f], col = 'red', xlim = c(0, 50), ylim = c(0, 60))
m = which(out$sex == "M")
points(out$Age[m], out$length_cm[m], col = 'blue')

write.csv(out, 
file = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/survey/wcgbts_ages.csv")

dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data/survey"
hkl_age = read.csv(file.path(dir, "nwfsc_hkl_ages.csv"))

col = c("blue", 'purple', 'pink', 'red')

f = which(out$sex == "F")
plot(out$Age[f], out$length_cm[f], col = 'red', xlim = c(0, 50), ylim = c(0, 60),
	xlab = "Age", ylab = "Length (cm)")
points(out$Age[f], out$length_cm[f], pch = 16, col = 'red')
m = which(out$sex == "M")
points(out$Age[m], out$length_cm[m], col = 'blue', pch = 1, cex = 1.5)
f = which(hkl_age$Sex == "F")
points(hkl_age$final_age[f], hkl_age$length_cm[f], col = 'red4', pch = 2)
m = which(hkl_age$Sex == "M")
points(hkl_age$final_age[m], hkl_age$length_cm[m], col = 'navyblue', pch = 2)


