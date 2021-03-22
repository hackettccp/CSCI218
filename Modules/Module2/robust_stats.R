library(ggplot2)

#Mean and median of price
x_bar <- mean(diamonds$price)
med <- median(diamonds$price)

ggplot(data = diamonds) + 
  geom_histogram(mapping = aes(x = price), color="black", binwidth=1000) +
  geom_vline(xintercept = x_bar) +
  geom_vline(xintercept = med, linetype="dashed")

#Mean and median of city mileage
x_bar <- mean(mpg$cty)
med <- median(mpg$cty)

ggplot(data = mpg) + 
  geom_histogram(mapping = aes(x = cty), color="black") +
  geom_vline(xintercept = x_bar) +
  geom_vline(xintercept = med, linetype="dashed")