test_that("latest exchange rates check works", {

  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()

  x <- get_latest_exchange_rates()

  expect_equal(class(x), "list")

  y <- get_latest_exchange_rates("EUR")

  expect_equal(class(y), "list")
  expect_equal(class(y$data$USD), "numeric")

})
