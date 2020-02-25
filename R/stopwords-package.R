#' stopwords: one-stop shopping for stopwords in R
#'
#' Provides a `stopwords()` function to return character vectors of
#' stopwords for different languages, using the ISO-639-1 language codes,
#' and allows for different sources of stopwords to be defined.
#'
#' @section Currently available sources:
#' \describe{
#' \item{[`snowball()`][data_stopwords_snowball]}{The Snowball stopword lists
#' sources for multiple languages. Most of these have been ported from the
#' \pkg{quanteda} stopword lists (in versions <1.0 of that package).}
#'
#'  \item{[`stopwords-iso()`][data_stopwords_stopwordsiso]}{The collection taken
#'  from <https://github.com/stopwords-iso/stopwords-iso/>.}
#'
#'  \item{[`smart()`][data_stopwords_smart]}{The English-language stopword list
#'  from the SMART information retrieval system.}
#'
#'  \item{[`misc()`][data_stopwords_misc]}{A few additional stopword lists,
#'  including the non-Snowball word lists from \pkg{quanteda} versions < 1.0.}
#'  }
#' @author Kenneth Benoit, David Muhr, and Kohei Watanabe
#' @docType package
#' @name stopwords-package
NULL
