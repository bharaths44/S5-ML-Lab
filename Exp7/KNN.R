library(e1071) 
library(caTools) 
library(class) 

head(iris) 

split <- sample.split(iris, SplitRatio = 0.8) 
train_cl <- subset(iris, split == "TRUE") 
test_cl <- subset(iris, split == "FALSE") 

train_scale <- scale(train_cl[, 1:4]) 
test_scale <- scale(test_cl[, 1:4]) 

cm <- table(test_cl$Species, classifier_knn) 
cm 

#K = 3
classifier_knn <- knn(train = train_scale, 
                      test = test_scale, 
                      cl = train_cl$Species, 
                      k = 3)
classifier_knn
misClassError <- mean(classifier_knn != test_cl$Species) 
print(paste('Accuracy =', 1-misClassError)) 

# K = 5 
classifier_knn <- knn(train = train_scale, 
                      test = test_scale, 
                      cl = train_cl$Species, 
                      k = 5) 
misClassError <- mean(classifier_knn != test_cl$Species) 
print(paste('Accuracy =', 1-misClassError)) 

# K = 7 
classifier_knn <- knn(train = train_scale, 
                      test = test_scale, 
                      cl = train_cl$Species, 
                      k = 7) 
misClassError <- mean(classifier_knn != test_cl$Species) 
print(paste('Accuracy =', 1-misClassError)) 

# K = 15 
classifier_knn <- knn(train = train_scale, 
                      test = test_scale, 
                      cl = train_cl$Species, 
                      k = 15) 
misClassError <- mean(classifier_knn != test_cl$Species) 
print(paste('Accuracy =', 1-misClassError)) 

# K = 19 
classifier_knn <- knn(train = train_scale, 
                      test = test_scale, 
                      cl = train_cl$Species, 
                      k = 19) 
misClassError <- mean(classifier_knn != test_cl$Species) 
print(paste('Accuracy =', 1-misClassError)) 

