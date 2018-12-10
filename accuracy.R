
accuracy <- function(matrix) {
  x <- length(matrix[1,])
  y <- length(matrix[,1])
  
  if ( x == y) {
    sum.true <- 0
    total <- 0
    
    for (i in c(1:x)) {
      true <- matrix[i,i]
      
      sum.true <- sum.true + true
      total <- total + sum(matrix[i,])
      
    }
    
    accuracy <- sum.true / total
    
    return(accuracy)
    
  }
  else {
    print("the matrix should contain the same amount of rows and columns")
  }
}