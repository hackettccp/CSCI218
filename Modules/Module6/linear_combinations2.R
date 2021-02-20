#Coin prices
coins <- c(38138.39, 155.67)

#30 day variance
variance_30_days <- c(0.08, 0.04)

#Variance of expected value
variance <- sum(coins**2 * variance_30_days)

#Standard deviation
standard_deviation <- sqrt(variance)