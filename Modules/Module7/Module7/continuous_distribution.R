
#Plots a histogram (discrete distribution) of citric acid in the wine samples
ggplot(data = winedata, aes(x = citric.acid)) +
  geom_histogram(color = "steelblue", fill = "skyblue", binwidth=.05)

#Plots a density plot (continuous distribution) of citric acid in the wine samples
ggplot(data = winedata, aes(x = citric.acid)) +
  geom_density(fill = "lightgray", color = "steelblue", alpha=0.5)

#Plots a density plot (continuous distribution) of citric acid in the wine samples
#with a vertical line for the mean
ggplot(data = winedata, aes(x = citric.acid)) +
  geom_density(fill = "lightgray", color = "steelblue", alpha=0.5) +
  geom_vline(aes(xintercept=mean(citric.acid)), linetype = "dashed") +
  scale_x_continuous(breaks=seq(0, 1, .1), limits=c(-0.1,1))

#Plots combined histogram and density plots with a vertical line for the mean
ggplot(data = winedata, aes(x = citric.acid)) +
  geom_histogram(aes(y=..density..), color = "steelblue", fill = "skyblue", binwidth=.05) +
  geom_density(fill = "lightgray", color = "steelblue", alpha=0.5) +
  geom_vline(aes(xintercept=mean(citric.acid)), linetype = "dashed") +
  scale_x_continuous(breaks=seq(0, 1, .1), limits=c(-0.1,1))

#Probability that an observation has citric acid value of .2 to .4
count(subset(winedata, winedata$citric.acid >= .2 & winedata$citric.acid <= .4))/count(winedata)

#Probability that an observation is below the mean
count(subset(winedata, winedata$citric.acid < mean(winedata$citric.acid))) / count(winedata)

#Probability that an observation is above the mean
count(subset(winedata, winedata$citric.acid > mean(winedata$citric.acid))) / count(winedata)