########################################################### Distribution of the columns
plot_distributions <- function(df, column_indices) {
  selected_cols <- names(df)[column_indices]
  
  for(col in selected_cols){
    p <- ggplot(df, aes_string(col)) + geom_histogram(bins = 30) + theme_minimal() + 
        labs(title=col, x=NULL) +  theme(plot.title = element_text(hjust = 0.5))
    print(p)
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
