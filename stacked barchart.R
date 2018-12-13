
stacked_barchart <- function(confmat) {
  
  Correct <- c()
  Total <- c()
  Class <- c()
  
  for (i in c(1:10)) {
    
    Class <- c(Class, c(i - 1))
    Total <- c(Total, sum(confmat[,i]))
    Correct <- c(Correct, confmat[i,i])
    
  }
  
  print(Class)
  print(Total)
  print(Correct)
  
  df.chart <- data.frame(Class, Correct, Total)
  
  chart <- ggplot() + geom_bar(aes( y = Total, x = Class, fill = Correct),
                               data = df.chart, stat = "identity",
                               position = "stack") + scale_x_continuous(breaks = Class)
  
  print(chart)
  
}