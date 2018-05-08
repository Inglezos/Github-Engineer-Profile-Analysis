# (3 and 4) or (3 and 6) or best for (3 and 8)
rm(dev_pam,dev_pam_copy,dev_pam_sub,dev_sub)
dev_pam = pam(dev_detailed_dataset_filtered, k = 3)
dev_pam$silinfo
dev_pam$clusinfo
dev_sub = dev_detailed_dataset_filtered[dev_pam$clustering==1,]
dev_pam_sub = pam(dev_sub, k = 8)
dev_pam_sub$silinfo
dev_pam_sub$clusinfo
table(dev_pam$clustering)
table(dev_pam_sub$clustering)
dev_pam_copy = dev_pam
dev_pam$clustering[dev_pam$clustering>1] = dev_pam$clustering[dev_pam$clustering>1] + 7
dev_pam$clustering[dev_pam$clustering<1] = dev_pam$clustering[dev_pam$clustering<1] + 8
dev_pam$clustering[dev_pam$clustering==1] = 1
dev_pam$clustering[dev_pam$clustering==1] = dev_pam_sub$clustering
table(dev_pam$clustering)