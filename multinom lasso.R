library(glmnet)

mnist.glmnet <- cv.glmnet(as.matrix(mnist.train[,2:197]),  mnist.train$label, family = "multinomial",type.measure = "class" )

plot(mnist.glmnet)

mnist.logreg.pred <- predict(mnist.glmnet, newx = as.matrix(mnist.test[,2:197]), s= "lambda.1se", type="class")

LogReg.confmat <- table(mnist$label, mnist.logreg.pred)