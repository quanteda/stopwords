# add ancient Greek and Latin stopwords from
# https://wiki.digitalclassicist.org/Stopwords_for_Greek_and_Latin

library("quanteda")

gr <- "μή ἑαυτοῦ ἄν ἀλλ' ἀλλά ἄλλος ἀπό ἄρα αὐτός δ' δέ δή διά δαί δαίς ἔτι ἐγώ ἐκ ἐμός ἐν ἐπί εἰ εἰμί εἴμι εἰς γάρ γε γα ἡ ἤ καί κατά μέν μετά μή ὁ ὅδε ὅς ὅστις ὅτι οὕτως οὗτος οὔτε οὖν οὐδείς οἱ οὐ οὐδέ οὐκ περί πρός σύ σύν τά τε τήν τῆς τῇ τι τί τις τίς τό τοί τοιοῦτος τόν τούς τοῦ τῶν τῷ ὑμός ὑπέρ ὑπό ὡς ὦ ὥστε ἐάν παρά σός"
la <- "ab ac ad adhic adhuc aliqui aliquis an ante apud at atque aut autem cum cur de deinde dum ego enim ergo es est et etiam etsi ex fio haud hic iam idem igitur ille in infra inter interim ipse is ita magis modo mox nam ne nec necque neque nisi non nos o ob per possum post pro quae quam quare qui quia quicumque quidem quilibet quis quisnam quisquam quisque quisquis quo quoniam sed si sic sive sub sui sum super suus tam tamen trans tu tum ubi uel uero"

Encoding(gr) <- "UTF-8"
Encoding(la) <- "UTF-8"

data_stopwords_ancient <- list(
  gr = sort(as.character(tokens(grc, what = "fasterword"))),
  la = sort(as.character(tokens(la, what = "fasterword")))
)

data_stopwords_ancient <- lapply(data_stopwords_ancient, unique)

usethis::use_data(data_stopwords_ancient, overwrite = TRUE)
