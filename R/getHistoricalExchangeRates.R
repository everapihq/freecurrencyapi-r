#' Get historical exchange rates for a specific date for a single or multiple currencies.

#' @param date (required) Date to retrieve historical rates from (format: 2021-12-31)
#' @param base_currency The base currency for the conversion (e.g., "USD")
#' @param currencies A list of comma seperated currency codes which you want to get (EUR,USD,CAD) By default all available currencies will be shown

#' @return Returns exchange rates for a given time range. Generally, we provide data going back to 1999.
#' @export


get_historical_exchange_rates <- function(date, base_currency = NULL, currencies = NULL) {

  # ensure necessary packages are installed
  if (!requireNamespace("httr", quietly = TRUE)) {
    stop("Please install the 'httr' package to use this function.")
  }
  if (!requireNamespace("jsonlite", quietly = TRUE)) {
    stop("Please install the 'jsonlite' package to use this function.")
  }

  # check for API key or ask for API key
  apikey <- freecurrencyapi_api_key()

  # check if date is passed and not null
  if(is.null(date)) {
    stop("date is required and can not be null.")
  }

  # define the API URL
  api_url <- "https://api.freecurrencyapi.com/v1/historical"

  # generate query
  params <- list(apikey = apikey, date = date)

  # append params to query if not null
  if(!is.null(base_currency)) {
    params['base_currency'] <- base_currency
  }

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
