library(nnet)

mnist.multinom <- multinom(label ~ density.scaled, data = mnist, maxit = 1000)

mnist.multinom.pred <- predict(mnist.multinom, mnist, type = "class")

print(table(mnist$label, mnist.multinom.pred))