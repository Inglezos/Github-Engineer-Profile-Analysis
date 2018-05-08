# best for k = 6
rm(ops_pam,ops_pam_copy,ops_pam_sub,ops_sub)
ops_pam = pam(ops_detailed_dataset_filtered, k = 6)
ops_pam$silinfo
ops_pam$clusinfo
table(ops_pam$clustering)

# NOT the following code
ops_sub = ops_detailed_dataset_filtered[ops_pam$clustering==5,]
ops_pam_sub = pam(ops_sub, k = 3)
ops_pam_sub$silinfo
ops_pam_sub$clusinfo
table(ops_pam$clustering)
table(ops_pam_sub$clustering)
ops_pam_copy = ops_pam
ops_pam$clustering[ops_pam$clustering>5] = ops_pam$clustering[ops_pam$clustering>5] + 2
ops_pam$clustering[ops_pam$clustering==4] = 7
ops_pam$clustering[ops_pam$clustering==3] = 6
ops_pam$clustering[ops_pam$clustering==5] = 3
ops_pam$clustering[ops_pam$clustering==2] = 5
ops_pam$clustering[ops_pam$clustering==1] = 4
ops_pam$clustering[ops_pam$clustering==3] = ops_pam_sub$clustering
table(ops_pam$clustering)