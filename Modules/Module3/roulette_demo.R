#Provides the spin and get_color functions
source("roulette_tools.R")

#Update for more simulations
number_of_spins = 10

#Gets a vector of results
spins <- spin(number_of_spins)

#Get a vector of colors that correspond to the vector of the spins
#https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/lapply
spincolors <- sapply(spins, get_color)

#Get the streaks
red_streak <- streak_count("red", spincolors)
black_streak <- streak_count("black", spincolors)

#Prints for verification
print(spins)      #(Not recommended for large simulations)
print(spincolors) #(Not recommended for large simulations)
print(red_streak)
print(black_streak)

