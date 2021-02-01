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

################################################################################################
# Read in the csv and Rdat files with age data
################################################################################################
library(ggplot2)
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/dataModerate_2021")

dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/DataModerate_2021/copper_rockfish/data"
hkl_age = read.csv(file.path(dir, "survey", "nwfsc_hkl_ages.csv"))
hkl = data.frame(Length = hkl_age$length_cm,
			Age = hkl_age$final_age,
			Sex = hkl_age$Sex, 
			Source = "NWFSC HKL")

combo_age = read.csv(file.path(dir, "survey", "wcgbts_ages.csv"))
combo = data.frame(Length = combo_age$length_cm, 
				   Age = combo_age$Age, 
				   Sex = combo_age$sex,
				   Source = "NWFSC WCGBT")

load(file.path(dir, "biology", "age_length_only.Rdat"))

data_list <- list()
data_list[[1]] = hkl
data_list[[2]] = combo
data_list[[3]] = df

all_data = NA
for (a in 1:length(data_list)){
	tmp  <- data.frame( Sex    = data_list[[a]]$Sex,
						Length = data_list[[a]]$Length,
						Age    = data_list[[a]]$Age,
						Source = data_list[[a]]$Source)
	all_data = rbind(all_data, tmp)			
}

all_data = all_data[-1,] 
aggregate(Age~Source, all_data, quantile)

ggplot(all_data, aes(Age, fill = Source, color = Source)) +
	facet_wrap(facets = c("Source")) +
	geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5, bw = 1)

# Estimate with all data
len_age <- estimate_length_age(data = all_data)

# Remove the stupid Lea data & Split between survey & fishery data
tmp = all_data[all_data$Source != "Lea", ]
find = which(tmp$Source %in% c("NWFSC HKL", "NWFSC WCGBT"))
tmp$Source[find] = "Survey"
tmp$Source[-find] = 'Fishery'
len_age_south <- estimate_length_age(data = tmp)

# Use young fishery and only survey data for older ages
tmp = all_data
find = which(tmp$Source %in% c("NWFSC HKL", "NWFSC WCGBT"))
tmp$Source[find] = "Survey"
tmp$Source[-find] = 'Fishery'
aggregate(Age~Source + Sex, tmp, quantile)
ggplot(tmp, aes(Age, fill = Source, color = Source)) +
	facet_wrap(facets = c("Source")) +
	geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5, bw = 1)

remove = which(tmp$Source == "Fishery" & tmp$Age > 10 )
estimate_length_age(data = tmp[remove,])
# $all_F
#        90%        90%            
# 48.3359166 16.2778954  0.1664488 
# $all_M
#       90%       90%           
# 38.162018 12.362729  7.212907 
plot(tmp[-remove, "Age"], tmp[-remove, "Length"])
ggplot(tmp, aes(Age, fill = Sex, color = Sex)) +
	facet_wrap(facets = c("Sex")) +
	geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5, bw = 1)






line_col = c("red", 'blue')
sex_col = alpha(line_col, 0.5)
tmp = all_data[all_data$Source %in% c("NWFSC HKL", "NWFSC WCGBT"), ]
lens = 1:max(tmp$Length, na.rm = TRUE)
xmax = max(tmp$Age + 2,    na.rm = TRUE)
ymax = max(tmp$Length + 5, na.rm = TRUE)

pngfun(wd = file.path(dir, "biology", "plots"), file = "South_Len_at_Age.png", w = 12, h = 7, pt = 12)
par(mfrow = c(1, 1))
ind = which(tmp$Sex == 'F' & tmp$Source == "NWFSC HKL")
plot(tmp[ind, "Age"], tmp[ind, "Length"], xlab = "Age", ylab = "Length (cm)",
	xaxs = "i", yaxs = "i",ylim = c(0, ymax), xlim = c(0, xmax), pch = 1, col = sex_col[1]) 
points(tmp[ind, "Age"], tmp[ind, "Length"], pch = 16, col = sex_col[1])
ind = which(tmp$Sex == 'M' & tmp$Source == "NWFSC HKL")
points(tmp[ind, "Age"], tmp[ind, "Length"], pch = 16, col = sex_col[2])
ind = which(tmp$Sex == 'F' & tmp$Source == "NWFSC WCGBT")
points(tmp[ind, "Age"], tmp[ind, "Length"], pch = 2, col = sex_col[1], cex = 1.25)
ind = which(tmp$Sex == 'M' & tmp$Source == "NWFSC WCGBT")
points(tmp[ind, "Age"], tmp[ind, "Length"], pch = 2, col = sex_col[2], cex = 1.25)
#lines(0:xmax, 47.3 * (1 - exp(-0.23 * (0:xmax + 1.00))), col = 'red',  lty = 3, lwd = 2)
#lines(0:xmax, 46.8 * (1 - exp(-0.22 * (0:xmax + 0.47))), col = 'blue', lty = 3, lwd = 2) 
#
#lines(0:ymax, vb_fn(age = 0:ymax, Linf = 47.3, L0 = 15.7, k = 0.152), 
#	col = line_col[1], lty = 2, lwd = 2)
#lines(0:ymax, vb_fn(age = 0:ymax, Linf = 46.8, L0 = 13.9, k = 0.182), 
#	col = line_col[2], lty = 2, lwd = 2)	

leg = c("NWFSC HKL Females", "NWFSC HKL Males",
		"NWFSC WCGBT Females", "NWFSC WCGBT Males")
legend("bottomright", bty = 'n', legend = leg, pch = c(16, 16, 2, 2), 
	col = c(sex_col, sex_col), lwd = 2, cex = 1.25)
dev.off()



sex_col = c(alpha("green", 0.50), alpha("purple", 0.75))
tmp = all_data[all_data$Source != "Lea", ]
tmp[689, "Length"] = tmp[689, "Length"]*10 

pngfun(wd = file.path(dir, "biology", "plots"), file = "South_Data_Comparison_Len_at_Age.png", w = 12, h = 7, pt = 12)
par(mfrow = c(1, 1))
ind = which(!tmp$Source %in% c("NWFSC HKL", "NWFSC WCGBT"))
plot(tmp[ind, "Age"], tmp[ind, "Length"], xlab = "Age", ylab = "Length (cm)",
	xaxs = "i", yaxs = "i",ylim = c(0, ymax), xlim = c(0, xmax), pch = 1, col = sex_col[1]) 
points(tmp[ind, "Age"], tmp[ind, "Length"], pch = 16, col = sex_col[1])
points(tmp[-ind, "Age"], tmp[-ind, "Length"], pch = 16, col = sex_col[2])

legend("bottomright", bty = 'n', 
		legend = c("Oregon & Washington Data", "South of Pt. Conception"), 
		col = sex_col, pch = 16, cex = 1.5)
dev.off()

library(plyr)
all_data$len_bin = plyr::round_any(all_data$Len, 2.0)
tmp = all_data[all_data$Source %in% c("NWFSC HKL", "NWFSC WCGBT"),]
table(tmp$len_bin, tmp$Source)
table(tmp$Age, tmp$Source)