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

#1st Qu. = 0 per pixel
useless.25 <- c()

for(i in (1:length(dat.sum.sample))){
  if(dat.sum.sample[2,i] <= 0) {
    useless.25 <- c(useless.25, i)
  }
}