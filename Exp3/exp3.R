
library(ggplot2)


data(iris)


scatter_plot <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species, shape = Species)) +
  geom_point(size = 2) + 
  geom_smooth(method = "lm", se = FALSE, color = "black", linetype = "dashed") +  # Add a regression line
  labs(title = "Scatter Plot of Sepal Length vs. Sepal Width",
       x = "Sepal Length",
       y = "Sepal Width") +  
  scale_color_manual(values = c("setosa" = "blue", "versicolor" = "green", "virginica" = "red")) +  
  scale_shape_manual(values = c("setosa" = 1, "versicolor" = 2, "virginica" = 3)) +  
  guides(color = guide_legend(title = "Species"), shape = guide_legend(title = "Species"))


print(scatter_plot)
