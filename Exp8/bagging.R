library(ipred)
data("iris")
set.seed(123)
bagged_model<-bagging(Species~.,data=iris,nbagg=50)
predictions<-predict(bagged_model,newdata = iris)
confusion_matrix<-table(predictions,iris$Species)
confusion_matrix
