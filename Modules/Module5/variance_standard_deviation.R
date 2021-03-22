#Total downloads
downloads <- c(500, 750, 250)

#The prices of the three versions of the Statr app
x_i <- c(0.00, 0.50, 1.00)

#Total revenues
revenues <- downloads * x_i

#The probability for each of the three versions of the Statr app
#P(X = x_i)
probs <- c(0.33, 0.50, 0.17)

#Calculating expected value
expected_value <- sum(x_i * probs)

#Calculating variance
variance <- sum((x_i - expected_value)**2 * probs)

#Calculating standard deviation
std_dev <- sqrt(variance)