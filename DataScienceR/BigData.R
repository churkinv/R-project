
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
install.packages("biglm") # special package for linear regression with big data which use much less memory than traditional l.regression algorithm
library(biglm)

#create a linear regression model
model <- biglm(
               formula = Petal.Width ~ Petal.Length,
               data = irisff)

#summaraize the model
summary(model)

#create a scatterplot
plot(
     x = irisff$Petal.Length[],
     y = irisff$Petal.Width[],
     main = "Iris Petal Legth vs. Width",
     xlab = "Petal Length(cm)",
     ylab = "Petal Width(cm)")

#get y-intercept from the model
b <- summary(model)$mat[1, 1]

#get slope from the model
m <- summary(model)$mat[2, 1]

#draw a regression line on plot
lines(
      x = irisff$Petal.Length[],
      y = m * irisff$Petal.Length[] + b,
      col = "red",
      lwd = 3)

#predict new values with the model
predict(
        object = model,
        newdata = data.frame(
        Petal.Length = c(2, 5, 7),
        Petal.Width = c(0,0,0)))