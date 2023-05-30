                                                                                ## distribution of the columns
plot_distributions <- function(df, column_indices) {
  selected_cols <- names(df)[column_indices]
  
  # Analyzing the distribution of variables
  for(col in selected_cols){
    p <- ggplot(df, aes_string(col)) + geom_histogram(bins = 30) + theme_minimal() + 
        labs(title=col, x=NULL) +  theme(plot.title = element_text(hjust = 0.5))
    print(p)
  }
}
