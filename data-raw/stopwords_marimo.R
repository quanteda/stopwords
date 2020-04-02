library("yaml")
library("magrittr")

merge_unnamed <- function(x) {
  if (is.null(names(x))) {
    return(unlist(x, use.names = FALSE) )
  } else {
    lapply(x, merge_unnamed)
  }
}

files <- c("en" = "stopwords_en.yml",
           "ja" = "stopwords_ja.yml",
           "ar" = "stopwords_ar.yml",
           "he" = "stopwords_he.yml",
           "zh_tw" = "stopwords_zh_traditional.yml",
           "zh_cn" = "stopwords_zh_simplified.yml")

data_stopwords_marimo <- list()
for (lang in names(files)) {
  lis <- read_yaml(paste0("data-raw/marimo/", files[lang]))
  data_stopwords_marimo[[lang]] <- lapply(lis, merge_unnamed)
}

# Save `data_stopwords_stopwordsiso` to data directory
usethis::use_data(data_stopwords_marimo, overwrite = TRUE)
