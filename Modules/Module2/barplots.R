library(ggplot2)

#Basic bar plot
ggplot(data = diamonds, aes(x = color)) + 
  geom_bar()

#Stacked bar plot
ggplot(data = diamonds, aes(x = color)) + 
       geom_bar(aes(fill = cut))

#Grouped bar plot
ggplot(data = diamonds, aes(x = cut)) + 
       geom_bar(aes(fill = color), position = "dodge")

#Needed for count function
library(dplyr)

#Proportion bar plots
cut_counts <- count(diamonds, cut)

ggplot(data = cut_counts, aes(x = "", y = n, fill = cut)) + 
  geom_bar(stat = "identity", position = "fill") +
  labs(x = "Cuts", y = "Proportion")

ggplot(data = diamonds, aes(x = cut)) + 
  geom_bar(aes(fill = color), position = "fill") + 
  labs(y = "Proportion")


