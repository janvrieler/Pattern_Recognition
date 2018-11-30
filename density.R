for (i in c(1:42000)) {
  density[i] <- sum(mnist.features[i,])
  print (i)
  
}