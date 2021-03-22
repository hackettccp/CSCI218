#Total downloads
downloads <- c(500, 750, 250)

#The prices of the three versions of the Statr app
x_i <- c(0.00, 0.50, 1.00)

#Total revenues
revenues <- downloads * x_i

#The probability for each of the three versions of the Statr app
#P(X = x_i)
probs <- c(0.33, 0.50, 0.17)

#Calculating/printing expected value (method 1)
expected_value1 <- sum(revenues)/sum(downloads)

print(expected_value1) #0.416

#Calculating/printing expected value (method 2)
expected_value2 <- sum(x_i * probs)

print(expected_value2) #0.42


