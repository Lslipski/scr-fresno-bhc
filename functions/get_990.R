#' get_990
#' 
#' This pulls from the Giving Tuesday Data Commons. API Directions were found at
#' the following: https://990data.givingtuesday.org/asset-bank/
#'
#' @param ein string
#' @import httr2
#' @import jsonlite
#'
#' @returns a tibble parsed from a json
get_990 <- function(ein) {
  resp <- httr2::request("https://990-infrastructure.gtdata.org/irs-data/990basic120fields") |> 
    httr2::req_url_query(
      ein = ein,
    ) %>% 
    httr2::req_perform() %>% 
    httr2::resp_body_string() %>% 
    jsonlite::fromJSON() 
}