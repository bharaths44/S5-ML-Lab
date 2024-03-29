library(ggplot2)
titanic <- read.csv("/Users/bharaths/Downloads/S5-ML-Lab/Exp4/titanic.csv")
titanic <- na.omit(titanic)
histogram <- ggplot(titanic, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "Black", color = "White") +
  labs(
    title = "Histogram of Age information",
    x = "Age",
    y = "Frequency",
  )
print(histogram)
