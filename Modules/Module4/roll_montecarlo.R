#A Monte Carlo simulation of rolling dice
#Update the num_rolls variable to simulate more rolls
#As the number of rolls increases, the frequency and proportion will
#stabilize around the predicted probabilities (Law of Large Numbers)

#Vectors of possible outcomes
die1 <- c(1:6)
die2 <- c(1:6)

#Number of rolls
num_rolls <- 100000

#One Hundred Rolls
rolls <- replicate(num_rolls, sample(die1, 1) + sample(die2, 1))

#Table (Frequency)
t <- table(rolls)
print(t)

#Barplot
barplot(t)