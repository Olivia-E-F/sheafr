#' sheaf_assignment
#'
#' @title Initiating a Sheaf-Assignment Pair
#' @description This function will create a sheaf assignment pair.
#' This dictates a sheaf on a topological space paired with an assignment to the sheaf.
#' @param assignment This should be the outputted data frame from read_assignment.
#' @param sheaf This should be the sheaf structure from create_sheaf.
#'
#' @return This will return a sheaf assignment pair as an altered data frame.
#' @export
#'
#' @examples
#' read_assignment(source = c("A", "B", "C"),
#'                 values = c(2, 4, 3),
#'                 variables = c("x", "y", "z")) -> assignment
#' X <- function(stalk){select("y")}
#' create_sheaf(restriction_maps = c(X), source = c("A"), destination = c("B")) -> sheaf
#' sheaf_assignment(assignment, sheaf)

sheaf_assignment <- function(assignment, sheaf) {
  {{assignment}} %>%
    select(vars, values, source) %>%
    pivot_wider(names_from = vars, values_from = values) %>%
    right_join({{sheaf}}, by = c(source = "source"), multiple="all") %>%
    nest(stalkinput = !source & !map & !dest) %>%
    mutate(stalkoutput = map2(.x= map, .y = stalkinput, .f = exec))

}
