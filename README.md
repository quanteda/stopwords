
# stopwords: the R package

[![CRAN
Version](https://www.r-pkg.org/badges/version/stopwords)](https://CRAN.R-project.org/package=stopwords)
[![](https://img.shields.io/badge/devel%20version-2.1.9000-royalblue.svg)](https://github.com/quanteda/stopwords)
[![Travis-CI Build
Status](https://travis-ci.org/quanteda/stopwords.svg?branch=master)](https://travis-ci.org/quanteda/stopwords)
[![Coverage
status](https://codecov.io/gh/davnn/stopwords/branch/master/graph/badge.svg)](https://codecov.io/github/davnn/stopwords?branch=master)
[![Downloads](https://cranlogs.r-pkg.org/badges/stopwords)](https://CRAN.R-project.org/package=stopwords)
[![Total
Downloads](https://cranlogs.r-pkg.org/badges/grand-total/stopwords?color=orange)](https://CRAN.R-project.org/package=stopwords)

R package providing “one-stop shopping” (or should that be “one-shop
stopping”?) for stopword lists in R, for multiple languages and sources.
No longer should text analysis or NLP packages bake in their own
stopword lists or functions, since this package can accommodate them
all, and is easily extended.

Created by [David Muhr](https://github.com/davnn), and extended in
cooperation with [Kenneth Benoit](https://github.com/kbenoit) and [Kohei
Watanabe](https://github.com/koheiw).

## Installation

``` r
# from CRAN
install.packages("stopwords")

# Or get the development version from GitHub:
# install.packages("devtools")
devtools::install_github("quanteda/stopwords")
```

## Usage

``` r
head(stopwords::stopwords("de", source = "snowball"), 20)
##  [1] "aber"    "alle"    "allem"   "allen"   "aller"   "alles"   "als"    
##  [8] "also"    "am"      "an"      "ander"   "andere"  "anderem" "anderen"
## [15] "anderer" "anderes" "anderm"  "andern"  "anderr"  "anders"

head(stopwords::stopwords("ja", source = "marimo"), 20)
##  [1] "私"       "僕"       "自分"     "自身"     "我々"     "私達"    
##  [7] "あなた"   "彼"       "彼女"     "彼ら"     "彼女ら"   "あれ"    
## [13] "それ"     "これ"     "あれら"   "あれらの" "それら"   "それらの"
## [19] "これら"   "これらの"
```

For compatibility with the former `quanteda::stopwords()`:

``` r
head(stopwords::stopwords("german"), 20)
##  [1] "aber"    "alle"    "allem"   "allen"   "aller"   "alles"   "als"    
##  [8] "also"    "am"      "an"      "ander"   "andere"  "anderem" "anderen"
## [15] "anderer" "anderes" "anderm"  "andern"  "anderr"  "anders"
```

Explore sources and languages:

``` r
# list all sources
stopwords::stopwords_getsources()
## [1] "snowball"      "stopwords-iso" "misc"          "smart"        
## [5] "marimo"        "ancient"       "nltk"          "perseus"

# list languages for a specific source
stopwords::stopwords_getlanguages("snowball")
##  [1] "da" "de" "en" "es" "fi" "fr" "hu" "ir" "it" "nl" "no" "pt" "ro" "ru" "sv"
```

## Languages available

The following coverage of languages is currently available, by source.
Note that the inclusiveness of the stopword lists will vary by source,
and the number of languages covered by a stopword list does not
necessarily mean that the source is better than one with more limited
coverage. (There may be many reasons to prefer the default “snowball”
source over the “stopwords-iso” source, for instance.)

The following languages are currently available:

| Language        | Code | snowball | marimo | nltk | stopwords-iso | Other            |
|:----------------|:-----|:--------:|:------:|:----:|:-------------:|:-----------------|
| Afrikaans       | af   |          |        |      |       ✓       |                  |
| Arabic          | ar   |          |   ✓    |  ✓   |       ✓       | misc             |
| Armenian        | hy   |          |        |      |       ✓       |                  |
| Azerbaijani     | az   |          |        |  ✓   |               |                  |
| Basque          | eu   |          |        |      |       ✓       |                  |
| Bengali         | bn   |          |        |      |       ✓       |                  |
| Breton          | br   |          |        |      |       ✓       |                  |
| Bulgarian       | bg   |          |        |      |       ✓       |                  |
| Catalan         | ca   |          |        |      |       ✓       | misc             |
| Chinese         | zh   |          |   ✓    |      |       ✓       | misc             |
| Croatian        | hr   |          |        |      |       ✓       |                  |
| Czech           | cs   |          |        |      |       ✓       |                  |
| Danish          | da   |    ✓     |        |  ✓   |       ✓       |                  |
| Dutch           | nl   |    ✓     |        |  ✓   |       ✓       |                  |
| English         | en   |    ✓     |   ✓    |  ✓   |       ✓       | smart            |
| Esperanto       | eo   |          |        |      |       ✓       |                  |
| Estonian        | et   |          |        |      |       ✓       |                  |
| Finnish         | fi   |    ✓     |        |  ✓   |       ✓       |                  |
| French          | fr   |    ✓     |        |  ✓   |       ✓       |                  |
| Galician        | gl   |          |        |      |       ✓       |                  |
| German          | de   |    ✓     |   ✓    |  ✓   |       ✓       |                  |
| Greek           | el   |          |        |      |       ✓       | misc             |
| Greek (ancient) | grc  |          |        |      |               | ancient, perseus |
| Gujarati        | gu   |          |        |      |               | misc             |
| Hausa           | ha   |          |        |      |       ✓       |                  |
| Hebrew          | he   |          |   ✓    |      |       ✓       |                  |
| Hindi           | hi   |          |        |      |       ✓       |                  |
| Hungarian       | hu   |    ✓     |        |  ✓   |       ✓       |                  |
| Indonesian      | id   |          |        |  ✓   |       ✓       |                  |
| Irish           | ga   |          |        |      |       ✓       |                  |
| Italian         | it   |    ✓     |        |  ✓   |       ✓       |                  |
| Japanese        | ja   |          |   ✓    |      |       ✓       |                  |
| Kazakh          | kk   |          |        |  ✓   |               |                  |
| Korean          | ko   |          |   ✓    |      |       ✓       |                  |
| Kurdish         | ku   |          |        |      |       ✓       |                  |
| Latin           | la   |          |        |      |       ✓       | ancient, perseus |
| Lithuanian      | lt   |          |        |      |       ✓       |                  |
| Latvian         | lv   |          |        |      |       ✓       |                  |
| Malay           | ms   |          |        |      |       ✓       |                  |
| Marathi         | mr   |          |        |      |       ✓       |                  |
| Nepali          | mr   |          |        |  ✓   |               |                  |
| Norwegian       | no   |    ✓     |        |  ✓   |       ✓       |                  |
| Persian         | fa   |          |        |      |       ✓       |                  |
| Polish          | pl   |          |        |      |       ✓       |                  |
| Portuguese      | pt   |    ✓     |        |  ✓   |       ✓       |                  |
| Romanian        | ro   |    ✓     |        |  ✓   |       ✓       |                  |
| Russian         | ru   |    ✓     |        |  ✓   |       ✓       |                  |
| Slovak          | sk   |          |        |      |       ✓       |                  |
| Slovenian       | sl   |          |        |  ✓   |       ✓       |                  |
| Somali          | so   |          |        |      |       ✓       |                  |
| Southern Sotho  | st   |          |        |      |       ✓       |                  |
| Spanish         | es   |    ✓     |        |  ✓   |       ✓       |                  |
| Swahili         | sw   |          |        |      |       ✓       |                  |
| Swedish         | sv   |    ✓     |        |  ✓   |       ✓       |                  |
| Thai            | th   |          |        |      |       ✓       |                  |
| Tagalog         | tl   |          |        |      |       ✓       |                  |
| Tajik           | tg   |          |        |  ✓   |               |                  |
| Turkish         | tr   |          |        |  ✓   |       ✓       |                  |
| Ukrainian       | uk   |          |        |      |       ✓       |                  |
| Urdu            | ur   |          |        |      |       ✓       |                  |
| Vietnamese      | vi   |          |        |      |       ✓       |                  |
| Yoruba          | yo   |          |        |      |       ✓       |                  |
| Zulu            | zu   |          |        |      |       ✓       |                  |

## Basic usage

``` r
head(stopwords::stopwords("de", source = "snowball"), 20)
##  [1] "aber"    "alle"    "allem"   "allen"   "aller"   "alles"   "als"    
##  [8] "also"    "am"      "an"      "ander"   "andere"  "anderem" "anderen"
## [15] "anderer" "anderes" "anderm"  "andern"  "anderr"  "anders"

head(stopwords::stopwords("de", source = "stopwords-iso"), 20)
##  [1] "a"           "ab"          "aber"        "ach"         "acht"       
##  [6] "achte"       "achten"      "achter"      "achtes"      "ag"         
## [11] "alle"        "allein"      "allem"       "allen"       "aller"      
## [16] "allerdings"  "alles"       "allgemeinen" "als"         "also"
```

For compatibility with the former `quanteda::stopwords()`:

``` r
head(stopwords::stopwords("german"), 20)
##  [1] "aber"    "alle"    "allem"   "allen"   "aller"   "alles"   "als"    
##  [8] "also"    "am"      "an"      "ander"   "andere"  "anderem" "anderen"
## [15] "anderer" "anderes" "anderm"  "andern"  "anderr"  "anders"
```

Explore sources and languages:

``` r
# list all sources
stopwords::stopwords_getsources()
## [1] "snowball"      "stopwords-iso" "misc"          "smart"        
## [5] "marimo"        "ancient"       "nltk"          "perseus"

# list languages for a specific source
stopwords::stopwords_getlanguages("snowball")
##  [1] "da" "de" "en" "es" "fi" "fr" "hu" "ir" "it" "nl" "no" "pt" "ro" "ru" "sv"
```

## Modifying stopword lists

It is now possible to edit your own stopword lists, using the
interactive editor, with functions from the **quanteda** package (&gt;=
v2.02). For instance to edit the English stopword list for the Snowball
source:

``` r
# edit the English stopwords
my_stopwords <- quanteda::char_edit(stopwords("en", source = "snowball"))
```

To edit stopwords whose underlying structure is a list, such as the
“marimo” source, we can use the `list_edit()` function:

``` r
# edit the English stopwords
my_stopwordlist <- quanteda::list_edit(stopwords("en", source = "marimo", simplify = FALSE))
```

Finally, it’s possible to remove stopwords using pattern matching. The
default is the easy-to-use [“glob” style
matching](https://en.wikipedia.org/wiki/Glob_(programming)), which is
equivalent to fixed matching when no wildcard characters are used. So to
remove personal pronouns from the English Snowball word list, for
instance, this would work:

``` r
library("quanteda", warn.conflicts = FALSE)
## Package version: 2.9.9000
## Unicode version: 10.0
## ICU version: 61.1
## Parallel computing: 12 of 12 threads used.
## See https://quanteda.io for tutorials and examples.
posspronouns <- stopwords::data_stopwords_marimo$en$pronoun$possessive
posspronouns
## [1] "my"    "our"   "your"  "his"   "her"   "its"   "their"

stopwords("en", source = "snowball") %>%
  head(n = 10)
##  [1] "i"         "me"        "my"        "myself"    "we"        "our"      
##  [7] "ours"      "ourselves" "you"       "your"
```

See the difference when we remove them – “my”, “ours”, and “your” are
gone:

``` r
stopwords("en", source = "snowball") %>%
  head(n = 10) %>%
  char_remove(pattern = posspronouns)
## [1] "i"         "me"        "myself"    "we"        "ours"      "ourselves"
## [7] "you"
```

There is no `char_add()`, since it’s just as easy to use `c()` for this,
but there is a `char_keep()` for positive selection rather than removal.

## Adding stopwords to your own package

In v2.2, we’ve removed the function `use_stopwords()` because the
dependency on **usethis** added too many downstream package
dependencies, and **stopwords** is meant to be a lightweight package.

However it is very easy to add a re-export for `stopwords()` to your
package by adding this file as `stopwords.R`:

``` r
#' Stopwords
#'
#' @description
#' Return a character vector of stopwords.
#' See \code{stopwords::\link[stopwords:stopwords]{stopwords()}} for details.
#' @usage stopwords(language = "en", source = "snowball")
#' @name stopwords
#' @importFrom stopwords stopwords
#' @export
NULL
```

and add `stopwords` to the list of `Imports:` in your `DESCRIPTION`
file.

## Contributing

Additional sources can be defined and contributed by adding new data
objects, as follows:

1.  **Data object**. Create a named list of characters, in UTF-8 format,
    consisting of the stopwords for each language. The
    [ISO-639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes)
    language code will form the name of the list element, and the values
    of each element will be the character vector of stopwords for
    literal matches. The data object should follow the package naming
    convention, and be called `data_stopwords_newsource`, where
    `newsource` is replaced by the name of the new source.

2.  **Documentation**. The new source should be clearly documented,
    especially the source from which was taken.

## License

This package as well as the source repositories are licensed under MIT.
