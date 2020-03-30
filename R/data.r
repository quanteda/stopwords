#' multilingual stopwords from https://github.com/stopwords-iso/stopwords-iso
#'
#' The Stopwords ISO Dataset is the most comprehensive collection of stopwords
#' for multiple languages. The collection follows the ISO 639-1 language code.
#' @usage NULL
#' @section Usage:
#' `stopwords(language, source = "stopwords-iso")`
#' @format A named list of length 57, of character vectors that represent
#'   stopwords in 57 languages.  To see the languages available, use
#'   [stopwords_getlanguages()].
#' @source <https://github.com/stopwords-iso/stopwords-iso/>
"data_stopwords_stopwordsiso"

#' snowball stopword list
#'
#' @usage NULL
#' @section Usage:
#' `stopwords(language, source = "snowball")`
#' @details Provides stopword lists in multiple
#'   languages, based on the Snowball stemmer's word lists.
#' @source
#'   The main stopword lists are taken from the Snowball stemmer project in
#'   different languages (see <http://snowballstem.org/projects.html>).
#'
#'   The stopword lists can be found in <http://snowball.tartarus.org/dist/snowball_all.tgz>.
#' @seealso [stopwords()]
"data_stopwords_snowball"

#' miscellaneous stopword lists
#'
#' Other, miscellaneous stopword lists.
#' @usage NULL
#' @section Usage:
#' `stopwords(language, source = "misc")`
#' @source
#'   The Arabic stopwords come from
#'   <https://sites.google.com/site/kevinbouge/stopwords-lists>.
#'
#'   The Catalan stopwords come from
#'   <http://latel.upf.edu/morgana/altres/pub/ca_stop.htm>.
#'
#'   The Greek stopwords were supplied by Carsten Schwemmer (see
#'   <https://github.com/quanteda/quanteda/issues/282>).
#'
#'   The Gujarati stopwords are taken from
#'   <https://github.com/gujarati-ir/Gujarati-Stop-Words> and modified by
#'   Chandrakant Bhogayata.
#'
#'   The Chinese stopwords are taken from the
#'   [Baidu stopword list](http://www.baiduguide.com/baidu-stopwords/).
"data_stopwords_misc"

#' stopword lists from the SMART system
#'
#' The stopword lists based on the SMART (System for the Mechanical Analysis and
#' Retrieval of Text) Information Retrieval System, an information retrieval
#' system developed at Cornell University in the 1960s.
#' @usage NULL
#' @section Usage:
#' `stopwords(language = "en", source = "smart")`
#' @source
#'   The English stopword list is taken from the [online appendix
#'   11](http://www.ai.mit.edu/projects/jmlr/papers/volume5/lewis04a/a11-smart-stop-list/english.stop)
#'   of Lewis et. al. (2004).
#' @references
#'   Lewis, David D., et al. (2004) "[Rcv1: A new benchmark collection for text
#'   categorization
#'   research.](http://www.jmlr.org/papers/volume5/lewis04a/lewis04a.pdf)"
#'   *Journal of machine learning research* 5: 361-397.
"data_stopwords_smart"

#' stopword lists including parts-of-speech
#'
#' Stopword lists that include specific parts of speech, maintained by Kohei
#' Watanabe.
#'
#' These are multi-level lists, in the original data.  If you wish to use them
#' as lists, please access the data object directly.
#' @usage NULL
#' @section Usage: `stopwords(language = "en", source = "marimo")`
#' @source The English version was adopted from the Snowball collection, and then
#'   extended and translated into other languages by contributors. Names of
#'   contributors are in the header of the [original YAML
#'   files](https://github.com/koheiw/marimo/tree/master/yaml).
#' @examples
#' # access English pronouns directly
#' stopwords::data_stopwords_marimo$en$pronoun
#'
"data_stopwords_marimo"

#' stopword lists for ancient languages
#'
#' Stopword lists for ancient Greek and Latin.  While technically there is no
#' 2-letter code for ancient Greek in ISO-639, we use "gr" to denote Greek.
#' @usage NULL
#' @section Usage: `stopwords(language = "grc", source = "ancient")`
#' @source The [Digital Classicist Wiki](https://wiki.digitalclassicist.org/Main_Page).
#' See [https://wiki.digitalclassicist.org/Stopwords_for_Greek_and_Latin]().
"data_stopwords_ancient"

#' stopword lists from the Python NLTK library
#'
#' Stopword lists for 23 languages from the Python NLTK library.
#'
#' @usage NULL
#' @section Usage: `stopwords(language = "en", source = "nltk")`
#' @source
#' https://github.com/nltk/nltk_data/blob/gh-pages/packages/corpora/stopwords.zip
#' @references
#' Bird, Steven, Edward Loper and Ewan Klein (2009). Natural Language Processing
#' with Python.  O'Reilly Media Inc.
"data_stopwords_nltk"

#' stopword lists from Kevin Bougé
#'
#' Stopword lists for 28 languages from Kevin Bougé.
#'
#' @usage NULL
#' @section Usage: `stopwords(language = "en", source = "bouge")`
#' @source
#' https://sites.google.com/site/kevinbouge/stopwords-lists
"data_stopwords_bouge"
