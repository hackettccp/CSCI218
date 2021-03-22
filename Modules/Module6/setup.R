#Loading libraries and data source
library(tidyverse)
library(readr)
winedata <- read.csv("winequality-red.csv")
vgdata <- read.csv("vgsales.csv")
disneydata <- read.csv("disney.csv")

#Takes a vector, normalizes it to a new vector, NA's any data outside of n standard deviations
#and returns it
#x: vector of data
#n: number of standard deviations
#m: mean
#s: standard deviation
sdrange <- function(x, n, m, s) {
  one <- dnorm(x, m, s)
  one[x<=m-s*n | x>= m+s*n] <- NA
  return(one)
}

#Returns the observations in the left tail
lefttail <- function(x, t, m, s) {
  left <- dnorm(x, m, s)
  left[x>t] <- NA
  return(left)
}

#Returns the observations in the right tail
rightttail <- function(x, t, m, s) {
  right <- dnorm(x, m, s)
  right[x<=t] <- NA
  return(right)
}

#Returns the observations between two limits
area <- function(d, low, high) {
  a <- data.frame(x=d$x, y=d$y)        #Convert to a data frame with only x and y
  a <- subset(a, x>=low & x<=high)     #Subset the observations within the desired range
  ax <- c(low,a$x,high)                #Add low and high x coordinates
  ay <- c(0,a$y,0)                     #Add matching 0 y coordinates
  a <- data.frame(x=ax, y=ay)          #Create a new data frame with the updated coordinates
  return(a)
}
