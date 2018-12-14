data(mnist.train)
attach(mnist.train)

model <- svm(mnist.train$label ~ ., data = mnist.train)