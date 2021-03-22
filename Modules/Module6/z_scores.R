#Calculates mean and standard deviation for the Disney dataset (Rating)
mean(disneydata$Rating)
sd(disneydata$Rating)

#Calculates mean and standard deviation for the video game ratings dataset (Critic_Score)
vgmean <- mean(vgdata$Critic_Score, na.rm=TRUE)
vgsd <- sd(vgdata$Critic_Score, na.rm=TRUE)

#Calculates Z-scores
zscore_disney = (4.6 - mean(disneydata$Rating)) / sd(disneydata$Rating)
zscore_vg = (75.2 - vgmean) / vgsd

#Plots distribution of Disneyland ratings (1, 2, 3 standard deviations shaded)
#Dashed line is the observation
ggplot(data = disneydata, aes(x = Rating)) +
  stat_function(fun = sdrange, args = list(n=3, m=mean(disneydata$Rating), s=sd(disneydata$Rating)), geom="area", fill = "lightblue") +
  stat_function(fun = sdrange, args = list(n=2, m=mean(disneydata$Rating), s=sd(disneydata$Rating)), geom="area", fill = "skyblue") +
  stat_function(fun = sdrange, args = list(n=1, m=mean(disneydata$Rating), s=sd(disneydata$Rating)), geom="area", fill = "steelblue") +
  stat_function(fun = dnorm, args = list(mean = mean(disneydata$Rating), sd=sd(disneydata$Rating))) +  
  scale_x_continuous(breaks=seq(1, 8, 1), limits=c(1,8)) +
  geom_vline(aes(xintercept=4.6), linetype = "dashed") +
  geom_vline(aes(xintercept=mean(Rating)), linetype = "solid")

#Plots distribution of video game scores (1, 2, 3 standard deviations shaded)
#Dashed line is the observation
ggplot(data = vgdata, aes(x = Critic_Score)) +
  stat_function(fun = sdrange, args = list(n=3, m=vgmean, s=vgsd), geom="area", fill = "lightblue") +
  stat_function(fun = sdrange, args = list(n=2, m=vgmean, s=vgsd), geom="area", fill = "skyblue") +
  stat_function(fun = sdrange, args = list(n=1, m=vgmean, s=vgsd), geom="area", fill = "steelblue") +
  stat_function(fun = dnorm, args = list(mean = vgmean, sd=vgsd)) +  
  scale_x_continuous(breaks=seq(20, 120, 20), limits=c(20,120)) +
  geom_vline(aes(xintercept=75.2), linetype = "dashed") +
  geom_vline(aes(xintercept=vgmean), linetype = "solid")