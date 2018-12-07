install.packages('plyr')
library(plyr)
mnist <- read.csv("C:/Users/Rens/Downloads/mnist.csv")
as.factor(mnist$label)
label.count <- count(mnist, 'label')
label.count$percent <- round(label.count$freq / 42000 * 100, 3)

for (i in 1:10) {
  if (min(part.mnist[,i]) == 0) {
    print("All entries considered, this pixel is useless")
    no.use.var <- rbind(no.use.var, data.frame(colnames()))
  } else {
    print("Don't throw this pixel away. Maybe it's useful")
  }  
}