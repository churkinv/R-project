
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

#compute a new column
temp <- mutate(
               .data = temp,
               Consumption = Fuel.Economy * 0.425);

#inspect the results
head(temp);

#group by a column
temp <- group_by(
               .data = temp,
               Cylinders);

#inspect the results
head(temp);

#aggregate based on groups
temp <- summarise(
               .data = temp,
               Avg.Consumption = mean(Consumption));

#inspect the results
head(temp);

#aggregate based on groups
temp <- summarise(
               .data = temp,
               Avg.Consumption = mean(Consumption));

#arrange the rows in descending order
temp <- arrange(
               .data = temp,
               desc(Avg.Consumption));

#inspect the results
head(temp);

#convert data frame
efficency <- as.data.frame(temp);

#inspect the results
print(efficency);

#chains the same methods together
efficency <- cars %>%
    select(Fuel.Economy, Cylinders, Transmission) %>%
    filter(Transmission == "Automatic") %>%
    mutate(Consumtion = Fuel.Economy * 0.425) %>%
    group_by(Cylinders) %>%
    summarize(Avg.Consumption = mean(Consumtion)) %>%
    arrange(desc(Avg.Consumption)) %>%
    as.data.frame();

#inspect the results
print(efficency);

#save the results to a csv file
write.csv(
          x = efficency,
          file = "Fuel Efficiency.csv",
          row.names = FALSE);