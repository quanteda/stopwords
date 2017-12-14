#' set package options for stopwords
#'
#' Set global options affecting functions across \pkg{stopwords}.
#' @details Currently available options are: \describe{
#' \item{\code{stopwords_sources}}{character; vector of the stopword source labels.}
#' }
#' @export
#' @keywords internal
stopwords_options <- function() {
  options(
    stopwords_sources = c(snowball = "data_stopwords_snowball",
                          "stopwords-iso" = "data_stopwords_stopwordsiso",
                          misc = "data_stopwords_misc",
                          smart = "data_stopwords_smart")
  )
}

# Load options on attach
.onAttach <- function(...) {
  stopwords_options()
}
