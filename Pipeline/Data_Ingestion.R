
library(ggplot2)
library("Hmisc")

set.seed(007)
read_data <- function(x) {
  # will read data from input folder
  # used na.strings = "?" for the null values. The null values are stored as "?" in the dataset.
  cervical_data_raw <- read.csv(x, na.strings = "?")
  glimpse(cervical_data_raw)
  return(cervical_data_raw)
}


########################################################### check missing values 
check_nulls <- function(df) {
  null_counts <- colSums(is.na(df))
  
  total_data_points <- nrow(df) * ncol(df)  # calculate the total number of data points

  total_nulls <- sum(null_counts) # calculate the total number of missing values
  
  column_percentage_null <- (null_counts / nrow(df)) * 100   # calculate the percentage of missing values for cols

  total_percentage_null <- (total_nulls / total_data_points) * 100   # calculate the percentage of missing values in the whole dataset

  null_counts_df <- data.frame(
    Column = names(null_counts),
    Nulls = as.numeric(null_counts), 
    ColumnPercentage = column_percentage_null
  )
  
  null_counts_df <- rbind(null_counts_df, c("Total", "total_nulls", "total_percentage_null"))
  
  print(null_counts_df)
  return(null_counts_df)
}


########################################################### remove columns with more than 50% missing data
remove_cols <- function(df, threshold = 60) {
  null_counts_df <- check_nulls(df)
  
  cols_to_remove <- null_counts_df$Column[null_counts_df$ColumnPercentage > threshold] #columns to remove
  
  df <- df[, !(names(df) %in% cols_to_remove)]
  
  return(df)
}


########################################################### impute missing data with median
impute_median <- function(df, columns) {
  for (col in columns) {
    df[[col]][is.na(df[[col]])] <- median(df[[col]], na.rm = TRUE) #ignoring missing values when calculating the median (na.rm = TRUE).
  }
  return(df)
}


########################################################### impute missing data with mode for the binary variables
find_mode <- function(x) {
  u <- unique(x)
  tab <- tabulate(match(x, u))
  u[tab == max(tab)]
}


impute_mode <- function(df, columns) {
  for (col in columns) {
    df[[col]][is.na(df[[col]])] <- find_mode(df[[col]])
  }
  return(df)
}

########################################################### impute missing data using knn imputation
install.packages("DMwR")
library(DMwR)

# Function to impute NA values with kNN imputation
impute_with_knn <- function(df, k = 10) {
  df_imputed <- knnImputation(df, k = k)  # Perform kNN imputation
  return(df_imputed)
}


