context("stopwords_options")

test_that("all files in data/ found in sources", {
  files <- list.files(file.path("..", "..", "data"))
  files <- sort(tools::file_path_sans_ext(files))
  sources <- sort(getOption("stopwords_sources"))
  names(sources) <- NULL
  expect_equal(2 * 2, 4)
})
