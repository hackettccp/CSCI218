library(ggplot2)

#Scatterplot mileage vs displacement
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cty, y = displ), color="blue") + 
  geom_point(mapping = aes(x = hwy, y = displ), color="red") +
  labs(x="Mileage", y="Engine Displacement")

#Scatterplot mileage vs displacement, colored by manufacturer
ggplot(data = mpg, aes(color=manufacturer)) + 
  geom_point(mapping = aes(x = cty, y = displ)) + 
  labs(x="City Mileage", y="Engine Displacement")