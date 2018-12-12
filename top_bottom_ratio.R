
top.bottom.ratio <- function(x) {
  
  ratios <- c()
  
  for (i in c(1:length(mnist[,i]))) {
    row <- mnist[i,]
    top <- sum(row[2:393])
    bottom <- sum(row[394:785])
    
    ratio <- (top / bottom)
    
    ratios <- c(ratios, ratio)
    print(i)
  }
  
  return(ratios)
}