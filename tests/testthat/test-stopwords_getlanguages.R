context("stopwords_getlanguages")

# Sources
snowball <- stopwords::data_stopwords_snowball
stopwordsiso <- stopwords::data_stopwords_stopwordsiso
misc <- stopwords::data_stopwords_misc
smart <- stopwords::data_stopwords_smart

test_that("returns languages for source: Snowball", {
  expect_equal(names(snowball), stopwords_getlanguages("snowball"))
})

test_that("returns languages for source: Stopwords-ISO", {
  expect_equal(names(stopwordsiso), stopwords_getlanguages("stopwords-iso"))
})

test_that("returns languages for source: Misc", {
  expect_equal(names(misc), stopwords_getlanguages("misc"))
})

test_that("returns languages for source: Smart", {
  expect_equal(names(smart), stopwords_getlanguages("smart"))
})

test_that("wrong source throws error", {
  expect_error(stopwords_getlanguages("not_existing_test_source"))
})
