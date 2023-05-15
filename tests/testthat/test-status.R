test_that("status check works", {

  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()

  x <- get_api_status()

  expect_equal(class(x), "list")
  expect_equal(class(x$account_id), "numeric")
})
