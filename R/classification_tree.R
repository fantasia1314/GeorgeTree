#' Classification Tree
#'
#' Fit a classification tree model using the rpart package.
#'
#' @param x A data frame containing the predictor variables.
#' @param y A factor vector containing the categorical response variable.
#' @param control A list of control parameters for the rpart function (optional).
#' @param ... Additional arguments to be passed to the rpart function.
#'
#' @return A fitted rpart object.
#' @export
#'
#' @examples
#' data(iris)
#' x <- iris[, -5]
#' y <- iris$Species
#' class_tree <- classification_tree(x, y)
classification_tree <- function(x, y, control = rpart::rpart.control(), ...) {
  if (!inherits(x, "data.frame")) {
    stop("x must be a data.frame")
  }

  if (!is.factor(y)) {
    stop("y must be a factor vector")
  }

  rpart::rpart(formula = as.formula("y ~ ."), data = x, method = "class", control = control, ...)
}

