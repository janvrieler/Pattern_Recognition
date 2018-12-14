library(caret)

set.seed(123)

ind <- createDataPartition(as.factor(mnist$label), p = 1/7, list = FALSE)
mnist.train <- mnist[ind,]
mnist.test <- mnist[-ind,]

mnist.train$label <- as.factor(mnist.train$label)

controlParameters <- trainControl(method = "cv", number = 5, savePredictions = TRUE, classProbs = TRUE)

library(class)
library(e1071)

#tunelength = 4 to test on 4 different k-values and pick the highest accuracy
my_knn <- train(mnist.train[,2:785], mnist.train$label, method = "knn", data = mnist.train, trControl = controlParameters, tunelength = 4)
print(my_knn)
