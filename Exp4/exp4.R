library(ggplot2)
setwd(file.path("C:\\Users\\student\\Downloads"))

Titanic <- read.csv("titanic.csv")
titanic <- as.data.frame(Titanic)
histogram <- ggplot(titanic, aes(x = Age)) +
  geom_histogram(binwidth = 5,fill = "Black",color = "White")+
  labs(title = "Histogram of Age information",
       x = "Age",
       y = "Frequency",
       fill = "Survived")
print(histogram)
