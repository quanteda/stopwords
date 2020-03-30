# create stopword list from Kevin Bougé's lists at
# https://sites.google.com/site/kevinbouge/stopwords-lists

library("googledrive")


# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OjRlYTAyMjcwZTkzMWY4OGI",
#               destfile = "bouge/ar.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OjFjMTk4ZDdjZmIwN2EwOTU",
#               destfile = "bouge/bg.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OjNhMjUyNjQ1MDQ1NGU1ZDc",
#               destfile = "bouge/br.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OjRhZmEzZWQ2ZWQ5NTk5MmE",
#               destfile = "bouge/cz.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OjM5NDVmMTM2MjRlYzljZjY",
#               destfile = "bouge/da.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OjU2ODk5YjE1NDk4YjBkYTQ",
#               destfile = "bouge/de.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OjI5MzI4MDRjMzk3M2Y2OWU",
#               destfile = "bouge/el.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OjY0MTNkZjJhOWIzODQ2Mzg",
#               destfile = "bouge/en.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OjUxMDdkZDVmOGJjYThiZWY",
#               destfile = "bouge/es.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OjY0MWMxMDBjZTc2Y2ZmZjk",
#               destfile = "bouge/fa.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OjI5ZTIzYzJiNGFlNTQzZTk",
#               destfile = "bouge/fi.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OjFlYTQxN2JkNmY1MTQ1NWE",
#               destfile = "bouge/fr.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OjJjYjg2NTNiYzcyNmJiNzY",
#               destfile = "bouge/hi.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OmNlNTNkNGYxODJiOTFkYw",
#               destfile = "bouge/hu.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OmM1NzgyOTk3NDA4NGJhZQ",
#               destfile = "bouge/hy.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OjI4ZWY0ZGVkMzJjM2FkYWU",
#               destfile = "bouge/id.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OjE4ZDJiMDI5YzIxODcxMw",
#               destfile = "bouge/it.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OjdhNWQxZGQwOTE3ZjVkY2M",
#               destfile = "bouge/ja.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OjNiNGI5YTVmYjkxOWEwYmQ",
#               destfile = "bouge/lv.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OjI4NTRlYzJhMTc5ODcxZjY",
#               destfile = "bouge/nl.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OjFhY2UwOTY0YzkyODIwYjk",
#               destfile = "bouge/no.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OmJmZTBhOTAzMmU3NDQx",
#               destfile = "bouge/pl.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OjFhYmFkOGJkNmQ3YWFiYTE",
#               destfile = "bouge/pt.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OjY0YzJhNmY2Zjk5ODFkYTU",
#               destfile = "bouge/ro.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OjJmNzA3ODc1YjMxOGMwYjI",
#               destfile = "bouge/ru.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OjYwODE5MDE2ZTY2MDc3NjQ",
#               destfile = "bouge/sv.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OjIwOGUxMGE3OTkxNjAyYTg",
#               destfile = "bouge/tr.txt")
# download.file("https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxrZXZpbmJvdWdlfGd4OjRmZjlhYTNkNWZjMTc3NWI",
#               destfile = "bouge/zh.txt")

data_readtext_bouge <- readtext::readtext("bouge/*.txt")
Encoding(data_readtext_bouge$text) <- "UTF-8"

data_stopwords_bouge <- structure(
  as.list(tokens(data_readtext_bouge$text, what = "fasterword")),
  names = stringi::stri_replace_all_regex(data_readtext_bouge$doc_id, "^.*_(\\w{2})\\.txt$", "$1")
)

data_stopwords_bouge <- lapply(data_stopwords_bouge, function(y) sort(unique(y)))

#### no  it  hu  need fixing - encoding errors

usethis::use_data(data_stopwords_bouge, overwrite = TRUE)
