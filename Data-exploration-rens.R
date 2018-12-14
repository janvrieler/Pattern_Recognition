library(readr)
mnist <- read_csv("C:/Users/Rens/Downloads/mnist.csv")

sparse.pixels = c()

for (i in c(1:length(mnist.features))){
  if (sum(mnist.features[,i]) < 1000) {
    sparse.pixels <- c(sparse.pixels, i)
  }
  print (sum(mnist.features[,i]))
}
#do not throw away the label column
sparse.pixels <- sparse.pixels + 1

density <- c()
total <- 42000
  
# create progress bar - TAKES ABOUT 75 MIN TO CALCULATE THE DENSITY for 42000 obs
pb <- txtProgressBar(title = "progress bar", min = 0,
                       max = total, style = 3)
old.time <- Sys.time()
for (i in 1:total) {
  density <- rbind(density, sum(mnist[i,-sparse.pixels]))
  Sys.sleep(0.1)
  setTxtProgressBar(pb, i)
}
close(pb)
difftime(Sys.time(), old.time)

#continue with first 1000 obs of the mnist dataset
part.mnist <- mnist[1:total,-sparse.pixels]
new_mnist <- cbind(part.mnist, density)

#creates summary per label
ink.summary <- tapply(new_mnist$density, new_mnist$label, summary)
#creates vec of means per label
ink.mean <- tapply(new_mnist$density, new_mnist$label, mean)
#creates vec of std deviation per label
ink.sd <- tapply(new_mnist$density, new_mnist$label, sd)

#boxplot of pixel density
boxplot(new_mnist$density ~ new_mnist$label, xlab = "Labels", ylab = "Pixel density", main = "Boxplot summary per label")

#fit logistic multinomial regression model
mnist_multinom <- multinom(label ~ scale(density), data = new_mnist, maxit = 1000)
#create prediction model
pred.mnist_multinom <- predict(mnist_multinom, new_mnist[, 635], type="class")

#produce confusion matrix
confmat <- table(new_mnist[,1], pred.mnist_multinom)
print(confmat)
#calculate accuracy
acc <- sum(diag(confmat))/sum(confmat)
print(acc)

############################## CROPPING THIS BITCH ##################################################

#################################### Crop IMAGE to 14x14 pixels############################3
#creating a vector with all the required pixels
my.pixels <- c()
for (i in seq(from = 203, to = 581, by = 28)) {
  my.pixels <- c(my.pixels, i:(i+13))
}
cropped.mnist <- mnist[1:total, c(1, (my.pixels + 1))]


################################################

cropped.density <- c()

#pb <- txtProgressBar(title = "progress bar", min = 0, max = total, style = 3)
old.time <- Sys.time()
for (i in 1:total) {
  cropped.density <- rbind(cropped.density, sum(cropped.mnist[i,-1]))
#  Sys.sleep(0.1)
#  setTxtProgressBar(pb, i)
}
#close(pb)
difftime(Sys.time(), old.time)

cropped.mnist.density <- cbind(cropped.mnist, cropped.density)

#fit logistic multinomial regression model
cropped.multinom <- multinom(label ~ scale(cropped.density), data = cropped.mnist.density, maxit = 1000)
#create prediction model
pred.cropped.multinom <- predict(cropped.multinom, cropped.mnist.density[,-c(1, 198)], type="class")
#produce confusion matrix
confmat.cropped <- table(cropped.mnist.density[,1], pred.cropped.multinom)
print(confmat.cropped)
#calculate accuracy
acc.cropped <- sum(diag(confmat.cropped))/sum(confmat.cropped)
print(acc.cropped)
