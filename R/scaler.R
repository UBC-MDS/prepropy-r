#' Scaling a dataframe
#'
#' This function scales numerical features based on scaling requirement in a data.frame
#'
#' @param X_train data.frame
#' @param X_Valid data.frame
#' @param X_test data.frame
#' @param scale_features character vector
#' @param scaler_type character 
#'
#' @return data.frame of data.frames
#' @export
#'
#' @examples
#' X_train<- data.frame('name' = c('pandaman', 'doorman', 'eve'), 'age' = c(15,20,25), 'networth' = c(100000,100,100000))
#' X_Valid<- data.frame('name' = c('pandaman_v', 'doorman_v', 'eve_v'), 'age' = c(15,56, 43) , 'networth' = c(123124, 352334,645645)
#' X_test <- data.frame('name' = c('pandaman_t', 'doorman_t', 'eve_t'), 'age' =c(14,15,56), 'networth' = c(123124,90914, 124124)
#' scaled_df <- scaler(X_train, X_Valid, X_test, c('age','networth'), scaler_type='standardscaler')
scaler <- function(X_train, X_Valid, X_test, scale_features, scaler_type){
}