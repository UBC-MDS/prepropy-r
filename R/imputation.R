#' Imputing Missing Data
#'
#' This function will impute missing data in a tibble/dataframe given the chosen method(mean, median)
#'
#' @param fit_data list
#' @param fill_data list
#' @param method character
#' @param constant character, default NULL
#'
#' @return list
#' @export
#'
#' @examples
#' test_df <- data.frame('a' = c(1,NA,3), 'b' = c(5,6,NA), 'c' = c(NA,1,10))
#' test_df_imputed <- imputation(test_df, test_df, 'mean')
imputation <- function(fit_data, fill_data, method, constant = NULL){
  # check dataframe type
  if(!typeof(fit_data) == 'list'){
    stop("Fit Data should be a dataframe object")
  }
  if(!typeof(fill_data) == 'list'){
    stop('Filled Data should be a dataframe object')
  }
  # check using existing methods
  if(!method %in% c('mean', 'median', 'constant')){
    stop('Method must be one of mean, median, constant')
  }
  # check size of fill and fit
  if(!dim(fit_data)[2] == dim(fill_data)[2]){
    stop('fit_data and fill_data must have equal number of columns')
  }
  # check whether fit data is all numeric when mean/median is selected as method
  if(method %in% c('mean', 'median')){
    if(!sum(sapply(fit_data, is.numeric)) == dim(fit_data)[2]){
      stop('fit_data must contain all numeric values')
    }
  }
  # method = mean
  if(method == 'mean'){
    means <- colMeans(fit_data, na.rm = TRUE)
    means <- split(means, names(means))
    filled_data <- tidyr::replace_na(fill_data, means)
  }
  # method = median
  else if (method == 'median'){
    medians <- sapply(fit_data, median, na.rm = TRUE )
    medians <- split(medians, names(medians))
    filled_data <- tidyr::replace_na(fill_data, medians)
  }
  # method = constant
  else{
    filled_data <- fill_data
    filled_data[is.na(filled_data)] = constant
  }
  filled_data



}
