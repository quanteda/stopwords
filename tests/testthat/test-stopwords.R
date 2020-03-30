context("test-stopwords.R")

# Helper
create_test_data <- function(source_data, source_name) {
  test_data <- lapply(names(source_data), function(x) stopwords(x, source = source_name))
  names(test_data) <- names(source_data)
  test_data
}

# Sources
snowball <- stopwords::data_stopwords_snowball
stopwordsiso <- stopwords::data_stopwords_stopwordsiso
misc <- stopwords::data_stopwords_misc
smart <- stopwords::data_stopwords_smart
marimo <- stopwords::data_stopwords_marimo
nltk <- stopwords::data_stopwords_nltk

test_that("all languages work for source: Snowball", {
  test_data <- create_test_data(snowball, "snowball")
  expect_equal(snowball, test_data)
})

test_that("all languages work for source: Stopwords-ISO", {
  test_data <- create_test_data(stopwordsiso, "stopwords-iso")
  expect_equal(stopwordsiso, test_data)
})

test_that("all languages work for source: Misc", {
  test_data <- create_test_data(misc, "misc")
  expect_equal(misc, test_data)
})

test_that("all languages work for source: Smart", {
  test_data <- create_test_data(smart, "smart")
  expect_equal(smart, test_data)
})

test_that("all languages work for source: NLTK", {
  test_data <- create_test_data(nltk, "nltk")
  expect_equal(nltk, test_data)
})

test_that("full name language returns same values", {
  expect_equal(stopwords("en"), stopwords("english"))
})

test_that("wrong source throws error", {
  expect_error(stopwords("en", "not_existing_test_source"))
})

test_that("wrong language throws error", {
  expect_error(stopwords("not_existing_test_language"))
})

test_that("null stopwords throw error", {
  # a valid 2-character language that's not in the source
  expect_error(stopwords("cs"))
})

test_that("multiple language matches throw error", {
  # a valid 2-character language that's not in the source
  expect_error(stopwords("south"))
})

test_that("deprecation warning if SMART is only argument", {
  # a valid 2-character language that's not in the source
  expect_warning(stopwords("smart"))
})

test_that("deprecation warning if MISC language without source MISC", {
  # a valid 2-character language that's not in the source
  expect_warning(stopwords("ar"))
})

test_that("error conditions work", {
  expect_error(
    stopwords(language = c("en", "fr")),
    "only one language may be specified"
  )
  expect_error(
    stopwords(language = c("en"), source = c("snowball", "stopwords-iso")),
    "only one source may be specified"
  )
})

test_that("simplify works", {
  expect_is(stopwords("en", source = "marimo", simplify = TRUE),
            "character")
  expect_is(stopwords("en", source = "marimo", simplify = FALSE),
            "list")
})
