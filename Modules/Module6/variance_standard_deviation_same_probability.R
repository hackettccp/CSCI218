#Sides of a die
die <- c(1, 2, 3, 4, 5, 6)

mean1 <- mean(die)
var1 <- var(die)
std1 <- sqrt(var1)

#Print mean
print(mean1)
#Print variance
print(var1)
#Print standard deviation
print(std1)



#The probability for each of the sides (all the same)
#P(X = x_i)
probs <- c(.167, .167, .167, .167, .167, .167)

#Calculating expected value
expected_value <- sum(die * probs)

#Calculating variance
variance <- sum((die - expected_value)**2 * probs)

#Calculating standard deviation
std_dev <- sqrt(variance)

#Print mean
print(expected_value)
#Print variance 
print(variance)
#Print standard deviation
print(std_dev)

#Variance differs because the var() function is an estimator of population variance. 
#The variance variable contains the correct variance.