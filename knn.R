library(lattice)
library(ggplot2)
library(caret)
library(class)
library(e1071)

set.seed(123)

ind <- createDataPartition(as.factor(mnist$label), p = 1/7, list = FALSE)
mnist.train <- mnist[ind,]
mnist.test <- mnist[-ind,]

mnist.train$label <- as.factor(mnist.train$label)

#make copy of the labels to test creating levels 
#&& 
#remove Error: At least one of the class levels is not a valid R variable name
test.labels <- mnist.train$label
levels(test.labels) <- unique(test.labels)
levels(test.labels) <- make.names(levels(test.labels))

controlParameters <- trainControl(method = "cv", number = 5, savePredictions = TRUE, classProbs = TRUE)


#tunelength = 4 to test on 4 different k-values and pick the highest accuracy
my_knn <- train(mnist.train[,2:785], test.labels, method = "knn", data = mnist.train, trControl = controlParameters, tunelength = 4)
print(my_knn)
