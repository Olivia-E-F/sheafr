#' read_assignment
#' @title Read Assignment
#' @description This function formats the necessary columns for a sheaf assignment.
#' This can be paired with sheaves later in your sheaf building process.
#' @param source A list of characters or factors. Each source is an originating node.
#' @param values A list of doubles. The values attributed to variables at each node.
#' @param variables A list of characters. The variables at each node.
#'
#' @return returns a formatted [data.frame()].
#' @export
#'
#' @examples
#' read_assignment(source = c("A", "B", "C"),
#'                 values = c(2, 4, 3),
#'                 variables = c("x", "y", "z"))

read_assignment <- function(source, values, variables) {
  as.data.frame(tibble::tibble(source = {{source}},
                       values = {{values}},
                       vars = {{variables}}))

}
