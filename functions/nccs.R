# The following functions work with data from the National Center for Charitable 
# Statistics. Code developed from examples here: https://nccs.urban.org/nccs/datasets/bmf/

download_nccs <- function(year = NA,
                          month = NA,
                          interactive = 1) {
  
  base <- "https://nccsdata.s3.us-east-1.amazonaws.com/raw/bmf/"
  
  # use year/month if provided otherwise use current
  if (is.na(year) & is.na(month)) {
    YYYYMM <- format( Sys.time(), "%Y-%m-" )  # eg "2024-12-"  current month
  } else if (!is.na(year) & !is.na(month)) {
    YYYYMM <- paste0(year, month)
  } else {
    stop("Must enter both valid year and month, or leave both NA")
  }

  filename <- paste0(YYYYMM, "BMF.csv" )   # eg "2024-12-BMF.csv"
  savename <- here::here(paste0("raw_data/", 
                                "nccs_",
                                filename))
  URL <- paste0(base, filename)        # eg "https://.../2024-12-BMF.csv"
  
  writeLines(paste0("Writing From: ",
                    URL, "\n",
                    "Writing To: ",
                    savename))
  
  if (interactive == 1) {
  q = readline(prompt = "Enter 999 to continue: ")
  } else {
    q = "999"
  }
  
  if (q == "999") {
  curl::curl_download(url=URL, 
                      destfile=savename, 
                      mode="wb" )
  }
  
  out <- dplyr::read_csv(savename)
  
  return(out)

}


load_nccs <- function(year = NA,
                      month = NA) {
  
  # use year/month if provided otherwise use current
  if (is.na(year) & is.na(month)) {
    YYYYMM <- format( Sys.time(), "%Y-%m-" )  # eg "2024-12-"  current month
  } else if (!is.na(year) & !is.na(month)) {
    YYYYMM <- paste0(year,"-", month, "-")
  } else {
    stop("Must enter both valid year and month, or leave both NA")
  }
  
  filename <- paste0(YYYYMM, "BMF.csv" )   # eg "2024-12-BMF.csv"
  savename <- here::here(paste0("raw_data/", 
                                "nccs_",
                                filename))
  
  out <- readr::read_csv(savename)
  
  return(out)
}
