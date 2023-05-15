library(devtools)
library(dotenv)
library(tibble)
library(overviewR)
library(covr)

Sys.setenv("_R_CHECK_SYSTEM_CLOCK_" = 0)
# Get the dependencies
use_package("httr")
use_package("jsonlite")
use_package("curl")
use_package("attempt")
use_package("purrr")
use_package("rjson")

