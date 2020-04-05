# stopwords v2.0

## New functions

* Adds `use_stopwords()`, for adding a re-export of this function to any package.
* Adds `stopwords_edit()` for easy, interactive editing of stopword lists, plus
  `char_edit()` and `char_remove()` for easy interactive editing and batch 
  removal of words from existing character vector word lists, respectively.
* Added re-export of **magrittr**'s `%>%` operator.

## New word list sources

* The "marimo" source, for 5 languages, created by Kohei Watanabe.
* Ancient language stopword lists (Greek and Latin).
* The NLTK source, containing stopwords from the Python NLTK library, in 23
  languages.
  
  
# stopwords v1.0

* Added Gujarati to misc stopwords.
* Fixed several mis-encoded characters for Turkish in stopwords-iso. (#15)
* Fixed some exceptions related to newer R releases.

# stopwords v0.9

* Added Snowball, misc, and SMART stopwords.
* Replaced exposed data object with the function `stopwords()`.
* Made completely compatible with `quanteda::stopwords()` to provide a replacement for that function.
* Significantly improved documentation.

# stopwords v0.1.0

* Initial release
* Submission feedback (removed redundant "in R" in title and changed license to CRAN template)
* Submission feedback (added examples)
