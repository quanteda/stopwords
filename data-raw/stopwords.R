install.packages("jsonlite")
library(jsonlite)

stopwords <- read_json("data-raw/stopwords-iso/stopwords-iso.json", simplifyVector = TRUE)
devtools::use_data(stopwords, overwrite = TRUE)
