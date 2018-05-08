kmeans_mean_silhouette <- c()
kmeans_cohesion <- c()
kmeans_separation <- c()
for (k in 2:21){
  kmeans_model = kmeans(dataset_7, centers = k, iter.max = 300)
  kmeans_model_silhouette = silhouette(kmeans_model$cluster, dist(dataset_7))
  kmeans_mean_silhouette[k] = mean(kmeans_model_silhouette[, 3])
  kmeans_cohesion[k] = kmeans_model$tot.withinss
  kmeans_separation[k] = kmeans_model$betweenss
}

par(mfrow=c(3,1))
plot(kmeans_mean_silhouette, type='l', col = 'green', xlab = "clusters")
plot(kmeans_cohesion, type='l', col = 'blue', xlab = "clusters")
plot(kmeans_separation, type='l', col = 'red', xlab = "clusters")