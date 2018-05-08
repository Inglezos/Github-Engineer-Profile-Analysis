rm(pam_m,pam_m_copy,pam_m_sub, subdata)
pam_m = pam(dataset_final, k = 8) # The number of initial clusters.
pam_m$silinfo
pam_m$clusinfo
subdata = dataset_final[pam_m$clustering==3,] # The biggest cluster (here the third) I want to further divide.
pam_m_sub = pam(subdata, k = 8) # The number of sub-clusters.
pam_m_sub$silinfo
pam_m_sub$clusinfo
table(pam_m$clustering)
table(pam_m_sub$clustering)
pam_copy = pam_m
pam_m$clustering[pam_m$clustering>3] = pam_m$clustering[pam_m$clustering>3] + 7
pam_m$clustering[pam_m$clustering<3] = pam_m$clustering[pam_m$clustering<3] + 8
pam_m$clustering[pam_m$clustering==3] = 1
pam_m$clustering[pam_m$clustering==1] = pam_m_sub$clustering
table(pam_m$clustering)
pam_final = pam_m