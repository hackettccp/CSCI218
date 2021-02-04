###
# This dataset is about substance abuse (cigarettes, marijuana, cocaine, alcohol) 
# among different age groups and states. Data was collected from individual states 
# as part of the NSDUH (National Survey on Drug Use and Health) study. The data ranges 
# from 2002 to 2014. Some values were imputed, meaning that they are estimated. 
# Both totals (in thousands of people) and rates (as a percentage of the population) are given.
# See https://think.cs.vt.edu/corgis/csv/drugs/ for data dictionary
###

library(readr)
drug_data <- read.csv("drugs.csv")

#install.packages("dplyr")
library(dplyr)

#To examine the structure (str) of the data frame
str(drug_data)

#Only State is categorical
#To show the levels (unique categories)
factor(drug_data$State)

#To show the number of levels
length(factor(drug_data$State))

#Getting just the variables/columns State, Year, the population of the 18-25 age group in the state,
#and the estimated number of people that have binged on alcohol in the past month among this age group. 
#Binge Alcohol Use is defined as drinking five or more drinks on the same occasion 
#(i.e., at the same time or within a couple of hours of each other) on at least 1 day in the past 30 days
PA_NY_NJ_DE_data <- select(drug_data, State, Year, Population.18.25, Totals.Alcohol.Binge.Past.Month.18.25)

#Getting just the rows for PA, NJ, NY, and DE
PA_NY_NJ_DE_data <- filter(PA_NY_NJ_DE_data, State=="Pennsylvania"|State=="New Jersey"|State=="New York"|State=="Delaware")
#Alternative
PA_NY_NJ_DE_data <- filter(PA_NY_NJ_DE_data, State %in% c("Pennsylvania","New Jersey","New York","Delaware"))

#Filtering further for year 2002
PA_NY_NJ_DE_data <- filter(PA_NY_NJ_DE_data, Year==2002)

#Calculating proportions
proportions <- c(PA_NY_NJ_DE_data$Totals.Alcohol.Binge.Past.Month.18.25/PA_NY_NJ_DE_data$Population.18.25)

#Bar plot of the proportions
barplot(proportions, main="2002", ylab="Proportion", xlab="States", names.arg=PA_NY_NJ_DE_data$State)


#Same as above, but for 2014
PA_NY_NJ_DE_data2014 <- select(drug_data, State, Year, Population.18.25, Totals.Alcohol.Binge.Past.Month.18.25)
PA_NY_NJ_DE_data2014 <- filter(PA_NY_NJ_DE_data2014, State %in% c("Pennsylvania","New Jersey","New York","Delaware"))
PA_NY_NJ_DE_data2014 <- filter(PA_NY_NJ_DE_data2014, Year==2014)
proportions2014 <- c(PA_NY_NJ_DE_data2014$Totals.Alcohol.Binge.Past.Month.18.25/PA_NY_NJ_DE_data2014$Population.18.25)
barplot(proportions2014, main="2014", ylab="Proportion", xlab="States", names.arg=PA_NY_NJ_DE_data2014$State)