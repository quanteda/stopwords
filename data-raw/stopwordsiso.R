# This package is only needed if you want to update the Stopwords-ISO data
if (!require("jsonlite")) install.packages("jsonlite")
library("jsonlite")

sw_url <- "https://raw.github.com/stopwords-iso/stopwords-iso/master/stopwords-iso.json"
data_stopwords_stopwordsiso <- jsonlite::fromJSON(readLines(sw_url, encoding = "UTF-8"))

# remove duplicates
data_stopwords_stopwordsiso <- lapply(data_stopwords_stopwordsiso, unique)

# Save `data_stopwords_stopwordsiso` to data directory
usethis::use_data(data_stopwords_stopwordsiso, overwrite = TRUE)
