# Naive  Bayes Classification

library(e1071)
library(caret)

soybean <- read.csv("/Users/bharaths/Downloads/S5-ML-Lab/Exp5/Soybean.csv")

# preporcessing 1: removing missing values
soybean <- na.omit(soybean)
set.seed(123)
# preprocessing 2: Centering
# preprocessing 3: Scaling

preproc <- preProcess(soybean[, -1], method = c("center", "scale"))
soybean[, -1] <- predict(preproc, soybean[, -1])

# preprocessing 4: Splitting into training and testing data

split_index <- createDataPartition(soybean$Class, p = 0.8, list = FALSE)
training_data <- soybean[split_index, ]
testing_data <- soybean[-split_index, ]

# create a model to predict the "Class" of each testing data
naive_bayes_model <- naiveBayes(Class ~ ., data = training_data)

# use the model to predict on testing data
predictions <- predict(naive_bayes_model, newdata = testing_data)


predictions <- as.factor(predictions)


testing_data$Class <- as.factor(testing_data$Class)


# create confusion matrix of predicted class vs actual class
print(confusionMatrix(predictions, testing_data$Class))
