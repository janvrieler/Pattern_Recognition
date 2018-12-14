sparse.pixels = c()

for (i in c(2:length(cropped.mnist[1:197]))){
  if (sum(cropped.mnist[,i]) < 5000) {
    sparse.pixels <- c(cropped.mnist, i)
  }
  print (sum(mnist.cropped[,i]))
}