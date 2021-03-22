#Provides the spin and get_color functions
source("roulette_tools.R")

#Update for more simulations
number_of_spins = 50

#Gets a vector of results
spins <- spin(number_of_spins)

#Get a vector of colors that correspond to the vector of the spins
#https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/lapply
spincolors <- sapply(spins, get_color)

#Convert to table, then to prop table
colortable <- prop.table(table(spincolors))

#Bind with the expected probabilities, plot side by side
barplot(rbind(c(.486, .272, .486), colortable), beside=TRUE)