#### This week we are assessing the densities of various distributions but also gathering the sample means of various distributions. 
#### This is the code to complete the code: 

```{r}
results <- function(operation, sample_num, observ_num, first, second) {
  weir1<-c(1:sample_num)
  if (operation == "unif") {
    for (i in 1:sample_num) {
      weir1[i]<-mean(runif(observ_num,as.integer(first),as.integer(second)))
    }
  }
  else if (operation == "gamma") {
    for (i in 1:sample_num) {
      weir1[i]<-mean(rgamma(observ_num,as.integer(first),as.integer(second)))
    }
  }
  else if (operation == "norm") {
    for (i in 1:sample_num) {
      weir1[i]<-mean(rnorm(observ_num,as.integer(first),as.integer(second)))
    }
  }
  else {print(operation)}

  substr(operation, 1, 1) <- toupper(substr(operation, 1, 1))
  title = paste(operation, "(", first, ",", second, "); n = ", observ_num, "; ", sample_num, " ", observ_num, sep = "")

  par(mfrow = c(1,2))
  plot(density(weir1), main = title)
  qqnorm(weir1, main= title)
}
```
1. The first parameter accepts the name in R of the distribution you want to calculate. 
* unif
* gamma
* norm

2. The second parameter is the number of sample means you want to simulate from a given distribution with given parameters.

3. The third parameter is the number of observations from a distribution with given parameters. For example, you could have 10 observations from a uniform distribution with a given min and max parameter. 

4. The fourth parameter is the first parameter of the distribution. For example, it would be the min parameter of the uniform distribution or for the normal distribution it would be the mean parameter. 

5. The fifth parameter is the second parameter of the distribution. For example, it would be the max parameter of the uniform distribution or for the normal distribution it would be the standard deviation. 

To run this function: 
```{r}
results("unif", 500, 10, -2, 5)
or 
results("gamma", 1000, 10, 2, 5)
```
