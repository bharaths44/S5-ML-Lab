library(e1071)

# Load the Iris dataset
data(iris)
head(iris)

# Split the dataset into training and testing sets
set.seed(123)
indices <- sample(1:nrow(iris), 0.8 * nrow(iris))
train_data <- iris[indices, -5]  # Excluding the target variable
train_labels <- iris$Species[indices]
test_data <- iris[-indices, -5]  # Excluding the target variable
test_labels <- iris$Species[-indices]

# Train an SVM classifier
svm_model <- svm(train_data, train_labels, kernel = "radial", cost = 1)

# Make predictions on the test data
svm_predictions <- predict(svm_model, test_data)

# Evaluate the model's performance
confusion_matrix <- table(Actual = test_labels, Predicted = svm_predictions)
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
cat("Confusion Matrix:\n", confusion_matrix, "\n")
cat("Accuracy: ", accuracy, "\n")