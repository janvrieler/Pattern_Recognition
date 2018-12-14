
mnist_pred <- knn(train = mnist.train, test = mnist.test, cl = mnist.train$label, k= 3, use.all = TRUE)

knn_confmat <- table(mnist.test$label, mnist_pred)

print(accuracy(knn_confmat))

alarm()