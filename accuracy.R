
accuracy <- function(matrix) {
  sum(diag(matrix)) / sum(matrix)
}