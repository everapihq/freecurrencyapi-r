#' Get exchange rate from the Freecurrencyapi.com API
#'
#' @param base_currency The base currency for the conversion (e.g., "USD")
#' @return Returns the latest currency exchange rates.
#' @export



get_latest_exchange_rates <- function(base_currency = NULL) {

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
  api_url <- "https://api.freecurrencyapi.com/v1/latest"

  # make the API request
  response <- httr::GET(api_url, query = list(apikey = apikey, base_currency = base_currency))

  # check if the request was successful
  data <- success_check(response)

  data <- jsonlite::fromJSON(httr::content(response, as = 'text' ,type = 'application/json', encoding="UTF-8"), flatten = TRUE)

  # return the result
  return(data)
}
