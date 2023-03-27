#' create_sheaf
#'
#' @title Create Sheaf
#' @description create_sheaf is a basic set-up function in sheafr, and the output is a standardized sheaf.
#' A sheaf is a topological data structure, encapsulated here as a formatted data frame.
#' This creates a model for data to flow along a path through provided restriction maps, or functions.
#' @param restriction_maps A list of functions. For each pair of open sets there is a restriction.
#' These can be projections, linear maps, etc.
#' @param source A list of originating nodes.
#' @param destination A list of terminal nodes.
#'
#' @return The output of this function is a data frame.
#' @export
#'
#' @examples
#' X <- function(stalk){select("y")}
#' create_sheaf(restriction_maps = c(X), source = c("A"), destination = c("B"))

create_sheaf <- function(restriction_maps, source, destination) {
  as.data.frame(tibble::tibble(map = {{restriction_maps}},
                               source = {{source}},
                               dest =   {{destination}}))

}
