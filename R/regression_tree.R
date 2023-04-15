#' Regression Tree
#'
#' Fit a regression tree model using the rpart package.
#'
#' @param x A data frame containing the predictor variables.
#' @param y A vector containing the continuous response variable.
#' @param control A list of control parameters for the rpart function (optional).
#' @param ... Additional arguments to be passed to the rpart function.
#'
#' @return A fitted rpart object.
#' @export
#'
#' @examples
#' data(mtcars)
#' x <- mtcars[, -1]
#' y <- mtcars$mpg
#' reg_tree <- regression_tree(x, y)
#' summary(reg_tree)
regression_tree <- function(x, y, control = rpart::rpart.control(), ...) {
  if (!inherits(x, "data.frame")) {
    stop("x must be a data.frame")
  }

  if (!is.numeric(y)) {
    stop("y must be a numeric vector")
  }

  rpart::rpart(formula = as.formula("y ~ ."), data = x, control = control, ...)
}
