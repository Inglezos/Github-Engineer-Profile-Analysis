pam_mean_silhouette = c()
pam_cohesion = c()
pam_separation = c()
for (k in 4:10){
  pam_model = pam(dataset_7, metric = "euclidean", k = k)
  pam_mean_silhouette[k] = pam_model$silinfo$avg.width
  temp = cluster.stats(d = dist(dataset_7, method = "euclidean"), pam_model$clustering)
  pam_cohesion[k] = temp$average.within
  pam_separation[k] = temp$average.between
}

par(mfrow=c(3,1))
plot(pam_mean_silhouette, type='l', col = 'green', xlab = "clusters", xlim = c(4,10))
plot(pam_cohesion, type='l', col = 'blue', xlab = "clusters", xlim = c(4,10))
plot(pam_separation, type='l', col = 'red', xlab = "clusters", xlim = c(4,10))