impute_NA <- function(data , columns){
  n = length(columns)
  for (i in 1:n){
    cur_col = data[, columns[i]]
    cur_col[is.na(cur_col)] = 0
    data[, columns[i]] = cur_col
  }
  return(data)
}
