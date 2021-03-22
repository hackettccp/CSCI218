#Number of tests
num_tests <- 100

#Making the results of one hundred tests
#1's are weighted so the vector is not 50-50 for 1's and 0's
tests <- replicate(num_tests, sample(c(0, 1), 1, prob=c(.22, .78)))

#Finding the average
#The proportion of "successful" tests
p <- mean(tests)
#The proportion of "failed" tests
q <- 1-p
#The number of samples/draws
#1 through 10
n <- seq(1, 10, 1)

#Calculating the geometric distribution
geometric_dist <- q**(n-1)*p

#Making a new data frame of tests (number of bins) and the probabilities from
#the geometric distribution
geometric_df <- data.frame(tests=seq(1, 10, 1), prob=geometric_dist)

#Plotting the distribution
ggplot(data = geometric_df, aes(x=tests, y=prob)) +
  geom_histogram(color = "steelblue", fill = "skyblue", stat="identity")+
  scale_x_continuous(breaks=seq(1, 10, 1), limits=c(0,10))

#Distribution mean
m <- 1/p
#Distribution variance
v <- (1-p)/(p**2)
#Distribution standard deviation
s <- sqrt(v)
