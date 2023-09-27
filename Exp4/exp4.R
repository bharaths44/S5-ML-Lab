# Load the necessary libraries

library(ggplot2)

# Load the Titanic dataset
data("Titanic")

# Convert the dataset to a data frame
titanic_df <- as.data.frame(Titanic)

# Create a simple histogram of passenger ages
ggplot(titanic_df, aes(x=Age, y=Freq)) + 
  geom_col() + 
  scale_x_discrete(limits = titanic_df$Age)+ 
  labs(
    title = "Age Distribution of Titanic Passengers",
    x = "Age",
    y = "Count",
    fill = "Age"
  ) 
