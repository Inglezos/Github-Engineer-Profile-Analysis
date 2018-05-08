mean_agg_sil_eucl_avg = c()

agg_model = agnes(dataset_7, metric = 'euclidean', method = 'average')
for (k_param in 2:21) {
  cut_agg_model = cutree(agg_model, k = k_param)
  agg_silh = silhouette(cut_agg_model, dist(dataset_7))
  mean_agg_sil_eucl_avg[k_param] = mean(agg_silh[,3])
}

mean_agg_sil_eucl_compl = c()

agg_model = agnes(dataset_7, metric = 'euclidean', method = 'complete')
for (k_param in 2:21) {
  cut_agg_model = cutree(agg_model, k = k_param)
  agg_silh = silhouette(cut_agg_model, dist(dataset_7))
  mean_agg_sil_eucl_compl[k_param] = mean(agg_silh[,3])
}

mean_agg_sil_manh_avg = c()

agg_model = agnes(dataset_7, metric = 'manhattan', method = 'average')
for (k_param in 2:21) {
  cut_agg_model = cutree(agg_model, k = k_param)
  agg_silh = silhouette(cut_agg_model, dist(dataset_7))
  mean_agg_sil_manh_avg[k_param] = mean(agg_silh[,3])
}

mean_agg_sil_manh_compl = c()

agg_model = agnes(dataset_7, metric = 'manhattan', method = 'complete')
for (k_param in 2:21) {
  cut_agg_model = cutree(agg_model, k = k_param)
  agg_silh = silhouette(cut_agg_model, dist(dataset_7))
  mean_agg_sil_manh_compl[k_param] = mean(agg_silh[,3])
}