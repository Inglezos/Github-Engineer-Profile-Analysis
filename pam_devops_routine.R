# best for k = 4
devops_pam = pam(devops_detailed_dataset_filtered, k = 4)
devops_pam$silinfo
devops_pam$clusinfo
table(devops_pam$clustering)