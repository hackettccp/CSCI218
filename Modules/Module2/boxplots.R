library(ggplot2)

#City mileage boxplots per car class
ggplot(data = mpg) + 
  geom_boxplot(mapping = aes(x=class, y = cty))

summary(subset(mpg, class=="suv")$cty)

ggplot(data = subset(mpg, class=="suv")) + 
  geom_boxplot(mapping = aes(x=class, y = cty))