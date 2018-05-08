setwd("C:\\Users\\BabisI\\Desktop\\ÔÇÌÌÕ 9ï ÅîÜìçíï (ÔïìÝáò ÇëåêôñïíéêÞò êáé Õðïëïãéóôþí)\\Áíáãíþñéóç Ðñïôýðùí\\Åñãáóßá")

dataset = read.csv("dataset.csv", sep=';', header = TRUE, na.strings = c("NA"), colClasses = c("character", "character", "numeric", "numeric", "integer", "integer", "integer", "numeric", "numeric", "integer", "integer", "integer", "integer", "integer", "integer", "numeric", "integer", "integer", "integer", "integer", "integer", "integer", "integer", "integer", "integer", "integer", "integer"))

dataset_2 = dataset[dataset$activity_period_in_days>0,]

dim(dataset_2)

temp_quantile_1 = quantile(dataset_2$inactive_period_within_active_period, probs = 0.9)

dataset_3 = dataset_2[dataset_2$inactive_period_within_active_period <= temp_quantile_1,]

dataset_4 = dataset_3[,c(-1,-2)]

temp_quantile_2 = quantile(dataset_4$tot_additions, probs = 0.999)

dataset_5 = dataset_4[dataset_4$tot_additions <= temp_quantile_2,]

temp_quantile_3 = quantile(dataset_4$tot_deletions, probs = 0.999)

dataset_5 = dataset_5[dataset_5$tot_deletions <= temp_quantile_3,]

dim(dataset_5)

# Run "impute_NA.R" script to initialize function in the "Environment"...

dataset_6 = impute_NA(dataset_5, c(1,7))

# Install library "mice" -> install.packages("mice")

library(mice)

miceMod <- mice(dataset_6[, !names(dataset_5) %in% "medv"], method="rf")

miceOutput <- complete(miceMod)

dataset_7 = miceOutput

dim(dataset_7)

summary(dataset_7)


# Install these packages: "factoextra", eclust", "clValid", "fpc"

library(factoextra)
library(fpc)
library(clValid)
library(eclust)

# I tried the following algorithms for many values of k, manually. Some indicative are:

model_kmeans_7 = kmeans(dataset_7, centers = 7)

model_fanny_5 = fanny(dataset_7, k = 5)
model_fanny_6 = fanny(dataset_7, k = 6)
model_fanny_7 = fanny(dataset_7, k = 7)

model_diana_5 = eclust(dataset_7, FUNcluster = "diana", hc_metric = "euclidean", k = 5)
model_diana_6 = eclust(dataset_7, FUNcluster = "diana", hc_metric = "euclidean", k = 6)
model_diana_7 = eclust(dataset_7, FUNcluster = "diana", hc_metric = "euclidean", k = 7)

model_agnes_6 = eclust(dataset_7, FUNcluster = "agnes", hc_metric = "euclidean", hc_method = "average", k = 6)

model_hclust_manhattan_avg_6 = hclust(dist(dataset_7, method = "manhattan"), method = "average")

model_hclust_manh_avg_6_clusters = cutree(model_hclust_manhattan_avg_6, k = 6)

# For the kmeans, fanny, diana and hclust performance plots, run the scripts: kmeans_k.R, fanny_k.R, diana_k.R, hclust_k.R

# For the pam performance plot, run the script: pam_k.R

# Now run the script: pam_routine.R for implementing the pam algorithm two times, as explained in the report.

# Merging the uncategorized clusterings into one -> now we have 13 clusterings in total.

pam_final$clustering[pam_final$clustering==2 | pam_final$clustering==5] = 1
table(pam_final$clustering)
pam_final$clustering[pam_final$clustering==3] = 2
pam_final$clustering[pam_final$clustering==4] = 3
pam_final$clustering[pam_final$clustering>3] = pam_final$clustering[pam_final$clustering>3] - 2
table(pam_final$clustering)

# For each metric, the reader can study the boxplots for the pam_final model. I.e.:
boxplot(dataset_final$metric ~ pam_final$clustering)



# Further profile analysis


# Dev

dev_detailed_dataset = dataset_7[pam_final$clustering == 8 | pam_final$clustering == 11 | pam_final$clustering == 13,]
dim(dev_detailed_dataset)

dev_detailed_dataset_filtered = dev_detailed_dataset[,c(-1,-2,-3,-4,-5,-6,-7)]
dim(dev_detailed_dataset_filtered)

# Run the script pam_dev_routine.R to implement the pam clustering algorithm to the dev_detailed_dataset_filtered.
table(dev_pam$clustering)
# Change accordingly for each boxplot the y axis limits for the results to be properly presented. I.e.:
boxplot(dev_detailed_dataset_filtered$total_lines_of_code_changed ~ dev_pam$clustering, ylim=c(0,200000))



# Ops

ops_detailed_dataset = dataset_7[pam_final$clustering == 2 | pam_final$clustering == 3 | pam_final$clustering == 4 | pam_final$clustering == 5 | pam_final$clustering == 9,]
dim(ops_detailed_dataset)

ops_detailed_dataset_filtered = ops_detailed_dataset[,c(-8,-9,-10,-11,-15,-16,-22,-23,-24,-25)]
dim(ops_detailed_dataset_filtered)
# Run the script pam_ops_routine.R to implement the pam clustering algorithm to the ops_detailed_dataset_filtered.
table(ops_pam$clustering)
# Change accordingly for each boxplot the y axis limits for the results to be properly presented. I.e.:
boxplot(ops_detailed_dataset_filtered$average_time_to_close_issues ~ ops_pam$clustering, ylim=c(0,25))



# DevOps

devops_detailed_dataset = dataset_7[pam_final$clustering == 6 | pam_final$clustering == 7 | pam_final$clustering == 10 | pam_final$clustering == 12,]
dim(devops_detailed_dataset)

devops_detailed_dataset_filtered = devops_detailed_dataset

# Run the script pam_devops_routine.R to implement the pam clustering algorithm to the devops_detailed_dataset_filtered.
table(devops_pam$clustering)
# Change accordingly for each boxplot the y axis limits for the results to be properly presented. I.e.:
boxplot(devops_detailed_dataset_filtered$commits_authored ~ devops_pam$clustering, ylim=c(0,7000))
boxplot(devops_detailed_dataset_filtered$tot_additions ~ devops_pam$clustering, ylim=c(0,2500000))

