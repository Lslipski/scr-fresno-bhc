# load table of facilities locations
library(dplyr)
library(readr)

get_facilities <- function(site = 'all') {
  df <- readr::read_csv(file = here::here("data/facilities.csv")) %>% 
    dplyr::arrange(name)
  
  if (site == "chcc") {
    df <- df %>% 
      dplyr::filter(org == "community_medical_centers")
  }
  if (site == "other") {
    df <- df %>% 
      dplyr::filter(!org == "community_medical_centers")
  }
  
  return(df)
}