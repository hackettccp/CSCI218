#Retrieving the column/vector of quality
qualities = winedata$quality
#Zero out all values != 6 (failures)
qualities = replace(qualities, qualities != 6, 0)
#Replace 6's with 1's (successes)
qualities = replace(qualities, qualities == 6, 1)

#Finding the average
#The proportion of "successful" tests
p <- mean(qualities)

#Number of successes
k <- seq(1, 10, 1)
#Number of trials
n <- 10

#Probability of k successes in n trials
binomial_dist <- (factorial(n)/(factorial(k)*factorial(n-k))) * (p**k) * ((1-p)**(n-k))

binomial_df <- data.frame(trials=seq(1, 10, 1), prob=binomial_dist)

#Plotting the distribution
ggplot(data = binomial_df, aes(x=trials, y=prob)) +
  geom_histogram(color = "steelblue", fill = "skyblue", stat="identity")+
  scale_x_continuous(breaks=seq(1, 10, 1), limits=c(0,10))