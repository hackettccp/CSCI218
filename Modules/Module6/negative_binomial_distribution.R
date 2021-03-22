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
k <- 7
#Number of trials
n <- seq(1, 50, 1)

#Probability of k successes in n trials
neg_binomial_dist <- (factorial(n-1)/(factorial(k-1)*factorial(n-k))) * (p**k) * ((1-p)**(n-k))

neg_binomial_df <- data.frame(trials=seq(1, 50, 1), prob=neg_binomial_dist)

#Plotting the distribution
ggplot(data = neg_binomial_df, aes(x=trials, y=prob)) +
  geom_histogram(color = "steelblue", fill = "skyblue", stat="identity")+
  scale_x_continuous(breaks=seq(1, 50, 4), limits=c(0,50))