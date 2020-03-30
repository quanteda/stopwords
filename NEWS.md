stopwords v1.1
==============
* Adds `use_stopwords()`, for adding a re-export of this function to any package.
* Adds the "marimo" source, for 5 languages, created by Kohei Watanabe.
* Adds ancient language stopword lists (Greek and Latin).
* Adds the NLTK source, containing stopwords from the Python NLTK library, in 23
  languages.

stopwords v1.0
==============
* Added Gujarati to misc stopwords.
* Fixed several mis-encoded characters for Turkish in stopwords-iso. (#15)
* Fixed some exceptions related to newer R releases.

stopwords v0.9
==============

Changes:
* Added Snowball, misc, and SMART stopwords.
* Replaced exposed data object with the function `stopwords()`.
* Made completely compatible with `quanteda::stopwords()` to provide a replacement for that function.
* Significantly improved documentation.

stopwords v0.1.0
==============

Changes:

* Initial release
* Submission feedback (removed redundant "in R" in title and changed license to CRAN template)
* Submission feedback (added examples)
