rm(list = ls())

data <- App.Ranking <- read.csv("C:/Users/Lenovo/OneDrive/Desktop/Maths PPT/App Ranking.csv")

cor(data$Number.of.Registered.Users, data$Number.of.Downloads, method = 'spearman')

plot(data$Number.of.Registered.Users, data$Number.of.Downloads, main = "Correlation between 
     number of registered users and rank of downloads",
     xlab = 'Number of registered users', ylab = 'Number of Downloads')

cor(data$Number.of.Downloads, data$Page.Rank, method = "spearman")

plot(data$Page.Rank, data$Number.of.Downloads, main = "Correlation between 
     number of registered users and rank of downloads",
     xlab = 'Page Rank', ylab = 'Number of Downloads')



