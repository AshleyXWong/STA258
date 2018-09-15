```{r}
results <- function(dataset) {
  data <- dataset[1:nrow(dataset),]
  calculated <- c(mean(data), median(data), sqrt(var(data)), sd(data))
  print(calculated)
  par(mfrow = c(2,2))
  hist(data, col = "Blue")
  boxplot(data, main = "Boxplot of Data", xlab = "data", ylab = "Frequency", col = "purple")
  qqnorm(data, pch = 5, col = "red")
  qqline(data, col = "blue")
}
```

### Code: 
#### Histograms: 
```{r}
hists <- function(operation) {
  if (operation == "norm") {
    data1 <- rnorm(50, 3, 4)
    data2 <- rnorm(500, 3, 4)
    data3 <- rnorm(5000, 3, 4)
    data4 <- rnorm(50000, 3, 4)
  } else if (operation == "unif") {
    data1 <- runif(50, -3, 4) 
    data2 <- runif(500, -3, 4) 
    data3 <- runif(5000, -3, 4) 
    data4 <- runif(50000, -3, 4) 
  } else if (operation == "gamma") {
    data1 <- rgamma(50, 3, 4) 
    data2 <- rgamma(500, 3, 4) 
    data3 <- rgamma(5000, 3, 4) 
    data4 <- rgamma(50000, 3, 4) 
  }
  substr(operation, 1, 1) <- toupper(substr(operation, 1, 1))
  xlabel <- paste("Random", operation, "Values")
  par(mfrow = c(2,2))
  hist(data1, main = "Distribution with 50 observations", xlab = xlabel, col = "Blue")
  hist(data2, main = "Distribution with 500 observations", xlab = xlabel, col = "Red")
  hist(data3, main = "Distribution with 5000 observations", xlab = xlabel, col = "Purple")
  hist(data4, main = "Distribution with 50000 observations",  xlab = xlabel, col = "Green")
}
```
#### Boxplots: 
```{r}
boxes <- function(operation) {
  if (operation == "norm") {
    data1 <- rnorm(50, 3, 4)
    data2 <- rnorm(500, 3, 4)
    data3 <- rnorm(5000, 3, 4)
    data4 <- rnorm(50000, 3, 4)
  } else if (operation == "unif") {
    data1 <- runif(50, -3, 4) 
    data2 <- runif(500, -3, 4) 
    data3 <- runif(5000, -3, 4) 
    data4 <- runif(50000, -3, 4) 
  } else if (operation == "gamma") {
    data1 <- rgamma(50, 3, 4) 
    data2 <- rgamma(500, 3, 4) 
    data3 <- rgamma(5000, 3, 4) 
    data4 <- rgamma(50000, 3, 4) 
  }
  substr(operation, 1, 1) <- toupper(substr(operation, 1, 1))
  xlabel <- paste("Random", operation, "Values")
  par(mfrow = c(2,2))
  boxplot(data1, main = "Distribution with 50 observations", xlab = xlabel, col = "Blue")
  boxplot(data2, main = "Distribution with 500 observations", xlab = xlabel, col = "Red")
  boxplot(data3, main = "Distribution with 5000 observations", xlab = xlabel, col = "Purple")
  boxplot(data4, main = "Distribution with 50000 observations",  xlab = xlabel, col = "Green")
}
```
#### QQPlots
```{r}
qqs <- function(operation) {
  if (operation == "norm") {
    data1 <- rnorm(50, 3, 4)
    data2 <- rnorm(500, 3, 4)
    data3 <- rnorm(5000, 3, 4)
    data4 <- rnorm(50000, 3, 4)
  } else if (operation == "unif") {
    data1 <- runif(50, -3, 4) 
    data2 <- runif(500, -3, 4) 
    data3 <- runif(5000, -3, 4) 
    data4 <- runif(50000, -3, 4) 
  } else if (operation == "gamma") {
    data1 <- rgamma(50, 3, 4) 
    data2 <- rgamma(500, 3, 4) 
    data3 <- rgamma(5000, 3, 4) 
    data4 <- rgamma(50000, 3, 4) 
  }
  substr(operation, 1, 1) <- toupper(substr(operation, 1, 1))
  xlabel <- paste("Random", operation, "Values")
  par(mfrow = c(2,2))
  qqnorm(data1, main = "Distribution with 50 observations", xlab = xlabel, col = "Blue")
  qqline(data1, col = "blue")
  qqnorm(data2, main = "Distribution with 500 observations", xlab = xlabel, col = "Red")
  qqline(data2, col = "red")
  qqnorm(data3, main = "Distribution with 5000 observations", xlab = xlabel, col = "Purple")
  qqline(data3, col = "purple")
  qqnorm(data4, main = "Distribution with 50000 observations",  xlab = xlabel, col = "Green")
  qqline(data4, col = "blue")
}
```
#### Running the Codes
```{r}
hists("norm")
hists("gamma")
hists("unif")
boxes("norm")
boxes("gamma")
boxes("unif")
qqs("norm")
qqs("gamma")
qqs("unif")
```
