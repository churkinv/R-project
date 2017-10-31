#set the working directory
setwd("E:/OneDrive/Проекты/IT_Step/VS_2017/DataScienceR/DataScienceR")

#read a CSV data file
cars <- read.csv("Cars.csv")

#peek at the date
head(cars)

#create a freaquency table: How many cars do we have of each transmission type
table(cars$Transmission)

#get the minimum value: What does the distribution of values in our Fuel.Economy variable look like?
min(cars$Fuel.Economy)
