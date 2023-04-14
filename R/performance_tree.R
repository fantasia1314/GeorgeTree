#' Evaluate Tree Performance
#'
#' Create performance evaluation tables and plots for a classification or regression tree.
#'
#' @param tree A fitted rpart object.
#' @param x A data frame containing the predictor variables.
#' @param y A vector containing the response variable (either continuous or categorical).
#' @param plot A logical value indicating whether to plot the tree (TRUE) or not (FALSE). Default is TRUE.
#'
#' @return A list containing the performance metrics.
#' @export
#'
#' @examples
#' data(mtcars)
#' x <- mtcars[, -1]
#' y <- mtcars$mpg
#' reg_tree <- regression_tree(x, y)
#' performance <- performance_tree(reg_tree, x, y)
performance_tree <- function(tree, x, y, plot = TRUE) {
  if (!inherits(tree, "rpart")) {
    stop("tree must be a fitted rpart object")
  }

  if (!inherits(x, "data.frame")) {
    stop("x must be a data.frame")
  }

  predicted <- predict(tree, x)

  if (is.factor(y)) {
    # Classification tree
    accuracy <- mean(predicted == y)
    confusion_matrix <- table(Predicted = predicted, Actual = y)
    performance <- list(accuracy = accuracy, confusion_matrix = confusion_matrix)
  } else {
    # Regression tree
    mse <- mean((predicted - y)^2)
    performance <- list(mse = mse)
  }

  if (plot) {
    rpart.plot::rpart.plot(tree)
  }

  return(performance)
}
