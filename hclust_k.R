hclust_model.silhouette =  c(NA, NA, NA, NA, cluster.stats(d = dist(dataset_7, method = "manhattan"), model_hclust_manh_avg_5_clusters)$avg.silwidth, cluster.stats(d = dist(dataset_7, method = "manhattan"), model_hclust_manh_avg_6_clusters)$avg.silwidth, cluster.stats(d = dist(dataset_7, method = "manhattan"), model_hclust_manh_avg_7_clusters)$avg.silwidth, cluster.stats(d = dist(dataset_7, method = "manhattan"), model_hclust_manh_avg_8_clusters)$avg.silwidth)


hclust_model.separation = c(NA, NA, NA, NA, cluster.stats(d = dist(dataset_7, method = "manhattan"), model_hclust_manh_avg_5_clusters)$average.between, cluster.stats(d = dist(dataset_7, method = "manhattan"), model_hclust_manh_avg_6_clusters)$average.between, cluster.stats(d = dist(dataset_7, method = "manhattan"), model_hclust_manh_avg_7_clusters)$average.between, cluster.stats(d = dist(dataset_7, method = "manhattan"), model_hclust_manh_avg_8_clusters)$average.between)

hclust_model.cohesion = c(NA, NA, NA, NA, cluster.stats(d = dist(dataset_7, method = "manhattan"), model_hclust_manh_avg_5_clusters)$average.within, cluster.stats(d = dist(dataset_7, method = "manhattan"), model_hclust_manh_avg_6_clusters)$average.within, cluster.stats(d = dist(dataset_7, method = "manhattan"), model_hclust_manh_avg_7_clusters)$average.within, cluster.stats(d = dist(dataset_7, method = "manhattan"), model_hclust_manh_avg_8_clusters)$average.within)

par(mfrow=c(3,1))
plot(hclust_model.silhouette, type='l', col = 'green', xlab = "clusters", xlim = c(5,8))
plot(hclust_model.cohesion, type='l', col = 'blue', xlab = "clusters", xlim = c(5,8))
plot(hclust_model.separation, type='l', col = 'red', xlab = "clusters", xlim = c(5,8))