#' Run a quick EDA analysis
#'
#' @param df dataframe
#' @param target character
#'
#' @return (list) List that contains statistical summaries and a pairplot.
#' @export
#'
#' @examples
#' df <- data.frame(num1 = c(8.5, 8, 9.2, 9.1, 9.4),
#'                  num2 = c(0.88, 0.93, 0.95 , 0.92 , 0.91),
#'                  num3 = c(0.46, 0.78, 0.66, 0.69, 0.52),
#'                  num4 = c(0.082, 0.078, 0.082, 0.085, 0.066),
#'                  cat1 = c("Good","Okay","Excellent","Terrible","Good"),
#'                  target = c(2,2,3,1,3))
#' result <- eda(df,"target")
#' nb_num_feat  <- result$nb_num_features
#' nb_cat_feat <- result$nb_cat_features
#' ls_cat_feat <- result$cat_features
#' ls_num_feat <- result$num_features
#' nb_class<- result$nb_classes
#' pair_plot <- result$pairplot

eda <- function(df, target){

  results <- vector('list', 7)
  names(results) <- c("num_features_name", "cat_features_name","nb_cat_features","nb_num_features","nb_class","missing","pairplot")

  if (!is.data.frame(df)) {
    stop('filter_wrapper expects a data frame object')
  }
  if(!(target %in% c(colnames(df)))) {
    stop('column name is incorrect')

  }

  drop <- c(target)
  df_fea <- df[,!(names(df) %in% drop)]
  results$num_features_name = c(colnames(dplyr::select_if(df_fea, is.numeric)))
  results$cat_features_name = c(colnames(df_fea[!(names(df_fea) %in% results$num_features_name)]))
  results$nb_num_features = length(results$num_features_name)
  results$nb_cat_features = length(results$cat_features_name)
  results$nb_class = sort(unique(df[,target]))
  results$missing = tibble::as_tibble(purrr::map(purrr::map_df(df_fea,is.na),sum))
  results$pairplot = GGally::ggpairs(dplyr::select_if(df_fea, is.numeric))
  return (results)

}
