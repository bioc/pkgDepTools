globals <- new.env(parent=emptyenv(), hash=TRUE)


.First.lib <- function(libname, pkgname) {
    globals$have_RCurl <- suppressWarnings(require("RCurl", quietly=TRUE))
}
.onLoad <- .First.lib

.onAttach <- function(libname, pkgname) {
    msg <- sprintf(
        "Package '%s' is deprecated and will be removed from Bioconductor
         version %s", pkgname, "3.18")
    .Deprecated(msg=paste(strwrap(msg, exdent=2), collapse="\n"))
}

