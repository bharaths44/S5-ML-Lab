library(mlbench)
library(caret)
dataset <- read.csv("C:/Users/student/Documents/u2109018/exp5/Soybean.csv")
dataset


sum(is.na(dataset))
soybean <- na.omit(dataset)
preproc <- preProcess(soybean[, -1], method = c("center", "scale"))
soybean[, -1] <- predict(preproc, soybean[, -1])
set.seed(123)  # For reproducibility
splitIndex <- createDataPartition(soybean$Class, p = 0.8, list = FALSE)
training_data <- soybean[splitIndex, ]
testing_data <- soybean[-splitIndex, ]


predictions <- predict(model, newdata = testing_data)
predictions <- as.factor(predictions)

sink(file = "C:/Users/student/Documents/u2109018/exp5/exp5_output.txt")

testing_data$Class<-as.factor(testing_data$Class)


print("----------- Naive Bayes Classifier ------------")
#install.packages("e1071")
library(e1071)
# Train the Naive Bayes classifier
nb_model <- naiveBayes(Class ~ ., data = training_data)
# Make predictions on the testing data
predictions <- predict(nb_model, newdata = testing_data)
# Load the caret package (if not already loaded)
library(caret)
# Create a confusion matrix
confusion_matrix <- confusionMatrix(predictions, testing_data$Class)
# View the confusion matrix and associated metrics
print(confusion_matrix)

sink(file = NULL)

