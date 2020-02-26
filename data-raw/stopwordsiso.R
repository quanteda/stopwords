# This package is only needed if you want to update the Stopwords-ISO data
if (!require("jsonlite")) install.packages("jsonlite")
library(jsonlite)

# Convert JSON to R data structure
data_stopwords_stopwordsiso <- read_json("data-raw/stopwords-iso/stopwords-iso.json", simplifyVector = TRUE)

# remove duplicates
data_stopwords_stopwordsiso <- lapply(data_stopwords_stopwordsiso, unique)

# Save `data_stopwords_stopwordsiso` to data directory
devtools::use_data(data_stopwords_stopwordsiso, overwrite = TRUE)
