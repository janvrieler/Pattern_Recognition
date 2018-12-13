library(readr)
#mnist <- read_csv("C:/Users/Rens/Downloads/mnist.csv")

set.seed(123)
sample.ind <- sample(1:nrow(mnist), size = 100)
sampled.mnist <- mnist[sample.ind,]

summary.sample <- sapply(sampled.mnist[2:length(sampled.mnist)], quantile, prob = c(0, .25, .5, .75, 1), names = FALSE)
rownames(summary.sample) <- c("Min.", "1st Qu.", "Median", "3rd Qu.", "Max.")

#convert to dataframe
dat.sum.sample <- as.data.frame(summary.sample)
#print summary for the pixel0 to pixel9
print(dat.sum.sample[1:5, 1:10])

#max = 0 per pixel
useless.0 <- c()

for(i in (1:length(dat.sum.sample))){
  #dat.sum.sample[5,i] is the maximum of each pixel
  if(dat.sum.sample[5,i] <= 0) {
    useless.0 <- c(useless.0, i)
  }
}

##################### PRINT IMAGE VECTOR ##############################
rotate <- function(x) {
  t(apply(x, 2, rev))
}

visualise_img <- function(mnist_obs) {
  image_res <- matrix(nrow = 28, ncol = 28)
  img_vec <- mnist_obs
  counter <- 1
  for(i in 1:nrow(image_res)) {
    for(j in 1:ncol(image_res)) {
      image_res[i,j] <- as.integer(img_vec[,counter])
      counter <- counter + 1
    }
  }
  image(rotate(image_res), col = grey.colors(255, start = 1, end = 0))
}