check_is_package <- usethis:::check_is_package
check_uses_roxygen <- usethis:::check_uses_roxygen
roxygen_ns_append <- usethis:::roxygen_ns_append
has_package_doc <- usethis:::has_package_doc
roxygen_update <- usethis:::roxygen_update
use_dependency <- usethis:::use_dependency

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
  check_is_package("use_stopwords()")
  check_uses_roxygen("use_stopwords()")

  use_dependency("stopwords", "Imports")

  if (export) {
    usethis::use_template("stopwords.R", "R/use-stopwords.R") && roxygen_update()
    return(invisible(TRUE))
  }

  if (has_package_doc()) {
    roxygen_ns_append("@importFrom stopwords stopwords") && roxygen_update()
    return(invisible(TRUE))
  }

  usethis::ui_todo(
    "Copy and paste this line into some roxygen header, then run \\
    {ui_code('devtools::document()')}:"
  )
  usethis::ui_code_block("#' @importFrom stopwords stopwords", copy = FALSE)
  usethis::ui_todo(
    "Alternative recommendation: call {ui_code('use_package_doc()')}, then \\
    call {ui_code('use_stopwords()')} again."
  )
  invisible(FALSE)
}
