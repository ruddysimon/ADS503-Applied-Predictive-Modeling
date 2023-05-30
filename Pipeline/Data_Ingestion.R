set.seed(007)
read_data <- function(x) {
  # will read data from input folder
  # used na.strings = "?" for the null values. The null values are stored as "?" in the dataset.
  cervical_data_raw <- read.csv(x, na.strings = "?")
  glimpse(cervical_data_raw)
  return(cervical_data_raw)
}


                                                                                #### check missing values 
check_nulls <- function(df) {
  null_counts <- colSums(is.na(df))
  
  total_data_points <- nrow(df) * ncol(df)  # calculate the total number of data points

  total_nulls <- sum(null_counts) # calculate the total number of missing values
  
  column_percentage_null <- (null_counts / nrow(df)) * 100   # calculate the percentage of missing values for cols

  total_percentage_null <- (total_nulls / total_data_points) * 100   # calculate the percentage of missing values in the whole dataset

  # Convert the output to a data frame
  null_counts_df <- data.frame(
    Column = names(null_counts),
    Nulls = as.numeric(null_counts), 
    ColumnPercentage = column_percentage_null
  )
  
  null_counts_df <- rbind(null_counts_df, c("Total", "total_nulls", "total_percentage_null"))
  
  print(null_counts_df)
  return(null_counts_df)
}


                                                                                #### remove columns with more than 50% missing data
remove_cols <- function(df, threshold = 60) {
  null_counts_df <- check_nulls(df)
  
  cols_to_remove <- null_counts_df$Column[null_counts_df$ColumnPercentage > threshold] #columns to remove
  
  df <- df[, !(names(df) %in% cols_to_remove)]
  
  return(df)
}