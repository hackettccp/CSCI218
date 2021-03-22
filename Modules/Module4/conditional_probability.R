#Make sure setup.R was run first

#Conditional Probability
#P(A|B) = P(A and B)/P(B)

#What is the probability that a diamond has a Very Good cut given its color is H?
# P(Cut is Very Good given Color is H)
# P(A) = P(Cut is Very Good)
# P(B) = P(Color is H)
PAandB <- color_cut_proportions["H", "Very Good"]
PB <- color_cut_proportions["H", "Sum"]
PAgivenB <- PAandB / PB
print(PAgivenB)


#What is the probability that a diamond is Ideal cut given its color is E?
# P(Cut is Ideal given Color is E)
# P(A) = P(Cut is Ideal)
# P(B) = P(Color is E)
#print(color_cut_proportions["E", "Ideal"]/color_cut_proportions["E", "Sum"])


#What is the probability that a diamond is E color given it has an ideal cut?
# P(Color is E given Cut is Ideal)
# P(A) = P(Color is E)
# P(B) = P(Cut is Ideal)
#print(color_cut_proportions["E", "Ideal"]/color_cut_proportions["Sum", "Ideal"])


#What is the probability that a diamond is Fair cut given its color is J?
# P(Cut is Fair given Color is J)
# P(A) = P(Cut is Fair)
# P(B) = P(Color is J)
#print(color_cut_proportions["J", "Fair"]/color_cut_proportions["J", "Sum"])


#What is the probability that a diamond is J color given it has a fair cut?
# P(Color is J given Cut is Fair)
# P(A) = P(Color is J)
# P(B) = P(Cut is Fair)
#print(color_cut_proportions["J", "Fair"]/color_cut_proportions["Sum", "Fair"])

