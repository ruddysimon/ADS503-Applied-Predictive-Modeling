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
                    tuneLength = tuneLength_range,
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
knn_model_train <- function(train_X, train_y, cntrl, k_range) {


  knnGrid <- expand.grid(k = k_range)
  
  set.seed(100)
  
  knnTune <- train(x = train_X, 
                   y = train_y, 
                   method = "knn", 
                   tuneGrid = knnGrid, 
                   trControl = cntrl)
  
  return(knnTune)
}

##############################################Random Forest (RF)
rf_model_train <- function(train_X, train_y, cntrl) {
  
  #mtryGrid <- data.frame(mtry = floor(seq(10, ncol(train_X)/3, length = 10)),
       #                   ntree = c(100, 200, 300, 400, 500))

  mtryGrid <- data.frame(mtry = floor(seq(10, ncol(train_X)/3, length = 10)))
  
  set.seed(100)
  
  rfTune <- train(x = train_X, y = train_y,
                  method = "rf",
                  tuneGrid = mtryGrid,
                  importance = TRUE,
                  trControl = cntrl)
  
  return(rfTune)
}

#################################################Logistic Regression Model
lr_model_train <- function(train_X, train_y, cntrl) {
  
  # Train new model
  lrFit <- train(x = train_X, 
                 y = train_y,
                 method = "glm",
                 metric = "ROC",
                 trControl = cntrl)

  
  return(lrFit)
}

##################################################LDA Model
lda_model_train <- function(train_X, train_y, cntrl) {
  
  ldaFit <- train(x = train_X, 
                  y = train_y,
                  method = "lda",
                  preProc = c("center","scale"),
                  metric = "ROC",
                  trControl = ctrl)
  return(ldaFit)
  
}

#######################################Penalized Logistic Regression Model
glmn_model_train <- function(train_X, train_y, cntrl) {
  
  glmnGrid <- expand.grid(alpha = c(0,  .1,  .2, .4, .6, .8, 1),
                          lambda = seq(.01, .2, length = 10))
  
  glmnFit <- train(x = train_X, 
                   y = train_y,
                   method = "glmnet",
                   tuneGrid = glmnGrid,
                   metric = "ROC",
                   trControl = ctrl)
  return(glmnFit)

}

##########################################Nearest Shrunken Centroids Model
nsc_model_train <- function(train_X, train_y, cntrl) {
  
  nscFit <- train(x = train_X, 
                  y = train_y,
                  method = "pam",
                  tuneGrid = data.frame(threshold = seq(0, 25, length = 30)),
                  metric = "ROC",
                  trControl = ctrl)
  
  return(nscFit)
  
}


# Prediction Results Function

##########################################Prediction Results Function

get_prediction_results<- function(model, test_X, test_y) {
  prediction <- predict(model, test_X, type = "prob")
  prediction_class <- ifelse(prediction[,2] > 0.5, 1, 0) 
  results <- data.frame(
    observation = as.factor(test_y), 
    prediction = as.factor(prediction_class), 
    class_prob = prediction[,2] 
  )
  return(results)
}


# Function to calculate accuracy
get_accuracy <- function(model, test_X, test_y) {
  pred <- predict(model, newdata = test_X)
  acc <- postResample(pred, test_y)["Accuracy"]
  return(acc)
}

###############################################Recursive Feature Elimination
linear_rfe <- function(train_X, train_y) {
  
  set.seed(100)
  
  control <- rfeControl(functions = lmFuncs,   
                        method = "cv",         
                        number = 5,            
                        verbose = FALSE)
  
  # Perform RFE
  rfe_result <- rfe(train_X, train_y,       
                    sizes = c(1:ncol(train_X)),    
                    rfeControl = control)           
  
  # Access the selected features
  selected_features <- predictors(rfe_result)
  return(selected_features)
  
}


