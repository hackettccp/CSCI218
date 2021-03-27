library(ggplot2)
library(readr)

df <- read.csv("disney.csv")

ratings <- df$Rating

#Random sample of 1000 surveys
sampled_ratings <- sample(ratings, size = 1000)

#Total number of 3-star ratings
three_stars <- sum(sampled_ratings==3)

#Proportion of 3-star ratings
three_stars_prop <- three_stars / length(sampled_ratings)

#Is this representative of the entire population of 42,656 ratings?

#1. Prepare
n <- 1000                 #Sample size
p_hat <- three_stars_prop #Point estimate
alpha <- 0.05             #Significance level

#H_0 : 20% of people typically rate 3 stars on a scale of 1 to 5
p_0 <- .2
#H_A : The percentage of people rating 3 stars is above or below 20% (p!=p_hat)

#2. Check
#Randomly sampled: Independent
#Success-failure:
n * p_0 >= 10
n * (1-p_0) >= 10

#3. Calculate
SE <- sqrt(p_0*(1-p_0)/n)

z_score <- (p_hat-p_0)/SE

p_value <- 1-pnorm(z_score)

#4. Confirm
#Strong evidence against the null hypothesis

