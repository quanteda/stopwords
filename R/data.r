#' multilingual stopwords from https://github.com/stopwords-iso/stopwords-iso
#'
#' The Stopwords ISO Dataset is the most comprehensive collection of stopwords
#' for multiple languages. The collection follows the ISO 639-1 language code.
#' @usage NULL
#' @section Usage:
#' \code{stopwords(language, source = "stopwords-iso")}
#' @format A named list of length 57, of character vectors that represent
#'   stopwords in 57 languages.  To see the languages available, use
#'   \code{\link{stopwords_getlanguages}}.
#' @source \url{https://github.com/stopwords-iso/stopwords-iso/}
"data_stopwords_stopwordsiso"

#' Internal function to update the data file
#'
#' Fetches new data from remote sources, which can be used to regenerate the stopword files.
#' @keywords internal
#' @examples
#' # data_stopwords_stopwordsiso <- update_stopwords("stopwords-iso)"
#' # devtools::use_data(data_stopwords_stopwordsiso)
update_stopwords <- function(source = c("stopwords-iso")) {
  source <- match.arg(source)
  url <- 'https://raw.githubusercontent.com/stopwords-iso/stopwords-iso/master/stopwords-iso.json'
  message("Rebuilding data from https://github.com/stopwords-iso/stopwords-iso/blob/master/stopwords-iso.json")
  json <- paste0(readLines(url, warn = FALSE), collapse="")
  message("data_stopwords_stopwordsiso has been updated.\n")
  message("To save:\n data_stopwords_stopwordsiso <- update_stopwords(\"stopwords-iso)\"\n devtools::use_data(data_stopwords_stopwordsiso)")
  invisible(rjson::fromJSON(json))
}


#' snowball stopword list
#'
#' @usage NULL
#' @section Usage:
#' \code{stopwords(language, source = "snowball")}
#' @details Provides stopword lists in multiple
#'   languages, based on the Snowball stemmer's word lists.
#' @source
#'   The main stopword lists are taken from the Snowball stemmer project in
#'   different languages (see \url{http://snowballstem.org/projects.html}).
#'
#'   The stopword lists can be found in \url{http://snowball.tartarus.org/dist/snowball_all.tgz}.
#' @seealso \code{\link{stopwords}}
"data_stopwords_snowball"


#' miscellaneous stopword lists
#'
#' Other, miscellaneous stopword lists.
#' @usage NULL
#' @section Usage:
#' \code{stopwords(language, source = "misc")}
#' @source
#'   The Arabic stopwords were supplied by Alexandra Siegel (documentation pending).
#'
#'   The Catalan stopwords come from \url{http://latel.upf.edu/morgana/altres/pub/ca_stop.htm}.
#'
#'   The Greek stopwords were supplied by Carsten Schwemmer (see
#'   \url{https://github.com/kbenoit/quanteda/issues/282}).
#'
#'   The Chinese stopwords are taken from the
#'   \url{http://www.baiduguide.com/baidu-stopwords/}{Baidu stopword list}.
"data_stopwords_misc"

#' stopword lists from the SMART system
#'
#' The stopword lists based on the SMART (System for the Mechanical Analysis and
#' Retrieval of Text) Information Retrieval System, an information retrieval
#' system developed at Cornell University in the 1960s.
#' @usage NULL
#' @section Usage:
#' \code{stopwords(language = "en", source = "smart")}
#' @source
#'   The English stopwrod list is taken from the
#'   \href{http://www.ai.mit.edu/projects/jmlr/papers/volume5/lewis04a/a11-smart-stop-list/english.stop}{online appendix 11}
#'   of Lewis et. al. (2004).
#' @references
#'   Lewis, David D., et al. (2004)
#'   "\href{http://www.jmlr.org/papers/volume5/lewis04a/lewis04a.pdf}{Rcv1: A
#'   new benchmark collection for text categorization research.}" \emph{Journal
#'   of machine learning research} 5: 361-397.
"data_stopwords_smart"
