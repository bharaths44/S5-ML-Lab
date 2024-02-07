library(caret)
library(class)

data(iris)
set.seed(123)


preproc <- preProcess(iris[, -5], method = c("center", "scale"))
iris[, -5] <- predict(preproc, iris[, -5])

split_index <- createDataPartition(iris$Species, p = 0.8, list = FALSE)

training_data <- iris[split_index, ]
testing_data <- iris[-split_index, ]

# Target variable needs to be omitted from training and testing data
# the cl(class label) is the target variable to be predicted
print("K=3")
print("========================================")
classifier_knn <- knn(
    train = training_data[, -5],
    test = testing_data[, -5],
    cl = training_data$Species,
    k = 3
)

confusionMatrix(testing_data$Species, classifier_knn)

print("K=5")
print("========================================")
classifier_knn <- knn(
    train = training_data[, -5],
    test = testing_data[, -5],
    cl = training_data$Species,
    k = 5
)
confusionMatrix(testing_data$Species, classifier_knn)

print("K=7")
print("========================================")
classifier_knn <- knn(
    train = training_data[, -5],
    test = testing_data[, -5],
    cl = training_data$Species,
    k = 7
)
confusionMatrix(testing_data$Species, classifier_knn)
