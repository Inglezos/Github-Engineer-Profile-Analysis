hclust_eucl_avg_sil = c()
for (k in 3:16) {
  model = eclust(dataset_7, FUNcluster = "hclust", metric = "euclidean", method = "average", k = k)
  hclust_eucl_avg_sil(k) = model$silinfo$avg.width
}

hclust_eucl_compl_sil = c()
for (k in 3:16) {
  model = eclust(dataset_7, FUNcluster = "hclust", metric = "euclidean", method = "complete", k = k)
  hclust_eucl_compl_sil(k) = model$silinfo$avg.width
}

hclust_manh_avg_sil = c()
for (k in 3:16) {
  model = eclust(dataset_7, FUNcluster = "hclust", metric = "manhattan", method = "average", k = k)
  hclust_manh_avg_sil(k) = model$silinfo$avg.width
}

hclust_manh_compl_sil = c()
for (k in 3:16) {
  model = eclust(dataset_7, FUNcluster = "hclust", metric = "manhattan", method = "complete", k = k)
  hclust_manh_compl_sil(k) = model$silinfo$avg.width
}

fanny_sil = c()
for (k in 3:16) {
  model = eclust(dataset_7, FUNcluster = "fanny", k = k)
  fanny_sil(k) = model$silinfo$avg.width
}

kmeans_sil = c()
for (k in 3:16) {
  model = eclust(dataset_7, FUNcluster = "kmeans", k = k)
  kmeans_sil(k) = model$silinfo$avg.width
}