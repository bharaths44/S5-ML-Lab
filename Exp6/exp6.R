# Load the necessary library
library(rpart)

# Load the Titanic dataset
titanic <- read.csv("C:\\Users\\student\\Documents\\u2109018\\exp6\\titanic.csv")  

# Data preprocessing: Handling missing values and feature selection
# For simplicity, we drop some columns with missing data and select relevant features
titanic <- titanic[, c("Pclass", "Sex", "Age", "SibSp", "Parch", "Fare", "Survived")]

# Handling missing values by removing rows with missing data
titanic <- na.omit(titanic)

# Convert 'Sex' to a factor
titanic$Sex <- as.factor(titanic$Sex)

# Create a decision tree model for predicting survival (1 for survived, 0 for not survived)
tree_model <- rpart(Survived ~ ., data = titanic, method = "class")

sink(file = "exp6_output.txt")
# Print the decision tree
print(tree_model)
sink(file = NULL)

# Visualize the decision tree
library(rpart.plot)
prp(tree_model)

# Make predictions with the decision tree model
predictions <- predict(tree_model, newdata = titanic, type = "class")

# Evaluate the model
confusion_matrix <- table(Actual = titanic$Survived, Predicted = predictions)
print(confusion_matrix)