#' Conveniently edit stopword lists
#'
#' Provides convenient removal of stopwords or interactive editing of stopword
#' lists.
#' @inheritParams stopwords
#' @return `stopwords_edit()` returns an edited character vector if `simplify =
#'   TRUE` or an edited list if `simplify = FALSE` and the original stopword
#'   list had nested levels.
#' @note List editing (enabled when `simplify = FALSE` and the original stopword
#'   list had nested levels) must follow [YAML formatting
#'   rules](https://en.wikipedia.org/wiki/YAML).
#' @export
#' @examples
#' \dontrun{
#' # edit some supplied stopwords
#' my_stopwords <- stopwords_edit("en", source = "snowball")
#'
#' # additional editing of an already edited word list
#' my_stopwords2 <- char_edit(my_stopwords)
#' }
#'
#' # edit stopwords as a list in YAML
#' my_list <- stopwords_edit("en", source = "marimo", simplify = FALSE)
stopwords_edit <- function(language, source, simplify = TRUE) {
  stopwords_options()

  error <- create_error(
    default = paste0("Language ", "\"", language, "\" not available in source \"", source, "\"."),
    note = "See `?stopwords_getlanguages` for more information on supported languages."
  )

  words <- tryCatch(
    get_stopwords_data(source)[[language]],
    error = function(message) error(message)
  )

  if (is.null(words)) {
    error(paste0("Language \"", language, "\" not found."))
  }

  if (simplify) {
    char_edit(unlist(words, use.names = FALSE))
  } else {
    list_edit(words)
  }
}

#' @noRd
#' @importFrom yaml write_yaml read_yaml
#' @importFrom utils edit
list_edit <- function(x) {
  tfile <- tempfile(fileext = ".yml")
  write_yaml(x, file = tfile)
  try(edited <- utils::edit(file = tfile), silent = TRUE)
  read_yaml(tfile)
}

#' @rdname stopwords_edit
#' @description `char_edit()` provides a quick way to edit character vectors,
#'   useful for instance if you are editing a list for a second time.
#' @param x a character vector to be edited
#' @param sep a character vector of strings to append after each element,
#'   defaults to `"\n"` so that each word will be on its own line in the editor
#' @return `char_edit()` returns an edited character vector
#' @export
char_edit <- function(x, sep = "\n") {
  if (!is.vector(x) || !is.character(x))
    stop("x must be a character vector")
  tfile <- tempfile(fileext = ".txt")
  cat(x, sep = sep, file = tfile)
  try(edited <- utils::edit(file = tfile), silent = TRUE)
  readLines(tfile)
}

#' @rdname stopwords_edit
#' @description
#' `char_remove()` removes the stopwords matching `pattern` and corresponding
#' to the pattern type in `valuetype`.
#'
#' There is no `char_add()` because you can just use `[c()]` for this.
#' @param pattern a character vector containing patterns matching elements to
#'   be removed
#' @param valuetype the type of pattern matching: `"glob"` for "glob"-style
#'   wildcard expressions; `"regex"` for regular expressions; or `"fixed"` for
#'   exact matching
#' @param case_insensitive logical; if `TRUE`, ignore case when matching a
#'   `pattern`
#' @seealso [utils::glob2rx()], [glob pattern matching
#'   (Wikipedia)](https://en.wikipedia.org/wiki/Glob_(programming)),
#'   [grep()]
#' @export
#' @examples
#' # character removal examples
#' char_remove(letters[1:5], c("a", "c", "NOTLETTER"))
#' words <- c("any", "and", "Anna", "as", "announce", "but")
#' char_remove(words, "an*")
#' char_remove(words, "an*", case_insensitive = FALSE)
#' char_remove(words, "^.n.+$", valuetype = "regex")
#'
#' # remove some of the system stopwords
#' stopwords("en", source = "snowball")[1:6]
#' stopwords("en", source = "snowball")[1:6] %>%
#'   char_remove(c("me", "my*"))
char_remove <- function(x, pattern, valuetype = c("glob", "fixed", "regex"),
                        case_insensitive = TRUE) {
  valuetype <- match.arg(valuetype)
  if (valuetype == "glob") pattern <- utils::glob2rx(pattern)
  pattern <- paste(pattern, collapse = "|")
  grep(pattern, x, invert = TRUE, value = TRUE, fixed = (valuetype == "fixed"),
       ignore.case = case_insensitive)
}
