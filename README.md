# stopwords

Overview
--------

Exposes the full [Stopwords ISO](https://github.com/stopwords-iso/stopwords-iso) collection as an easy to use R data structure.

Installation
------------

``` r
# Install the stopword collections
install.packages("stopwords")

# Or get the development version from GitHub:
# install.packages("devtools")
devtools::install_github("davnn/stopwords")
```

Usage
------------

The package simply exposes a list of stopword character vectors called `stopwords` and that's the only name exported. The list elements can be referenced by their ISO 639-1 language code.

``` r
library(stopwords)

stopwords$de
# [1] "a"     "ab"    "aber"  "ach"   "acht"  "achte" ...

stopwords$en
# [1] "'ll"   "'tis"  "'twas" "'ve"   "10"    "39" ...
```

The following languages are currently available:

- af, Afrikaans
- ar, Arabic
- hy, Armenian
- eu, Basque
- bn, Bengali
- br, Breton
- bg, Bulgarian
- ca, Catalan
- zh, Chinese
- hr, Croatian
- cs, Czech
- da, Danish
- nl, Dutch
- en, English
- eo, Esperanto
- et, Estonian
- fi, Finnish
- fr, French
- gl, Galician
- de, German
- el, Greek
- ha, Hausa
- he, Hebrew
- hi, Hindi
- hu, Hungarian
- id, Indonesian
- ga, Irish
- it, Italian
- ja, Japanese
- ko, Korean
- ku, Kurdish
- la, Latin
- lt, Lithuanian
- lv, Latvian
- ms, Malay
- mr, Marathi
- no, Norwegian
- fa, Persian
- pl, Polish
- pt, Portuguese
- ro, Romanian
- ru, Russian
- sk, Slovak
- sl, Slovenian
- so, Somali
- st, Southern Sotho
- es, Spanish
- sw, Swahili
- sv, Swedish
- th, Thai
- tl, Tagalog
- tr, Turkish
- uk, Ukrainian
- ur, Urdu
- vi, Vietnamese
- yo, Yoruba
- zu, Zulu

Contributing
------------

If there are stopwords missing, check if you have the latest version installed and if this version also represents the latest version of [Stopwords ISO](https://github.com/stopwords-iso/stopwords-iso).

If there is a newer version of [Stopwords ISO](https://github.com/stopwords-iso/stopwords-iso) available, please submit a pull request or file an issue to request the update.

If you would like to contribute stopwords, please do so in the official [Stopwords ISO repositories](https://github.com/stopwords-iso).

License
------------

This package as well as the source repositories are licensed under MIT.
