library(readr)
mnist <- read_csv("C:/Users/Rens/Downloads/mnist.csv")

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
# ref rotate function: https://www.r-bloggers.com/creating-an-image-of-a-matrix-in-r-using-image/ [accessed 13-12-2018, 10:30]
rotate <- function(x) {
  t(apply(x, 2, rev))
}

visualise_img <- function(mnist_obs) {
  image_res <- matrix(nrow = 28, ncol = 28)
  img_vec <- mnist_obs[2:length(mnist_obs)]
  counter <- 1
  for(i in 1:nrow(image_res)) {
    for(j in 1:ncol(image_res)) {
      image_res[i,j] <- as.integer(img_vec[,counter])
      counter <- counter + 1
    }
  }
  
  #PLOTS IMAGE
  image(rotate(image_res), col = grey.colors(255, start = 1, end = 0))
  
  #PRINTS MATRIX IN CONSOLE
  print(image_res)
  
  
  #create vector with all column names of the mnist observation which is nonzero
  
  #creates matrix with row and col indices of the nonzero pixels
  nonzero.names <- c()
  nonzero.mat <- which(image_res !=0, arr.ind = TRUE)
  for(i in 1:length(nonzero.mat[,1])) {
    index.row <- nonzero.mat[i,1]
    index.col <- nonzero.mat[i,2]
    index.vec <- 28*index.row - 28 + index.col
    nonzero.names <- c(nonzero.names, colnames(mnist_obs[,index.vec]))
  }
  #print(nonzero.names)
}

zero_ones_conversion <- function(mnist_obs, min_pixel_val) {
  mnist_features <- mnist_obs[,2:length(mnist_obs)]
  for(i in (1: length(mnist_features))){
    if(mnist_features[,i] < min_pixel_val) {
      mnist_features[,i] <- 0
    } else {
      mnist_features[,i] <- 255
    }
  }
  #concatenating label and new values
  #print("Class of mnist_obs: " + as.character(class(mnist_obs)))
  #print("Class of mnist_features: " + as.character(class(mnist_features)))
  result <- cbind(mnist_obs[,1],mnist_features)
  print(class(result))
  visualise_img(result)
}
