#' multilingual stopwords from https://github.com/stopwords-iso/stopwords-iso
#'
#' The Stopwords ISO Dataset is the most comprehensive collection of stopwords
#' for multiple languages. The collection follows the ISO 639-1 language code.
#'
#' @format A list of character vectors that represent stopwords:
#' \describe{
#'   \item{af}{Afrikaans}
#'   \item{ar}{Arabic}
#'   \item{hy}{Armenian}
#'   \item{eu}{Basque}
#'   \item{bn}{Bengali}
#'   \item{br}{Breton}
#'   \item{bg}{Bulgarian}
#'   \item{ca}{Catalan}
#'   \item{zh}{Chinese}
#'   \item{hr}{Croatian}
#'   \item{cs}{Czech}
#'   \item{da}{Danish}
#'   \item{nl}{Dutch}
#'   \item{en}{English}
#'   \item{eo}{Esperanto}
#'   \item{et}{Estonian}
#'   \item{fi}{Finnish}
#'   \item{fr}{French}
#'   \item{gl}{Galician}
#'   \item{de}{German}
#'   \item{el}{Greek}
#'   \item{ha}{Hausa}
#'   \item{he}{Hebrew}
#'   \item{hi}{Hindi}
#'   \item{hu}{Hungarian}
#'   \item{id}{Indonesian}
#'   \item{ga}{Irish}
#'   \item{it}{Italian}
#'   \item{ja}{Japanese}
#'   \item{ko}{Korean}
#'   \item{ku}{Kurdish}
#'   \item{la}{Latin}
#'   \item{lt}{Lithuanian}
#'   \item{lv}{Latvian}
#'   \item{ms}{Malay}
#'   \item{mr}{Marathi}
#'   \item{no}{Norwegian}
#'   \item{fa}{Persian}
#'   \item{pl}{Polish}
#'   \item{pt}{Portuguese}
#'   \item{ro}{Romanian}
#'   \item{ru}{Russian}
#'   \item{sk}{Slovak}
#'   \item{sl}{Slovenian}
#'   \item{so}{Somali}
#'   \item{st}{Southern Sotho}
#'   \item{es}{Spanish}
#'   \item{sw}{Swahili}
#'   \item{sv}{Swedish}
#'   \item{th}{Thai}
#'   \item{tl}{Tagalog}
#'   \item{tr}{Turkish}
#'   \item{uk}{Ukrainian}
#'   \item{ur}{Urdu}
#'   \item{vi}{Vietnamese}
#'   \item{yo}{Yoruba}
#'   \item{zu}{Zulu}
#' }
#' @source \url{https://github.com/stopwords-iso/stopwords-iso/}
"data_stopwords_stopwordsiso"

#' Internal function to update the data file
#' @keywords internal
#' @examples
#' \dontrun{
#' stopwords:::update_stopwords()
#' }
update_stopwords <- function() {

  url <- 'https://raw.githubusercontent.com/stopwords-iso/stopwords-iso/master/stopwords-iso.json'
  json <- paste0(readLines(url, warn = FALSE), collapse="")
  data_char_stopwords_iso <- rjson::fromJSON(json)
  cat('Downloaded stopwords for', length(data), 'languages.\n')
  path <- 'data/data_char_stopwords_iso.RData'
  save(data_char_stopwords_iso, file = path)
  cat('Saved to', path, '.\n')
}


#' snowball stopword list
#'
#' Ported from versions < 1.0 of the\pkg{quanteda} package.
#' @details \code{data_char_stopwords} provides stopword lists in multiple
#'   languages; it is a named list of characters with the lowercase language
#'   name (in English) as the name of each list element.
#'   Supported languages are Arabic, Danish, Dutch, English, Finnish, French,
#'   German, Greek, Hungarian, Italian, Norwegian, Portuguese, Russian, Spanish,
#'   and Swedish.  For compatibility with the names used in the \pkg{quanteda}
#'   package from which this source was first adapted, we have retained the
#'   "SMART", "Greek", and "Chinese" stopword lists.
#' @source
#'   The main stopword lists are taken from the Snowball stemmer project in
#'   different languages (see \url{http://snowballstem.org/projects.html}).
#'
#'   The Greek stopwords were supplied by Carsten Schwemmer (see
#'   \href{https://github.com/kbenoit/quanteda/issues/282}{GitHub issue #282}).
#'
#'   The Chinese stopwords are taken from the
#'   \href{http://www.baiduguide.com/baidu-stopwords/}{Baidu stopword list}.
#'
#'   The English "SMART" stopwords are taken from the SMART information retrieval
#'   system (obtained from Lewis, David D., et al.
#'   "\href{http://www.jmlr.org/papers/volume5/lewis04a/lewis04a.pdf}{Rcv1: A
#'   new benchmark collection for text categorization research.}" \emph{Journal
#'   of machine learning research} (2004, 5 April): 361-397.
#' @seealso \code{\link{stopwords}}
"data_stopwords_snowball"
