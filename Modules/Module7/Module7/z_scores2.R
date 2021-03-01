#Calculates mean and standard deviation for the video game ratings dataset (Critic_Score)
vgmean <- mean(vgdata$Critic_Score, na.rm=TRUE)
vgsd <- sd(vgdata$Critic_Score, na.rm=TRUE)

#Calculates Z-score
zscore_vg = (75.2 - vgmean) / vgsd

#Plots distribution of video game scores (left tail shaded)
ggplot(data = vgdata, aes(x = Critic_Score)) +
  stat_function(fun = lefttail, args = list(t=75.2, m=vgmean, s=vgsd), geom="area", fill = "lightblue") +
  stat_function(fun = dnorm, args = list(mean = vgmean, sd=vgsd)) +  
  scale_x_continuous(breaks=seq(20, 120, 20), limits=c(20,120)) +
  geom_vline(aes(xintercept=75.2), linetype = "dashed") +
  geom_vline(aes(xintercept=vgmean), linetype = "solid")


#Calculates mean and standard deviation for the Disney dataset (Rating)
disneymean <- mean(disneydata$Rating)
disneysd <- sd(disneydata$Rating)

#Calculates Z-score
zscore_disney = (2.5 - disneymean) / disneysd

#Plots distribution of Disneyland ratings (left tail shaded)
ggplot(data = disneydata, aes(x = Rating)) +
  stat_function(fun = lefttail, args = list(t=2.5, m=disneymean, s=disneysd), geom="area", fill = "lightblue") +
  stat_function(fun = dnorm, args = list(mean = disneymean, sd=disneysd)) +  
  scale_x_continuous(breaks=seq(1, 8, 1), limits=c(1,8)) +
  geom_vline(aes(xintercept=2.5), linetype = "dashed") +
  geom_vline(aes(xintercept=disneymean), linetype = "solid")