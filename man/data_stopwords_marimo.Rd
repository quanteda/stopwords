% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.r
\docType{data}
\name{data_stopwords_marimo}
\alias{data_stopwords_marimo}
\title{stopword lists including parts-of-speech}
\format{
An object of class \code{list} of length 9.
}
\source{
The English version was adopted from the Snowball collection, and then
extended and translated into other languages by contributors. Names of
contributors are in the header of the \href{https://github.com/koheiw/marimo/tree/master/yaml}{original YAML files}.
}
\description{
Stopword lists that include specific parts of speech, maintained by Kohei
Watanabe.
}
\details{
These are multi-level lists, in the original data.  If you wish to use them
as lists, please access the data object directly.
}
\section{Usage}{
 \code{stopwords(language = "en", source = "marimo")}
}

\examples{
# access English pronouns directly
stopwords::data_stopwords_marimo$en$pronoun

}
\keyword{datasets}
