### 1. TobinQ
#### a. Read the data into R
I saved off tobinQ (containing all of its values) to a variable called data 
```{r}
attach(tobinQ)
data <- tobinQ[1:nrow(tobinQ),]
```
#### b. Calculate the mean, median, variance, and standard deviation
```{r}
calculated <- c(mean(data), median(data), sqrt(var(data)), sd(data))
print(calculated)
```
#### c. Plot histogram, boxplot, and qqplot
```{r}
par(mfrow = c(2,2))
hist(data, col = "Blue")
boxplot(data, main = "Boxplot of Data", xlab = "data", ylab = "Frequency", col = "purple")
qqnorm(data, pch = 5, col = "red")
qqline(data, col = "blue")
```
![rplot01](https://user-images.githubusercontent.com/8938974/45267152-3299b280-b435-11e8-878b-2c56dc239650.png)

#### d. Does it appear that this data could have come from a normal distribution?
There is strong evidence that the data does not follow a normal distribution and that it is scewed negatively/to the left. 

### 2. Density
I noticed that all of these steps are repetitive....so we are going to make a function. 
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
Now all you need to do is import the datasets and attach them like so
```{r}
attach(tobinQ)
results(tobinQ)
attach(density)
results(density)
```
These are the results from calling the function results with the parameter density: 
```{r}
[1] 544.79310 546.00000  22.09457  22.09457
```
![rplot02](https://user-images.githubusercontent.com/8938974/45267256-2282d280-b437-11e8-810b-e78ba95b9285.png)

It seems as if this data is somewhat normally distributed but also is scewed positively/to the right.

### 3. Colonel
These are the results from calling the function results with the parameter colonel: 
```{r}
[1] 51.494382 52.000000  1.739407  1.739407
```
![rplot03](https://user-images.githubusercontent.com/8938974/45267271-71c90300-b437-11e8-91da-31e3c3a838f0.png)

It seems as if this data is not normally distributed and that it is scewed negatively/to the left. 

### 4. Random sample of n=60 from a N(3, 4^2) distribution.
```{r}
Q4<-rnorm(60,3,4)
results(Q4)
```
These are the results from calling the function results with the parameter Q4: 
```{r}
[1] 2.858603 2.844613 3.908117 3.908117
```
![rplot04](https://user-images.githubusercontent.com/8938974/45267464-cb7efc80-b43a-11e8-8d70-c49a27eb5b57.png)

It seems as if there is no evidence that this data is not normally distributed. (That's because we used the normal function to create a normally distributed sample of 60 observations!)

### 5. 
These are the results from calling the function results with the parameter Q5 <- rgamma(40,3,4):
```{r}
[1] 0.8076429 0.7768698 0.4617444 0.4617444
```
![rplot05](https://user-images.githubusercontent.com/8938974/45267479-30d2ed80-b43b-11e8-8c15-29f35b7eb855.png)

There is evidence that this random sample of 40 observations that uses a gamma distribution is not normally distributed and that it is scewed negatively/to the left. 

### 6. 
These are the results from calling the function results with the parameter Q6 <- runif(80,-3,4):
```{r}
[1]  0.22401354 -0.08199657  2.12967878  2.12967878
```
![rplot06](https://user-images.githubusercontent.com/8938974/45267494-74c5f280-b43b-11e8-9a0d-78bb2c28c602.png)

There is evidence that this random sample of 80 observations is not normally distributed.
