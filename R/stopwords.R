#' Collection of stopwords in multiple languages
#'
#' This function returns stopwords collated for Stopwords ISO library
#' (\url{https://github.com/stopwords-iso/stopwords-iso}).
#' @param language specify language of stopwords by ISO 639-1 code
#' @param source specify a stopwords source. To list the currently
#' available options, use \code{\link{stopwords_getsources}}.
#' @return a character vector containing the stopwords
#' @details
#' The language codes for each stopword list use the two-letter ISO
#' code from \url{https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes}.
#' For backwards compatibility, the full English names of the stopwords
#' from the \pkg{quanteda} package may also be used, although these are
#' deprecated.
#' @export
#'
#' @examples
#' stopwords('en')
#' stopwords('de')
stopwords <- function(language = "en", source = "snowball") {
  stopwords_options()

  error <- createError(
    default = paste0("Language ", "\"", language, "\" not available in source \"", source, "\"."),
    note = "See `stopwords_getlanguages` for more information on supported languages."
  )

  # for quanteda compability
  if (missing(source) && tolower(language) == "smart") {
    .Deprecated(old = paste0("stopwords(language = \"", language, "\")"),
                new = "stopwords(source = \"smart\")")
    source <- "smart"
    language <- "en"
  }

  if (nchar(language) > 2) {
    language <- tryCatch(
      lookup_iso_639_1(language),
      error = function(message) error(message)
    )
  }

  # for quanteda compability
  if (missing(source) && tolower(language) %in% c("el", "ar", "zh")) {
    language <- tolower(language)
    .Deprecated(old = paste0("stopwords(language = \"", language, "\")"),
                new = paste0("stopwords(language = \"", language, "\", source = \"misc\")"))
    source <- "misc"
  }

  words <- tryCatch(
    get_stopwords_data(source)[[language]],
    error = function(message) error(message)
  )

  if (is.null(words)) {
    error()
  }

  words
}

#' list available stopwords sources
#'
#' Returns a character vector of the stopword sources available from the
#' \pkg{stopwords} package.
#' @export
stopwords_getsources <- function() {
  stopwords_options()
  names(getOption("stopwords_sources"))
}

#' list available stopwords country codes
#'
#' Lists the available stopwords country codes for a given stopwords source.
#' See \url{https://en.wikipedia.org/wiki/ISO_639-1} for details of the language code.
#' @param source the source of the stopwords
#' @export
stopwords_getlanguages <- function(source) {
  stopwords_options()

  error <- createError(
    default = paste0("Source \"", source, "\" not found."),
    note = "See `stopwords_getsources` for a list of all available sources."
  )

  tryCatch(
    names(get_stopwords_data(source)),
    error = function(message) error(message)
  )
}

#' return ISO-639-1 code for a given language name
#'
#' Looks up the two-character ISO-639-1 language code for a given
#' language name.
#' @importFrom stats na.omit
#' @keywords internal
#' @param language_name character; name of a language
lookup_iso_639_1 <- function(language_name) {
  language_data <- na.omit(ISOcodes::ISO_639_2[, c("Alpha_2", "Name")])

  # remove Norwegian variants
  language_data <- language_data[-which(language_data[["Alpha_2"]] %in% c("nn", "nb")), ]

  # match the language to the name
  language_code_index <- grep(language_name, language_data[["Name"]], ignore.case = TRUE)
  if (!length(language_code_index)) {
    stop()
  } else if (length(language_code_index) > 1) {
    message <- paste0("Multiple language codes found for \"", language_name, "\":\n",
               paste0(language_data[language_code_index, 2], collapse = "\n"))
    stop(message)
  } else {
    language_data[["Alpha_2"]][language_code_index]
  }
}

# Create consistent error messages
createError <- function(default, note, message) {
  function(message) {
    msg <- paste0(ifelse(missing(message) || message == "", default, message), "\n", note)
    stop(msg, call. = FALSE)
  }
}

# Retrieve data from sources
get_stopwords_data <- function(source) {
  stopwords_options()

  if (! source %in% names(getOption("stopwords_sources"))) {
    message <- paste0("Source \"", source, "\" not found.")
    stop(message, call. = FALSE)
  }

  data_object_name <- getOption("stopwords_sources")[source]
  # this allows the data to be accessed without attaching the package
  eval(parse(text = paste0("stopwords::", data_object_name)))
}
