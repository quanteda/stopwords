# add ancient Greek and Latin stopwords from
# https://wiki.digitalclassicist.org/Stopwords_for_Greek_and_Latin

library("quanteda")

data_stopwords_ancient <- list(
  grc = readLines("other/stopwords_greek_v2_8_quanteda.txt"),
  la = readLines("other/stopwords_latin_v2_6_quanteda.txt")
)

data_stopwords_ancient <- lapply(data_stopwords_ancient,
                                 function(x) {
                                   Encoding(x) <- "UTF-8"
                                   x <- sort(unique(x))
                                   x
                                 })

usethis::use_data(data_stopwords_ancient, overwrite = TRUE)
