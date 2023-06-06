# library(caret)

preprocess_data <- function(train_X, test_X) {
  preProcessData <- preProcess(train_X, method = c("center", "scale"))
  train_X <- predict(preProcessData, train_X)
  test_X <- predict(preProcessData, test_X)
  
  list(train_X = train_X, test_X = test_X)
}
