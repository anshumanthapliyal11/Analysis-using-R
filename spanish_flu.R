rm(list = ls())
data <- read.csv("C:/Users/Lenovo/OneDrive/Desktop/Maths PPT/Spanish Flu_line_list_data_in_Chicago.csv")
install.packages("Hmisc")
library(Hmisc)
describe(data)

#cleaned up the data
data$death_dummy <- as.integer(data$death != 0)

# death rate
death_rate <- sum(data$death_dummy) / nrow(data) # it is 0.05806452

# AGE
# claim: people who die are older
dead = subset(data, death_dummy == 1)
alive = subset(data, death_dummy == 0)
mean(dead$age, na.rm = TRUE)
mean(alive$age, na.rm = TRUE)
plot(data$death_dummy, data$age, main = 'Scatterplot showing correlation between age and deaths(1-death; 0-alive)', xlab = 'Deaths', ylab = 'Age', pch = 19, frame = FALSE)
# is this statistically significant?
t.test(alive$age, dead$age, alternative="two.sided", sig.level = 0.05)
# normally, if p-value < 0.05, we reject null hypothesis
# here, p-value ~ 0, so we reject the null hypothesis and 
# conclude that this is statistically significant

# GENDER
# claim: gender has no effect
men = subset(data, gender == "male")
women = subset(data, gender == "female")
mean(men$death_dummy, na.rm = TRUE) #8.5%
mean(women$death_dummy, na.rm = TRUE) #3.7%
# is this statistically significant?
t.test(men$death_dummy, women$death_dummy, alternative="two.sided", sig.level = 0.05)
# p-value = 0.002 < 0.05, so this is statistically
# significant