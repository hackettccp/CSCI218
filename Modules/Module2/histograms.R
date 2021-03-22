library(ggplot2)

#Histogram of diamond prices
ggplot(data = diamonds) + 
  geom_histogram(mapping = aes(x = price))

#Histogram with borders
ggplot(data = diamonds) + 
  geom_histogram(mapping = aes(x = price), color="black")

#Histogram with borders and 200 wide bins
ggplot(data = diamonds) + 
  geom_histogram(mapping = aes(x = price), color="black", binwidth=200)

#Histogram with borders and 1000 wide bins
ggplot(data = diamonds) + 
  geom_histogram(mapping = aes(x = price), color="black", binwidth=1000)