library("quanteda")
library("dplyr")

filen <- "nltk/nltk_stopwords.zip"
download.file("https://raw.githubusercontent.com/nltk/nltk_data/gh-pages/packages/corpora/stopwords.zip",
              destfile = filen)
unzip(filen, exdir = "nltk")
data_readtext_nltk <- readtext::readtext("nltk/stopwords/*") %>%
  filter(doc_id != "README")

Encoding(data_readtext_nltk$text) <- "UTF-8"

data_corpus_nltk <- corpus(data_readtext_nltk)
data_stopwords_nltk <- as.list(tokens(data_corpus_nltk, what = "fasterword"))

data(ISO_639_2, package = "ISOcodes")
ISO_639_2$Name <- tolower(ISO_639_2$Name)

# remove duplicates
data_stopwords_nltk <- lapply(data_stopwords_nltk, unique)

# apply ISO-639 names
isonames <- left_join(data.frame(Name = names(data_stopwords_nltk)),
                      ISO_639_2[, c("Name", "Alpha_2")], by = "Name")
isonames[which(isonames$Name == "dutch"), "Alpha_2"] <- "nl"
isonames[which(isonames$Name == "greek"), "Alpha_2"] <- "el"
isonames[which(isonames$Name == "romanian"), "Alpha_2"] <- "ro"
isonames[which(isonames$Name == "slovene"), "Alpha_2"] <- "sl"
isonames[which(isonames$Name == "spanish"), "Alpha_2"] <- "es"
names(data_stopwords_nltk) <- isonames$Alpha_2

usethis::use_data(data_stopwords_nltk, overwrite = TRUE)
