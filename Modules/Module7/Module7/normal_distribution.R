#Mean and standard deviation
m_citric <- mean(winedata$citric.acid)
sd_citric <- sd(winedata$citric.acid)

#Fits citric acid to a normal distribution
ggplot(data = winedata, aes(x = citric.acid)) +
  geom_histogram(aes(y=..density..), color = "steelblue", fill = "skyblue", binwidth=.05) +
  stat_function(fun = dnorm, args = list(mean = m_citric, sd=sd_citric)) +
  scale_x_continuous(breaks=seq(-0.4, 1, .1), limits=c(-0.4,1)) +
  geom_vline(aes(xintercept=mean(citric.acid)), linetype = "dashed")

#Fits citric acid to a normal distribution
#Fills in the standard deviations
ggplot(data = winedata, aes(x = citric.acid)) +
  stat_function(fun = dnorm, args = list(mean = m_citric, sd=sd_citric)) +
  stat_function(fun = sdrange, args = list(n=3, m=m_citric, s=sd_citric), geom="area", fill = "lightblue") +
  stat_function(fun = sdrange, args = list(n=2, m=m_citric, s=sd_citric), geom="area", fill = "skyblue") +
  stat_function(fun = sdrange, args = list(n=1, m=m_citric, s=sd_citric), geom="area", fill = "steelblue") +
  scale_x_continuous(breaks=seq(-0.4, 1, .1), limits=c(-0.4,1)) +
  geom_vline(aes(xintercept=mean(citric.acid)), linetype = "dashed")

#Proportion of observations being within 1 standard deviation
count(subset(winedata, winedata$citric.acid >= m_citric-sd_citric & winedata$citric.acid <= m_citric+sd_citric)) / count(winedata)

#Proportion of observations being within 2 standard deviations
count(subset(winedata, winedata$citric.acid >= m_citric-2*sd_citric & winedata$citric.acid <= m_citric+2*sd_citric)) / count(winedata)

#Proportion of observations being within 3 standard deviations
count(subset(winedata, winedata$citric.acid >= m_citric-3*sd_citric & winedata$citric.acid <= m_citric+3*sd_citric)) / count(winedata)