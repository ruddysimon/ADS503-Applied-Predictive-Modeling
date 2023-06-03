# ADS-503 Final Project: Cervical Cancer Biopsy Prediction
# Authors: Ruddy Simonpour & Shailja Somani

## distribution of the columns on separate plots
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