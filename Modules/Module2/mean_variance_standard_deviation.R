library(ggplot2)

#Mean (average) value of the diamond prices
x_bar <- mean(diamonds$price)

#Histogram with mean 
ggplot(data = diamonds) + 
  geom_histogram(mapping = aes(x = price), color="black", binwidth=1000) +
  geom_vline(xintercept = x_bar)

#Variance of the diamond prices
s_2 = var(diamonds$price)

#Standard deviation of the diamond prices
s = sd(diamonds$price)

#Histogram with mean and standard deviations
ggplot(data = diamonds) + 
  geom_histogram(mapping = aes(x = price), color="black", binwidth=1000) +
  geom_vline(xintercept = x_bar) +
  geom_vline(xintercept = x_bar+s, linetype="dashed") +
  geom_vline(xintercept = x_bar-s, linetype="dashed")