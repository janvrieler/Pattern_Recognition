library(nnet)

mnist.multinom <- multinom(label ~ density.scaled + ratio.scaled, data = mnist, maxit = 1000)

mnist.multinom.pred <- predict(mnist.multinom, mnist.cleaned, type = "class")

ratio.confmat <- table(mnist.cleaned$label, mnist.multinom.pred)

print(ratio.confmat)

print(accuracy(ratio.confmat))