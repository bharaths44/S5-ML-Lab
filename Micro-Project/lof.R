library(dbscan)
library(ggplot2)

# Load the Wine Quality dataset (White Wine)
wine_data <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv", sep = ";")
# Display summary of the dataset
summary(wine_data)
# Check the structure of the dataset
str(wine_data)
# Feature scaling (normalize the data)
wine_data_scaled <- as.data.frame(scale(wine_data))
# Extract features from the scaled dataset
features <- wine_data_scaled
features
lof_result <- lof(as.matrix(features), minPts = 70)
# Add LOF scores to the original dataset
wine_data_with_lof <- cbind(wine_data, LOF = lof_result)



lof_threshold <- 2.5
outliers <- which(lof_result > lof_threshold)
wine_data_with_outlier <- cbind(wine_data,
  LOF = lof_result,
  Outlier = lof_result > lof_threshold
)
ggplot(
  wine_data_with_outlier,
  aes(x = 1:nrow(wine_data_with_lof), y = LOF, color = factor(Outlier))
) +
  geom_point() +
  scale_color_manual(
    values =
      c("blue", "red"), labels = c("Normal", "Outlier")
  ) +
  labs(
    title = "Local Outlier Factor Analysis on Wine Quality Dataset",
    x = "Data Points",
    y = "LOF Score"
  )
