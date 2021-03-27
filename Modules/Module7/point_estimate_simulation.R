library(ggplot2)

#Estimated number of students
pop_size <- 15000

#Vector of sample proportions
p_hats <- c()

#72 percent of students approve of the new policy
population <- c(rep("approve", 0.72 * pop_size), rep("disapprove", 0.28 * pop_size))

#20000 simulations
for (i in seq(1, 20000)) {
  
  #Sample 100 entries from the population without replacement.
  sampled_entries <- sample(population, size = 100)
  
  #Append sample proportion to the vector of sample proportions
  p_hats <- append(p_hats, sum(sampled_entries == "approve") / 100)
  
}

df <- as.data.frame(p_hats)
#Plot the histogram w/ standard error
ggplot(data = df) + geom_histogram(mapping=aes(x=p_hats), fill="skyblue", color="steelblue", alpha=.5, binwidth=0.01)+
  geom_vline(xintercept=mean(p_hats)) + geom_vline(xintercept=mean(p_hats)+sd(p_hats), linetype="dashed") +geom_vline(xintercept=mean(p_hats)-sd(p_hats), linetype="dashed")+
  scale_x_continuous(breaks=seq(0.5,0.9,0.02), limits=c(0.5, 0.9))

#95% confidence interval
ggplot(data = df) + geom_histogram(mapping=aes(x=p_hats), fill="skyblue", color="steelblue", alpha=.5, binwidth=0.01)+
  geom_vline(xintercept=mean(p_hats)) + geom_vline(xintercept=mean(p_hats)+1.96*sd(p_hats), linetype="dashed") +geom_vline(xintercept=mean(p_hats)-1.96*sd(p_hats), linetype="dashed")

#99% confidence interval
ggplot(data = df) + geom_histogram(mapping=aes(x=p_hats), fill="skyblue", color="steelblue", alpha=.5, binwidth=0.01)+
  geom_vline(xintercept=mean(p_hats)) + geom_vline(xintercept=mean(p_hats)+2.58*sd(p_hats), linetype="dashed") +geom_vline(xintercept=mean(p_hats)-2.58*sd(p_hats), linetype="dashed")
