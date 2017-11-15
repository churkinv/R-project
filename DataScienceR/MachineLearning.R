#predicting with Machine Learning

#load the date
data(iris)

#set a seed to make randomness reproducable
set.seed(42)

#randomly sample 100 of 150 row indexes
indexes <- sample(
                  x = 1:150,
                  size = 100)

#inspect the random indexes
print(indexes)

#create a training set from indexes
train <- iris[indexes,]

#create a test set from remaining indexes
test <- iris[-indexes,]

#load the decision tree package
install.packages("tree")
library(tree)

#train a decision tree model
model <- tree(
              formula = Species ~ ., # we could use Petal.Length+Petal.Width + Sepal.Length... But . is easiest way, as it includes all) 
              data = train)

#inspect the model
summary(model)

#visualize the decision tree model
plot(model)
text(model)

#load a color brewer library
library(RColorBrewer)

#create a color pallete
palette <- brewer.pal(3, "Set2")

#create a scatterplot colored by species
plot(
     x = iris$Petal.Length,
     y = iris$Petal.Width,
     pch = 19,
     col = palette[as.numeric(iris$Species)],
     main = "Iris Petal Length vs Width",
     xlab = "Petal Length(cm)",
     ylab = "Petal Width(cm)")

#plot the decision boundaries
partition.tree(
               tree = model,
               label = "Species",
               add = TRUE) # meand we want to add these boundaries to our previous scatterplot

#predict with the model
predictions <- predict(
                       object = model,
                       newdata = test,
                       type ="class")

#create a confusion matrix
table(
      x = predictions,
      y=test$Species)