# read Gujarati stopwords
stopwords_gujarati <- readLines("data-raw/other/gujarati-stopwords.txt",
                                encoding = "UTF-8")

# add Gujarati to misc source
data_stopwords_misc$gu <- stopwords_gujarati
data_stopwords_misc <- data_stopwords_misc[order(names(data_stopwords_misc))]
usethis::use_data(data_stopwords_misc, overwrite = TRUE)
