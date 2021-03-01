#Gets a density estimate
d <- density(winedata$citric.acid)

#Plots a continuous distribution with a section of the area shaded in
#with a polygon
ggplot(data = winedata, aes(x = citric.acid)) +
  geom_density(fill = "lightgray", color = "steelblue", alpha=0.5) +
  geom_polygon(data = area(d, 0.2, 0.4), mapping = aes(x=x, y=y), fill = "skyblue", alpha=0.75) +
  scale_x_continuous(breaks=seq(0, 1, .1), limits=c(-0.1,1))
