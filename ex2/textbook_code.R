find_prob_within_interval <- function(sample_sizes, interval, stdev) {
  vector_probabilites <- vector('numeric')
  for (i in 1:length(sample_sizes)) {
    z_score <- sqrt(sample_sizes[i])*interval/stdev
    prob_above_zval <- round(1-pnorm(z_score),4)
    prob_within_interval <- 1-2*prob_above_zval
    vector_probabilites <- c(vector_probabilites, prob_within_interval)
  }
  print(vector_probabilites)
}

xlabs <-  c(16, 25, 36, 49, 64, 81, 100)
ylabs <- find_prob_within_interval(xlabs, 0.3, 1)
data <- data.frame(xlabs, ylabs)

#plot data
plot(xlabs, ylabs, main = "Sample Sizes vs Prob That Sample Mean is within 0.3 of True Mean",
     xlab = "Sample Sizes", ylab = "Probability", col = "Blue", pch = 5)

# fit a loess line
loess_fit <- loess(ylabs ~ xlabs, data)
lines(data$x, predict(loess_fit), col = "blue")


