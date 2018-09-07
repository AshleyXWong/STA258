### 1. Read the data into R
I saved off tobinQ (containing all of its values) to a variable called data 
```{r}
attach(tobinQ)
data <- tobinQ[1:nrow(tobinQ),]
```
### 2. Calculate the mean, median, variance, and standard deviation
```{r}
calculated <- c(mean(data), median(data), sqrt(var(data)), sd(data))
print(calculated)
```
### 3. Plot histogram, boxplot, and qqplot
```{r}
par(mfrow = c(2,2))
hist(data)
boxplot(data)
qqnorm(data)
```
![rplot](https://user-images.githubusercontent.com/8938974/45245697-740e4e80-b2cb-11e8-8f20-68d353cd8710.png)
