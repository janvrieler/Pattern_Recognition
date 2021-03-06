library(nnet)

mnist.multinom <- multinom(label ~ ratio.scaled + density.scaled, data = mnist, maxit = 1000)

mnist.multinom.pred <- predict(mnist.multinom, mnist, type = "class")

density.confmat <- table(mnist$label, mnist.multinom.pred)

print(density.confmat)

print(accuracy(density.confmat))
