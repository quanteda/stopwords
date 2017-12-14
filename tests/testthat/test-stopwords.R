context("test-stopwords.R")

# Helper
createTestData <- function(sourceData, sourceName) {
  testData <- lapply(names(sourceData), function(x) stopwords(x, source = sourceName))
  names(testData) <- names(sourceData)
  testData
}

# Sources
snowball <- stopwords::data_stopwords_snowball
stopwordsiso <- stopwords::data_stopwords_stopwordsiso
misc <- stopwords::data_stopwords_misc
smart <- stopwords::data_stopwords_smart

test_that("all languages work for source: Snowball", {
  testData <- createTestData(snowball, "snowball")
  expect_equal(snowball, testData)
})

test_that("all languages work for source: Stopwords-ISO", {
  testData <- createTestData(stopwordsiso, "stopwords-iso")
  expect_equal(stopwordsiso, testData)
})

test_that("all languages work for source: Misc", {
  testData <- createTestData(misc, "misc")
  expect_equal(misc, testData)
})

test_that("all languages work for source: Smart", {
  testData <- createTestData(smart, "smart")
  expect_equal(smart, testData)
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
