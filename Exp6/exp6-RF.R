library(randomForest)
library(caret)

dataset <- read.csv("/Users/bharaths/Downloads/S5-ML-Lab/Exp6/Soybean.csv")


soybean <- na.omit(dataset)
preproc <- preProcess(soybean[, -1], method = c("center", "scale"))
soybean[, -1] <- predict(preproc, soybean[, -1])

set.seed(123) # For reproducibility
splitIndex <- createDataPartition(soybean$Class, p = 0.8, list = FALSE)
training_data <- soybean[splitIndex, ]
testing_data <- soybean[-splitIndex, ]

# Train a Random Forest classifier
model <- train(Class ~ ., data = training_data, method = "rf")
predictions <- predict(model, newdata = testing_data)

predictions <- as.factor(predictions)
testing_data$Class <- as.factor(testing_data$Class)

# Evaluate the model's performance
confusionMatrix(predictions, testing_data$Class)
