library(nnet)

optdigits.multinom <- multinom(V65 ~ ., data = training_optdigits, maxit = 1000)

optdigits.multinom.pred <- predict(optdigits.multinom, 
                                   training_optdigits, type = "class")

print(accuracy(table(optdigits.multinom.pred, training_optdigits$V65)))

optdigits.multinom.pred.test <- predict(optdigits.multinom, 
                                       testing_optdigits, type = "class")

print(accuracy(table(optdigits.multinom.pred.test, testing_optdigits$V65)))
