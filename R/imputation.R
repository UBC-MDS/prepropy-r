#' Imputing Missing Data
#'
#' This function will impute missing data in a tibble/dataframe given the chosen method(mean, median, most_frequent)
#'
#' @param fit_data list
#' @param fill_data list
#' @param method character
#'
#' @return list
#' @export
#'
#' @examples
#' test_df <- data.frame('a' = c(1,NA,3), 'b' = c(5,6,NA), 'c' = c(NA,1,10))
#' test_df_imputed <- imputation(test_df, test_df, 'mean')
imputation <- function(fit_data, fill_data, method){
}
