remove_outliers <- function(x) {
  for (j in 1:length(x))  {  
    qnt <- quantile(x[,j], probs=c(.25, .75))
    H <- 1.5 * IQR(x[,j])
    for (i in 1:dim(x)[1])  {
      x[which(x[i,j] < (qnt[1] - H)), ] <- NA
      x[which(x[i,j] > (qnt[2] + H)), ] <- NA
    }
    x = x[complete.cases(x),]
  }
  return(x)
}