
#Returns a vector of numbers (0-36) chosen randomly with a length = count
spin <- function(count) {
  slots <- c(0:36)
  return(replicate(count, sample(slots, 1)))
}

#Returns a color (red, green, or black) based on the argument passed to the function
get_color <- function(num) {
  if(num > 36 | num < 0) {
    return("invalid");
  }
  if(num == 0) {
    return("green");
  }
  else if(num %in% c(2, 4, 6, 8, 10, 11, 13, 15, 17, 20, 22, 24, 26, 28, 29, 31, 33, 35)) {
    return("black");
  }
  else {
    return("red");
  }
}

#Calculates the longest streak of a color based on the color (first arg)
#and the vector of colors (second arg)
streak_count <- function(color, colors) {
  longest <- 0;
  current <- 0;
  for(c in colors) {
    if(c == color) {
      #Add one to the current streak
      current <- current + 1;
    }
    else {
      #Streak broken
      if(current > longest) {
        #Check if current streak is longer than the previous longest streak
        longest <- current;
      }
      #Reset the current streak
      current <- 0;
    }
  }
  if(current > longest) {
    #Edge case for if the longest streak is at the very end of the series
    longest <- current;
  }
  return(longest);
}