#' Use stopwords in your package
#'
#' Sets up your package to import and re-export the [stopwords()] function in
#' your package. This function requires the use of the \pkg{roxygen2} package.
#' * Adds `stopwords`` to "Imports" in `DESCRIPTION`.
#' * Imports [stopwords()], which is necessary for internal use.
#' * Exports [stopwords()], if `export = TRUE`, which is necessary to make
#'   the function available to the users of your package.
#'
#' @param export If `TRUE`, the file `R/stopwords.R` is added, which provides
#'   the roxygen template to import and re-export [stopwords()]. If `FALSE`, the
#'   necessary roxygen directive is added, if possible, or otherwise
#'   instructions are given.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' use_stopwords()
#' }
use_stopwords <- function(export = TRUE) {
  usethis:::check_is_package("use_stopwords()")
  usethis:::check_uses_roxygen("use_stopwords()")

  usethis:::use_dependency("stopwords", "Imports")

  if (export) {
    usethis:::use_template("stopwords.R", "R/use-stopwords.R") && usethis:::roxygen_update()
    return(invisible(TRUE))
  }

  if (usethis:::has_package_doc()) {
    usethis:::roxygen_ns_append("@importFrom stopwords stopwords") && usethis:::roxygen_update()
    return(invisible(TRUE))
  }

  usethis:::ui_todo(
    "Copy and paste this line into some roxygen header, then run \\
    {ui_code('devtools::document()')}:"
  )
  usethis:::ui_code_block("#' @importFrom stopwords stopwords", copy = FALSE)
  usethis:::ui_todo(
    "Alternative recommendation: call {ui_code('use_package_doc()')}, then \\
    call {ui_code('use_stopwords()')} again."
  )
  invisible(FALSE)
}
