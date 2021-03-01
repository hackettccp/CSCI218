#Histogram and density plot for pH
ggplot(data = winedata, aes(x = pH)) +
  geom_histogram(aes(y=..density..), color = "steelblue", fill = "skyblue", binwidth=.05) +
  geom_density(fill = "lightgray", color = "steelblue", alpha=0.5)


#Fits pH to a normal distribution
#Fills in the standard deviations
ggplot(data = winedata, aes(x = pH)) +
  stat_function(fun = sdrange, args = list(n=3, m=mean(winedata$pH), s=sd(winedata$pH)), geom="area", fill = "lightblue") +
  stat_function(fun = sdrange, args = list(n=2, m=mean(winedata$pH), s=sd(winedata$pH)), geom="area", fill = "skyblue") +
  stat_function(fun = sdrange, args = list(n=1, m=mean(winedata$pH), s=sd(winedata$pH)), geom="area", fill = "steelblue") +
  stat_function(fun = dnorm, args = list(mean = mean(winedata$pH), sd=sd(winedata$pH))) +  
  geom_vline(aes(xintercept=mean(winedata$pH)), linetype = "dashed")

#Proportion of observations being within 1 standard deviation
count(subset(winedata, winedata$pH >= mean(winedata$pH)-sd(winedata$pH) & winedata$pH <= mean(winedata$pH)+sd(winedata$pH))) / count(winedata)

#Proportion of observations being within 2 standard deviations
count(subset(winedata, winedata$pH >= mean(winedata$pH)-2*sd(winedata$pH) & winedata$pH <= mean(winedata$pH)+2*sd(winedata$pH))) / count(winedata)

#Proportion of observations being within 3 standard deviations
count(subset(winedata, winedata$pH >= mean(winedata$pH)-3*sd(winedata$pH) & winedata$pH <= mean(winedata$pH)+3*sd(winedata$pH))) / count(winedata)