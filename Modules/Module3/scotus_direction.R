##
# The U.S. Supreme Court Database traces its history back about two decades ago, when Harold J. Spaeth asked 
# the National Science Foundation to fund a database that would be so rich in content that multiple users - 
# even those with vastly distinct projects and purposes in mind - could draw on it. Professor Spaeth's goal 
# was at once refreshingly simple and extremely ambitious: to produce a database that would include and classify 
# every single vote by a Supreme Court justice in all argued cases over a five-decade period. After securing the funding, 
# Spaeth collected and coded the data, performed reliability checks, and eventually amassed the Database. In the late 1980s, 
# he made it (and the documentation necessary to use it) publicly available.
# Since then, Professor Spaeth has not only updated it each term; he has also continued to perform reliability analyses, 
# thereby ensuring its integrity with each release, and added new variables. Today's version of the Database houses 247 
# pieces of information for each case, roughly broken down into six categories: (1) identification variables (e.g., citations 
# and docket numbers); (2) background variables (e.g., how the Court took jurisdiction, origin and source of the case, 
# the reason the Court agreed to decide it); (3) chronological variables (e.g., the date of decision, term of Court, natural court);
# (4) substantive variables (e.g., legal provisions, issues, direction of decision); (5) outcome variables 
# (e.g., disposition of the case, winning party, formal alteration of precedent, declaration of unconstitutionality); 
# and (6) voting and opinion variables (e.g., how the individual justices voted, their opinions and interagreements).
# Case Centered data provides case level information; i.e., each row in the database corresponds to a dispute. 
# These data do not contain specific justice vote information.
#
# See https://think.cs.vt.edu/corgis/csv/supreme_court/ for data dictionary
##

library(readr)
court_data <- read.csv("supreme_court.csv")

#install.packages("dplyr")
library(dplyr)

#Paring it down to two variables
court_data <- select(court_data, decision.direction, `lower court.direction`)

#A table of SCOTUS court decision directions (rows) vs. lower court decision directions (columns)
t <- table(court_data$decision.direction, court_data$`lower court.direction`)

#Filtering to only get conservative or liberal-leaning SCOTUS decisions
court_data <- filter(court_data, decision.direction %in% c("conservative", "liberal"))

#Updated table
t <- table(court_data$decision.direction, court_data$`lower court.direction`)

#A mosaic plot of the table
mosaicplot(t, main="Lower Court v SCOTUS decision direction", xlab="SCOTUS direction", ylab="Lower Court direction")

#Creating a proportion table
pt <- prop.table(t)

#Barplot of the proportions
barplot(pt, main="SCOTUS decision direction", xlab="Lower court direction", ylab="Proportion", ylim=c(0,0.7), legend.text=rownames(t), args.legend=list(x='right'))