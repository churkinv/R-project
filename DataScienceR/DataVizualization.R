
#base example
barplot(
        names = df$Name,
        height = df$Value,
        col = alpha("#FF681D", 0.5),
        main = "Hello World",
        xlab = "Name",
        ylab = "Value")

cars<- read.csv("Cars.csv")

#installing ggplot2
install.packages("ggplot2")

#load its library
library(ggplot2)

#creating a bar chart
ggplot(
       data = cars,
    aes(x = Transmission)) +
       geom_bar() +
       ggtitle("Count of Cars by Transmission Type") +
        xlab("transmission Type") +
        ylab("Count of Cars")

#creating a histogram
ggplot(
       data = cars,
    aes(x = Fuel.Economy)) +
    geom_histogram(bins = 10) +
    ggtitle("Distribution Fuel Economy") +
    xlab("Fuel Economy(mpg)") +
    ylab("Count of Cars")

#creating a density plot
ggplot(
       data = cars,
    aes(x = Fuel.Economy)) +
    geom_density() +
    ggtitle("Distribution Fuel Economy") +
    xlab("Fuel Economy(mpg)") +
    ylab("Count of Cars")

#creating a scatterplot
ggplot(
       data = cars,
    aes(x = Cylinders,
    y = Fuel.Economy)) +
    geom_point() +
    ggtitle("Fuel Economy by Cylinders") +
    xlab("Number of Cylinders") +
    ylab("FuelEconomy (mpg)")


