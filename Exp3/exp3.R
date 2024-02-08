library(ggplot2)


data(iris)


scatter_plot <- ggplot(iris, aes(
  x = Petal.Length,
  y = Petal.Width,
  color = factor(Species),
  shape = factor(Species)
)) +
  # geom_smooth(method = "glm", se = FALSE, color = "black", linetype = "dashed") +
  geom_point() +
  labs(
    title = "Scatter Plot of Petal Length VS. Petal Width",
    x = "Petal Length",
    y = "Petal Width"
  ) +
  guides(
    color = guide_legend(title = "Species"),
    shape = guide_legend(title = "Species")
  )
print(scatter_plot)
