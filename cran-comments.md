## Resubmission

- Updated WORDLIST to stop a spell-check failure for a note added to NEWS.md.
- Changed URLs to new versions that caused NOTES.
- Knitted README.Rmd to change URLs in README.md.

## Purpose

Fixes CRAN failures caused by a usage of lintr in tests.

## Test environments

All on R 4.1.1
* local macOS 11.6 install
* ubuntu 20.04 (on Travis-CI)
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 0 notes

## Reverse dependencies

`revdepcheck::revdep_check()` indicates no problems with other packages reverse importing or reverse suggesting stopwords.
