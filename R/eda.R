#' Run a quick EDA analysis
#'
#' @param df dataframe
#' @param target character
#'
#' @return (list) List that contains statistical summaries and a pairplot.
#' @export
#'
#' @examples
#' result <- eda(mtcars)
#' nb_num_feat  <- result$nb_num_features
#' nb_cat_feat <- result$nb_cat_features
#' ls_cat_feat <- result$cat_features
#' ls_num_feat <- result$num_features
#' nb_class<- result$nb_classes
#' pair_plot <- result$pairplot
eda <- function(df, target){
}