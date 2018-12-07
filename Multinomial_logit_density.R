library(nnet)

mnist.multinom <- multinom(mnist$label ~ mnist$density, data = mnist)

mnist.multinom.pred <- predict(mnist.multinom, mnist, type = "class")

print(table(mnist$label, mnist.multinom.pred))