diana_mean_silhouette <- c()
diana_cohesion <- c()
diana_separation <- c()
for (k in 4:10){
  diana_model = eclust(dataset_7, FUNcluster = "diana", hc_metric = "euclidean", k = k)
  diana_model_silhouette = silhouette(diana_model$cluster, dist(dataset_7))
  diana_mean_silhouette[k] = mean(diana_model_silhouette[, 3])
  temp = cluster.stats(d = dist(dataset_7, method = "euclidean"), diana_model$clustering)
  diana_cohesion[k] = temp$average.within
  diana_separation[k] = temp$average.between
}


par(mfrow=c(3,1))
plot(diana_mean_silhouette, type='l', col = 'green', xlab = "clusters", xlim = c(5,8))
plot(diana_cohesion, type='l', col = 'blue', xlab = "clusters", xlim = c(5,8))
plot(diana_separation, type='l', col = 'red', xlab = "clusters", xlim = c(5,8))




# or...

diana_model.silhouette = c(NA, NA, NA, NA, model_diana_5$silinfo$avg.width, model_diana_6$silinfo$avg.width, model_diana_7$silinfo$avg.width, model_diana_8$silinfo$avg.width)

diana_model.separation = c(NA, NA, NA, NA, cluster.stats(d = dist(dataset_7, method = "euclidean"), model_diana_5$cluster)$average.between, cluster.stats(d = dist(dataset_7, method = "euclidean"), model_diana_6$cluster)$average.between, cluster.stats(d = dist(dataset_7, method = "euclidean"), model_diana_7$cluster)$average.between, cluster.stats(d = dist(dataset_7, method = "euclidean"), model_diana_8$cluster)$average.between)

diana_model.cohesion = c(NA, NA, NA, NA, cluster.stats(d = dist(dataset_7, method = "euclidean"), model_diana_5$cluster)$average.within, cluster.stats(d = dist(dataset_7, method = "euclidean"), model_diana_6$cluster)$average.within, cluster.stats(d = dist(dataset_7, method = "euclidean"), model_diana_7$cluster)$average.within, cluster.stats(d = dist(dataset_7, method = "euclidean"), model_diana_8$cluster)$average.within)

par(mfrow=c(3,1))
plot(diana_model.silhouette, type='l', col = 'green', xlab = "clusters", xlim = c(5,8))
plot(diana_model.cohesion, type='l', col = 'blue', xlab = "clusters", xlim = c(5,8))
plot(diana_model.separation, type='l', col = 'red', xlab = "clusters", xlim = c(5,8))