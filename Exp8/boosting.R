library(gbm)
library(caret)

data(iris)
set.seed(123)

split_index <- createDataPartition(iris$Species, p = 0.8, list = FALSE)
training_data <- iris[split_index, ]
testing_data <- iris[-split_index, ]

model <- gbm(Species ~ .,
    data = training_data,
    n.trees = 100
)
predictions <- predict(model, newdata = testing_data)

class_predictions <- colnames(predictions)[apply(predictions, 1, which.max)]
testing_data$Species <- as.factor(testing_data$Species)
class_predictions <- as.factor(class_predictions)

confusion_matrix <- confusionMatrix(class_predictions, testing_data$Species)
confusion_matrix
