library(lattice)
library(ggplot2)
library(caret)
library(class)
library(e1071)

set.seed(123)

ind <- createDataPartition(as.factor(cropped.mnist$label), p = 1/7, list = FALSE)
mnist.train <- cropped.mnist[ind,]
mnist.test <- cropped.mnist[-ind,]

mnist.train$label <- as.factor(mnist.train$label)

#make copy of the labels to test creating levels 
#&& 
#remove Error: At least one of the class levels is not a valid R variable name
test.labels <- mnist.train$label
levels(test.labels) <- unique(test.labels)
levels(test.labels) <- make.names(levels(test.labels))

controlParameters <- trainControl(method = "cv", number = 3, savePredictions = TRUE, classProbs = TRUE, verboseIter = TRUE)


#tunelength = 3 to test on 4 different k-values and pick the highest accuracy
my_knn <- train(mnist.train[,2:197], test.labels, method = "knn", data = mnist.train, trControl = controlParameters, tunelength = 1)
print(my_knn)
