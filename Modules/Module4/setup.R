#Ensure tidyverse is installed
#install.packages("tidyverse")

#Load tidyverse packages
library(tidyverse)

#The diamonds dataset is a dataset included with the ggplot2 tidyverse package
#It contains the prices and other attributes of almost 54,000 diamonds
#https://ggplot2.tidyverse.org/reference/diamonds.html

#Get just the color and cut columns from the dataset
diamonds_color_cut_dataframe <- diamonds[c("color", "cut")]

#Create a contingency table
color_cut_table <- table(diamonds_color_cut_dataframe$color, diamonds_color_cut_dataframe$cut)

#Display the contingency table
print(color_cut_table)

#Convert to proportions
color_cut_proportions <- prop.table(color_cut_table)

#Add margins/totals
color_cut_proportions <- addmargins(color_cut_proportions)

#Display the proportion table
print(color_cut_proportions)