#' stopwords: one-stop shopping for stopwords in R
#'
#' Provides a \code{stopwords()} function to return character vectors of
#' stopwords for different languages, using the ISO-639-1 language codes,
#' and allows for different sources of stopwords to be defined.
#'
#' @section Currently available sources:
#' \describe{
#' \item{\code{\link[=data_stopwords_snowball]{snowball}}}{The Snowball stopword lists sources for multiple languages.
#' Most of these have been ported from the \pkg{quanteda}
#' stopword lists (in versions <1.0 of that package).}
#'
#'  \item{\code{\link[=data_stopwords_stopwordsiso]{stopwords-iso}}}{The collection taken from
#'  \url{https://github.com/stopwords-iso/stopwords-iso/}.}
#'
#'  \item{\code{\link[=data_stopwords_smart]{smart}}}{The English-language stopword list from the SMART information
#'  retrieval system.}
#'
#'  \item{\code{\link[=data_stopwords_misc]{misc}}}{A few additional stopword lists, including the non-Snowball
#'  word lists from \pkg{quanteda} versions < 1.0.}
#'  }
#' @author Kenneth Benoit, David Muhr, and Kohei Watanabe
#' @docType package
#' @name stopwords-package
NULL
