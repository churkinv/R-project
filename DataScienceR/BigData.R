
install.packages("ff")
library(ff)

#read a CSV file as ff data frame
irisff <- read.table.ffdf(
                          file = "iris.csv",
                          FUN = "read.csv")

#inspect the class
class(irisff)

#inspect the column names
names(irisff)

#inspect the frirs few rows
irisff[1:5,]

#load the biglm package
install.packages("biglm")
library(biglm)

#create a linear regression model