context("stopwords_getsources")

test_that("returns all source names", {
  source_names <- names(getOption("stopwords_sources"))
  expect_equal(source_names, stopwords_getsources())
})
