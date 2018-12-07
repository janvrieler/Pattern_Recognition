sparse.pixels = c()

for (i in c(1:length(mnist.features))){
  if (sum(mnist.features[,i]) < 1000) {
    sparse.pixels <- c(sparse.pixels, i)
  }
  print (sum(mnist.features[,i]))
}