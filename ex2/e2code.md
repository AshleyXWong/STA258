### The following function plots the density function and qqplots given the following 6 different parameters: 

1. The first parameter accepts the name in R of the distribution you want to calculate. 
* unif
* gamma
* norm

2. The second parameter is the number of sample means you want to simulate from a given distribution with given parameters.

3. The third parameter is the number of observations from a distribution with given parameters. For example, you could have 10 observations from a uniform distribution with a given min and max parameter. 

4. The fourth parameter is the first parameter of the distribution. For example, it would be the min parameter of the uniform distribution or for the normal distribution it would be the mean parameter. 

5. The fifth parameter is the second parameter of the distribution. For example, it would be the max parameter of the uniform distribution or for the normal distribution it would be the standard deviation. 

6. The plot number you want to add to the title. For example: plot6.png or plot2.png

```{r}
results <- function(operation, sample_num, observ_num, first, second, plot_num) {
  weir1<-c(1:sample_num)
  if (operation == "U") {
    for (i in 1:sample_num) {
      weir1[i]<-mean(runif(observ_num,as.integer(first),as.integer(second)))
    }
  }
  else if (operation == "G") {
    for (i in 1:sample_num) {
      weir1[i]<-mean(rgamma(observ_num,as.integer(first),as.integer(second)))
    }
  }
  else if (operation == "N") {
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
  
  plot_title <- paste("plot", plot_num, ".png", sep = "")
  dev.copy(png,plot_title)
  dev.off()
  
}
```
### The following function reads the pdf of the supplimentary exercises and extracts the necessary informtion to run the results function and runs it. 

```{r}
  #reads in file name and converts pdf file to text
  file <- "258se2.pdf"
  text <- pdf_text(file)
  
  #searches for sample sizes by searching for the words around it
  #Simulate (sample size num) sample means
  r <- gregexpr("Simulate (.*?) sample means", text[1])
  s <- regmatches(text[1], r)
  charact <- toString(s)
  
  sample_sizes <- as.numeric(str_extract_all(charact, "[0-9]+")[[1]])
  
  #searches for obvervation sizes
  t <- gregexpr("average of (.*?) ", text[1])
  u <- regmatches(text[1], t)
  characte <- toString(u)
  
  observ_sizes <- as.numeric(str_extract_all(characte, "[0-9]+")[[1]])
  
  
  #searches for distribution and saves all distributions into distribs variable
  v <- gregexpr("[U|G](.*?) observations", text[1])
  w <- regmatches(text[1], v)
  x <- toString(w)
  y <- gregexpr("[G|U]", x)
  
  distribs <- unlist(regmatches(x, y))
  first_seconds <- as.numeric(str_extract_all(x, "[0-9]+")[[1]])
  
  #tweeking the first part of the distribution parameters string a bit because
  #of small bugs in the regex
  distrib_params <- regmatches(x, gregexpr("(?<=\\().*?(?=\\))", x, perl=T))[[1]]
  distrib_params[1] <- substring(distrib_params[1], 4)
  
  for (i in 1:length(sample_sizes)) {
    split_vars <- strsplit(distrib_params[[i]][1], ",")
    first <-  as.integer(split_vars[[1]][1])
    second <- as.integer(split_vars[[1]][2])
    results(distribs[i], as.integer(sample_sizes[i]), as.integer(observ_sizes[i]),
            first, second, i)
    # print(c(distribs[i], as.integer(sample_sizes[i]), as.integer(observ_sizes[i]),
    #         first, second, i))
  }
  
```
