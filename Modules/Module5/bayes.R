#Make sure setup.R was run first

#Bayes' Theorem
#P(A|B) = P(B|A)*P(A)/P(B)

#What is the probability that a diamond is Ideal cut given its color is E?
# P(A|B) = P(Cut is Ideal given Color is E)
# P(A) = P(Cut is Ideal)
# P(B) = P(Color is E)
# P(B|A) = P(Color is E given Cut is Ideal)
print(color_cut_proportions["E", "Ideal"] / color_cut_proportions["Sum", "Ideal"] *
       color_cut_proportions["Sum", "Ideal"] /
       color_cut_proportions["E", "Sum"])

#What is the probability that a diamond's color is E given its cut is Ideal?
# P(A|B) = P(Color is E given Cut is Ideal)
# P(A) = P(Color is E)
# P(B) = P(Cut is Ideal)
# P(B|A) = P(Cut is Ideal given Color is E)
print(color_cut_proportions["E", "Ideal"]/color_cut_proportions["E", "Sum"] *
        color_cut_proportions["E", "Sum"] /
        color_cut_proportions["Sum", "Ideal"])
