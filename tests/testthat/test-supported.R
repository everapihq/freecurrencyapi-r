test_that("supported currencies check works", {

  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()

  x <- get_supported_currencies()

  expect_equal(class(x), "list")
  expect_equal(x$data$USD$symbol, "$")
})
