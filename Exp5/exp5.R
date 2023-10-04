#install.packages("mlbench")
#install.packages("caret")
#install.packages("ggplot2")
#install.packages("randomForest")

library(mlbench)
library(caret)
dataset <- read.csv("~/Bharath CSBs/Soybean.csv")
dataset


sum(is.na(dataset))
soybean <- na.omit(dataset)
preproc <- preProcess(soybean[, -1], method = c("center", "scale"))
soybean[, -1] <- predict(preproc, soybean[, -1])
set.seed(123)  # For reproducibility
splitIndex <- createDataPartition(soybean$Class, p = 0.8, list = FALSE)
training_data <- soybean[splitIndex, ]
testing_data <- soybean[-splitIndex, ]

# Load required packages
library(randomForest)

# Train a Random Forest classifier
model <- train(Class ~ ., data = training_data, method = "rf")

# Make predictions on the testing data
predictions <- predict(model, newdata = testing_data)
predictions <- as.factor(predictions)

sink(file = "exp5_output.txt")
testing_data$Class<-as.factor(testing_data$Class)
typeof(testing_data$Class)
typeof(predictions)


# Evaluate the model's performance
confusionMatrix(predictions, testing_data$Class)

sink(file = NULL)