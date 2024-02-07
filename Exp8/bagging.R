library(ipred)
library(caret)

set.seed(123)

split_index <- createDataPartition(iris$Species, p = 0.8, list = FALSE)
training_data <- iris[split_index, ]
testing_data <- iris[-split_index, ]

bagged_model <- bagging(Species ~ ., data = training_data, nbagg = 50)

# Make predictions on the testing data
predictions <- predict(bagged_model, newdata = testing_data)

# Evaluate accuracy using confusion matrix
confusionMatrix(predictions, testing_data$Species)
