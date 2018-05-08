fanny_mean_silhouette = c()
fanny_cohesion = c()
fanny_separation = c()
for (k in 4:10){
  fanny_model = eclust(dataset_7, FUNcluster = "fanny", hc_metric = "euclidean", k = k)
  fanny_model_silhouette = silhouette(fanny_model$cluster, dist(dataset_7))
  fanny_mean_silhouette[k] = mean(fanny_model_silhouette[, 3])
  temp = cluster.stats(d = dist(dataset_7, method = "euclidean"), fanny_model$clustering)
  fanny_cohesion[k] = temp$average.within
  fanny_separation[k] = temp$average.between
}

par(mfrow=c(3,1))
plot(fanny_mean_silhouette, type='l', col = 'green', xlab = "clusters", xlim = c(4,10))
plot(fanny_cohesion, type='l', col = 'blue', xlab = "clusters", xlim = c(4,10))
plot(fanny_separation, type='l', col = 'red', xlab = "clusters", xlim = c(4,10))



# or...

fanny_model.silhouette = c(NA, NA, model_fanny_3$silinfo$avg.width, model_fanny_4$silinfo$avg.width, model_fanny_5$silinfo$avg.width, model_fanny_6$silinfo$avg.width, model_fanny_7$silinfo$avg.width, model_fanny_8$silinfo$avg.width)

fanny_model.separation = c(NA, NA, cluster.stats(d = dist(dataset_7, method = "euclidean"), model_fanny_3$clustering)$average.between, cluster.stats(d = dist(dataset_7, method = "euclidean"), model_fanny_4$clustering)$average.between, cluster.stats(d = dist(dataset_7, method = "euclidean"), model_fanny_5$clustering)$average.between, cluster.stats(d = dist(dataset_7, method = "euclidean"), model_fanny_6$clustering)$average.between, cluster.stats(d = dist(dataset_7, method = "euclidean"), model_fanny_7$clustering)$average.between, cluster.stats(d = dist(dataset_7, method = "euclidean"), model_fanny_8$clustering)$average.between)

fanny_model.cohesion = c(NA, NA, cluster.stats(d = dist(dataset_7, method = "euclidean"), model_fanny_3$clustering)$average.within, cluster.stats(d = dist(dataset_7, method = "euclidean"), model_fanny_4$clustering)$average.within, cluster.stats(d = dist(dataset_7, method = "euclidean"), model_fanny_5$clustering)$average.within, cluster.stats(d = dist(dataset_7, method = "euclidean"), model_fanny_6$clustering)$average.within, cluster.stats(d = dist(dataset_7, method = "euclidean"), model_fanny_7$clustering)$average.within, cluster.stats(d = dist(dataset_7, method = "euclidean"), model_fanny_8$clustering)$average.within)

par(mfrow=c(3,1))
plot(fanny_model.silhouette, type='l', col = 'green', xlab = "clusters", xlim = c(3,8))
plot(fanny_model.cohesion, type='l', col = 'blue', xlab = "clusters", xlim = c(3,8))
plot(fanny_model.separation, type='l', col = 'red', xlab = "clusters", xlim = c(3,8))