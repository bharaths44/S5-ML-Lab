library(gbm)
data(iris)
iris
iris$Species<-as.factor(iris$Species)
set.seed(123)
idx<-sample(1:nrow(iris),0.8*nrow(iris))
train_data<-iris[idx,]
test_data<-iris[-idx,]
ans<-gbm(Species ~ .,data = train_data,distribution = "multinomial",n.trees = 100,interaction.depth = 3,shrinkage = 0.1)
p<-predict(ans,newdata = test_data,n.trees=100,type = "response")
class_predictions<-apply(p,1,which.max)
conf_matrix <- table(class_predictions, test_data$Species)
print(conf_matrix)

