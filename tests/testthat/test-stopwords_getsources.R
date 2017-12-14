context("stopwords_getsources")

test_that("returns all source names", {
  sourceNames <- names(getOption("stopwords_sources"))
  expect_equal(sourceNames, stopwords_getsources())
})
