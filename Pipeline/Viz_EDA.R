<<<<<<< HEAD
# ADS-503 Final Project: Cervical Cancer Biopsy Prediction
# Authors: Ruddy Simonpour & Shailja Somani

## distribution of the columns on separate plots
########################################################### Distribution of the columns
>>>>>>> 9c1965af21e70ab3f3e03c47e830bc307bf06def
plot_distributions <- function(df, column_indices) {
  selected_cols <- names(df)[column_indices]
  
  for(col in selected_cols){
    p <- ggplot(df, aes_string(col)) + geom_histogram(bins = 30) + theme_minimal() + 
        labs(title=col, x=NULL) +  theme(plot.title = element_text(hjust = 0.5))
    print(p)
  }
}

# Plot all histograms of a dataframe together. Each plot will have 9 histograms
hist.df <- function(df) {
  par(mfrow=c(3,3))
  lapply(names(df), function(col) hist(df[, col], main=col, xlab="", ylab="", col="gray", breaks=10))
}

# Create boxplots for all features - helps visualize outliers
# Each plot will have 10 boxplots
boxplot.df <- function(df) {
  par(mfrow=c(2,5))
  for(i in 1:ncol(df)) {
    boxplot(df[[i]], main=colnames(df)[i], col="gray")
  }
}
########################################################### Scatter plot of columns

library(ggplot2)
create_scatterplot <- function(df, x_var, y_var, color_var, x_label, y_label, title, legend_title) {
  p <- ggplot(df, aes_string(x = x_var, y = y_var, color = color_var)) + 
    geom_point(show.legend = TRUE) +
    labs(x = x_label, y = y_label, title = title, color = legend_title) +
    scale_color_gradient(low = "green", high = "red", na.value = "blue", guide = "legend") +
    theme_minimal() + theme(legend.position = "bottom")
  print(p)
}
