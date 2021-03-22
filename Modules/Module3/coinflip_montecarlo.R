#A Monte Carlo simulation of flipping a coin
#Update the num_flips variable to simulate more flips
#As the number of flips increases, the frequency and proportion will
#stabilize around the predicted probabilities (50%-50%) (Law of Large Numbers)

#Vector of possible outcomes
coin <- c("heads", "tails")

#Number of flips
num_flips <- 10

#One Thousand Flips
flips <- replicate(num_flips, sample(coin, 1))

#Table (Frequency)
t <- table(flips)
print(t)

#Table (Proportion)
pt <- prop.table(t)
print(pt)

#Barplot
barplot(pt)
