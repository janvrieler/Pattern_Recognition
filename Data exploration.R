summary(digits.train)

regression <- lm(V65 ~ ., data = digits.train)


class.observations = digits.test$V65
class.prediction = predict.lm(regression, digits.test)
class.prediction = round(class.prediction)

for (i in 1:length(class.prediction)) {
  if (class.prediction[i] == -1) {
    class.prediction[i] = 0
  }
  if(class.prediction[i] == 10) {
    class.prediction[i] = 9
  }
}

table(class.observations, class.prediction)
