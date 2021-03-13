#' Scaling a dataframe
#'
#' This function scales numerical features based on scaling requirement(standardization, minmax Scaling) in a data.frame
#'
#' @param X_train data.frame
#' @param X_valid data.frame
#' @param X_test data.frame
#' @param scaler_type character
#'
#' @return data.frame of data.frames
#' @export
#'
#' @examples
#' scaled_df <- scaler(X_train, X_Valid, X_test, scaler_type='standardization')
scaler <- function(X_train, X_valid, X_test, scaler_type){

  # checking if scaling methods are valid
  if(!scaler_type %in% c('standardization', 'minmax')){
    stop('Scaling method must be standardization or minmax')
  }

  #Checking input data type
  if(!typeof(X_train) == 'list'){
    stop('X_train should be a dataframe object')
  }
  if(!typeof(X_valid) == 'list'){
    stop('X_valid should be a dataframe object')
  }
  if(!typeof(X_test) == 'list'){
    stop('X_test should be a dataframe object')
  }

  #Checking if all data is numeric
  if(!sum(sapply(X_train, is.numeric)) == dim(X_train)[2]){
    stop('X_train must contain all numeric values')
  }
  if(!sum(sapply(X_valid, is.numeric)) == dim(X_valid)[2]){
    stop('X_valid must contain all numeric values')
  }
  if(!sum(sapply(X_test, is.numeric)) == dim(X_test)[2]){
    stop('X_test must contain all numeric values')
  }


  #Scaling Code
  if (scaler_type == 'standardization'){
    #Performing standardization
    pp = caret::preProcess(X_train, method=c("center", "scale"))
    X_train_scaled <- predict(pp, X_train)
    X_valid_scaled <- predict(pp, X_valid)
    X_test_scaled <- predict(pp, X_test)
  }

  if (scaler_type == 'minmax'){
    #Performing Min-max Scaling
    pp = caret::preProcess(X_train, method=c("range"))
    X_train_scaled <- predict(pp, X_train)
    X_valid_scaled <- predict(pp, X_valid)
    X_test_scaled <- predict(pp, X_test)
  }
  out <- list()
  out$train <- X_train_scaled
  out$test <- X_test_scaled
  out$valid <- X_valid_scaled
  return(out)
}
