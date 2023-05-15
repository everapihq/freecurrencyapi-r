#' Get the current status of the API.

#' @param currencies (required) A list of comma seperated currency codes which you want to get (EUR,USD,CAD) By default all available currencies will be shown.
#' @return Returns all our supported currencies.
#' @export

get_supported_currencies <- function(currencies = NULL) {

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
  api_url <- "https://api.freecurrencyapi.com/v1/currencies"

  # generate query
  params <- list(apikey = apikey)

  # append params to query if not null
  if(!is.null(currencies)) {
    currencies <- gsub(" ", "", currencies)
    params['currencies'] <- currencies
  }

  # make the API request
  response <- httr::GET(api_url, query = params)

  # check if the request was successful
  data <- success_check(response)

  data <- jsonlite::fromJSON(httr::content(response, as = 'text' ,type = 'application/json', encoding="UTF-8"), flatten = TRUE)

  # return the result
  return(data)
}
