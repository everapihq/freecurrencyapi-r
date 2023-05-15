test_that("historical exchange rates check works", {

  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()

  x <- get_historical_exchange_rates("2021-01-01")

  expect_equal(class(x), "list")
  expect_equal(class(x$data), "list")

  y <- get_historical_exchange_rates("2021-01-01", "EUR")

  expect_equal(class(y), "list")
  expect_equal(class(y$data), "list")

  z <- get_historical_exchange_rates("2021-01-01", "EUR", "AUD")

  expect_equal(class(z), "list")
  expect_equal(class(z$data), "list")

})
