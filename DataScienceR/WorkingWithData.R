
#set the working directory
setwd ("E:/OneDrive/Проекты/IT_Step/VS_2017/DataScienceR/DataScienceR"); # note we use forward slach  

# t states for tab
# \ escape 
#read a tab-delimeted data file
cars <- read.table(
                   file = "Cars.txt",
                   header = TRUE,
                   sep = "\t",        
                   quote = "\"");

#peer at the data
head(cars)

#load the dplyr library, already done
library(dplyr);

#select a subset of columns
temp <- select(
               .data = cars,
               Transmission,
               Cylinders,
               Fuel.Economy);

#inspect the results
head(temp);

#filter a subset of rows
temp <- filter(
               .data = temp,
               Transmission == "Automatic");

#inspect the results
head(temp);