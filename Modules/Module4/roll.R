#A simulation of rolling dice

#Vectors of possible outcomes
die1 <- c(1:6)
die2 <- c(1:6)

#One roll of each die
roll1 <- sample(die1, 1)
roll2 <- sample(die2, 1)

#Prints each and the sum
print(roll1)
print(roll2)
print(roll1+roll2)
