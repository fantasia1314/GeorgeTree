#' Predict with Tree
#'
#' Make predictions using a fitted classification or regression tree.
#'
#' @param tree A fitted rpart object.
#' @param newdata A data frame containing the predictor variables for new observations.
#' @param ... Additional arguments to be passed to the predict.rpart function.
#'
#' @return A vector of predicted values.
#' @export
#'
#' @examples
#' data(mtcars)
#' x <- mtcars[, -1]
#' y <- mtcars$mpg
#' reg_tree <- regression_tree(x, y)
#' predictions <- predict_tree(reg_tree, x)
predict_tree <- function(tree, newdata, ...) {
  if (!inherits(tree, "rpart")) {
    stop("tree must be a fitted rpart object")
  }

  if (!inherits(newdata, "data.frame")) {
    stop("newdata must be a data.frame")
  }

  predicted_values <- predict(tree, newdata, ...)

  return(predicted_values)
}

