# Load the necessary library
library(rpart)
library(rpart.plot)
library(caret)
# Load the Titanic dataset
titanic <- read.csv("/Users/bharaths/Downloads/S5-ML-Lab/Exp6/titanic.csv")

# Select relevant columns for the analysis
titanic <- titanic[, c(
    "Pclass",
    "Sex",
    "Age",
    "SibSp", "Parch", "Embarked", "Survived"
)]

set.seed(123)
titanic <- na.omit(titanic)
split_index <- createDataPartition(titanic$Survived, p = 0.8, list = FALSE)
training_data <- titanic[split_index, ]
testing_data <- titanic[-split_index, ]

tree_model <- rpart(Survived ~ ., data = training_data, method = "class")
prp(tree_model) # plot the tree model in plots gui

# Make predictions (whether a person survived or not) on testing data
predictions <- predict(tree_model, newdata = testing_data, type = "class")

# factor the survived prediction and actual value
testing_data$Survived <- as.factor(testing_data$Survived)
predictions <- as.factor(predictions)

# pring confusion matrix
confusionMatrix(predictions, testing_data$Survived)
