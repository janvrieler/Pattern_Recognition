class_labels <- c()
for (i in c(1:35995)) {
  if (mnist.logreg.pred[i] == mnist.test$label[i]) {
    class_labels <- c(class_labels, "correct")
  }
  else {
    class_labels <- c(class_labels, "false")
  }
  print(i)
}
