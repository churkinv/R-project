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