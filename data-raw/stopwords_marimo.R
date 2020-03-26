library("yaml")
library("magrittr")

files <- list.files(path = "marimo", full.names = TRUE)
langs <- stringi::stri_extract_last_regex(files, "\\w{2}\\.yml$") %>%
  stringi::stri_sub(to = -5)

data_stopwords_marimo <- list()
for (i in seq_along(files)) {
  data_stopwords_marimo[[langs[i]]] <- read_yaml(files[i])
}

# Save `data_stopwords_stopwordsiso` to data directory
usethis::use_data(data_stopwords_marimo, overwrite = TRUE)
