############################################### Neural Network Training Function
train_nnet_model <- function(train_X, train_y, ncol_train, cntrl) {
  nnetGrid <- expand.grid(decay = c(0, 0.01, .1), size = c(3, 7, 11, 13))
  set.seed(100)
  nnetTune <- caret::train(x = train_X, y = train_y,
                           method = "nnet",
                           tuneGrid = nnetGrid,
                           trControl = cntrl,
                           linout = FALSE, # FALSE => Classification task, TRUE => Regression task
                           trace = FALSE,
                           MaxNWts = 15 * ncol_train + 1,
                           maxit = 1000)
  return(nnetTune)
}

################################ Multivariate Adaptive Regression Splines (MARS)
train_mars_model <- function (train_X, train_y, nprune_range, cntrl) {
  set.seed(100)
  mars_model <- train(x = train_X, y = train_y,
                  method = "earth",
                  tuneGrid = expand.grid(degree = 1, nprune = nprune_range),
                  trControl = cntrl)
  return(mars_model)
}

################################################### Support Vector Machine (SVM) (svmRadial)
train_svm_model <- function (train_X, train_y, tuneLength_range, cntrl) {
  set.seed(100)
  svmRTune <- train(x = train_X, y = train_y,
                    method = "svmRadial",
                    tuneLength = 14,
                    trControl = cntrl)
  return(svmRTune)
}

################################################### Support Vector Machine (SVM) (svmPoly)
train_svm_poly <- function(train_X, train_y, cntrl){
  
  svm_grid <- expand.grid(degree = 1:2, 
                          scale=c(0.01, 0.005, 0.001),
                          C=2^(-2:5))
  
  set.seed(100)
  
  svm_model <- train(x = train_X, y = train_y,
                     method = "svmPoly",
                     tuneGrid = svm_grid,
                     trControl = cntrl)
  
  return(svm_model)
}

####################################################### K-nearest Neighbor (kNN)

knn_model_train <- function(train_X, train_y, k_range) {

  knnGrid <- expand.grid(k = k_range)
  
  set.seed(100)
  
  knnTune <- train(x = train_X, 
                   y = train_y, 
                   method = "knn", 
                   tuneGrid = knnGrid, 
                   trControl = cntrl)
  
  return(knnTune)
}


# Prediction Results Function
get_prediction_results<- function(model, test_X, test_y) {
  prediction <- predict(model, test_X, type = "prob")
  prediction_class <- ifelse(prediction[,2] > 0.5, "yes", "no") 
  results <- data.frame(
    observation = as.factor(test_y), 
    prediction = as.factor(prediction_class), 
    class_prob = prediction[,2] 
  )
  return(results)
}


