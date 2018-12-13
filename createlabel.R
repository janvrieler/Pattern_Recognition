class_labels <- c()
for (i in c(1:42000)) {
  if (mnist.multinom.pred[i] == class.factor[i]) {
    class_labels <- c(class_labels, "correct")
  }
  else {
    class_labels <- c(class_labels, "false")
  }
  print(i)
}
