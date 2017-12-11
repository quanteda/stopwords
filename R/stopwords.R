#' Collection of stopwords in multiple langauges
#'
#' This function returns stopwrods colated for Stopwords ISO library
#' (\url{https://github.com/stopwords-iso/stopwords-iso}).
#' @param language specify language of stopwords by ISO 639-1 code
#' @param source specify a stopwords source. To list the currently
#' available options, use \code{\link{stopwords_getsources}}.
#' @return a character vector containing the stopwords
#' @details
#' The language codes for each stopword list use the two-letter ISO
#' code from \url{https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes}.
#' For backwards compatibility, the full english names of the stopwords
#' from the \pkg{quanteda} package may also be used, although these are
#' deprecated.
#' @export
#'
#' @examples
#' stopwords('en')
#' stopwords('jp')
stopwords <- function(language = "en", source = "snowball") {
  if (nchar(language) > 2) {
    language <- lookup_iso_639_1(language)
  }
  get_stopwords_data(source)[[language]]
}

#' list available stopwords sources
#'
#' Returns a character vector of the stopword sources available from the
#' \pkg{stopwords} package.
#' @export
stopwords_getsources <- function() {
  names(getOption("stopwords_sources"))
}


#' list available stopwords country codes
#'
#' Lists the available stopwords country codes for a given stopwords source.
#' See \url{https://en.wikipedia.org/wiki/ISO_639-1} for details of the language code.
#' @param source the source of the stopwords
#' @export
stopwords_getlanguages <- function(source) {
  names(get_stopwords_data(source))
}

#' return ISO-639-1 code for a given language name
#'
#' Looks up the two-character ISO-639-1 language code for a given
#' language name.
#' @importFrom stats na.omit
#' @importFrom utils data
#' @keywords internal
#' @param language_name character; name of a language
lookup_iso_639_1 <- function(language_name) {
  if (nchar(language_name) <= 2) {
    stop("language_name must be the full, English name of the language")
  }
  language_data <- na.omit(ISOcodes::ISO_639_2[, c("Alpha_2", "Name")])

  # remove Norwegian variants
  language_data <- language_data[-which(language_data[["Alpha_2"]] %in% c("nn", "nb")), ]

  # add the "SMART" list for compatibility
  language_data <- rbind(language_data,
                         data.frame(Alpha_2 = "SMART", Name = "smart", stringsAsFactors = FALSE))

  # match the language to the name
  language_code_index <- grep(language_name, language_data[["Name"]], ignore.case = TRUE)
  if (!length(language_code_index)) {
    stop("language ", language_name, " not found")
  } else if (length(language_code_index) > 1) {
    stop("multiple language codes found for ", language_name, ":\n",
         language_data[language_code_index, ])
  } else {
    language_data[["Alpha_2"]][language_code_index]
  }
}

get_stopwords_data <- function(source) {
  check_sources(source)
  get(getOption("stopwords_sources")[source])
}

check_sources <- function(source) {
  if (! source %in% names(getOption("stopwords_sources"))) {
    stop("source ", source, " not available", call. = FALSE)
  }
}

