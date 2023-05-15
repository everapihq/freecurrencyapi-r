#' Get the current status of the API.
#' @return Returns your current quota. Requests to this endpoint do not count against your quota or rate limit.
#' @export
#'


get_api_status <- function() {

  # ensure necessary packages are installed
  if (!requireNamespace("httr", quietly = TRUE)) {
    stop("Please install the 'httr' package to use this function.")
  }
  if (!requireNamespace("jsonlite", quietly = TRUE)) {
    stop("Please install the 'jsonlite' package to use this function.")
  }

  # check for API key or ask for API key
  apikey <- freecurrencyapi_api_key()

  # define the API URL
  api_url <- "https://api.freecurrencyapi.com/v1/status"

  # generate query
  params <- list(apikey = apikey)

  # append params to query if not null

  # make the API request
  response <- httr::GET(api_url, query = params)

  # check if the request was successful
  data <- success_check(response)

  data <- jsonlite::fromJSON(httr::content(response, as = 'text' ,type = 'application/json', encoding="UTF-8"), flatten = TRUE)


  # return the result
  return(data)
}
