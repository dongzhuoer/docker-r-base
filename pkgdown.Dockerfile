FROM dongzhuoer/rlang:rmarkdown

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

# roxygen2 builds documentation
# `pkgload::load_all()` would load testthat if `tests/testthat/` exists
RUN apt update && apt -y install r-cran-roxygen2 r-cran-testthat && rm -r /var/lib/apt/lists/

RUN apt update && apt -y install r-cran-stringi r-cran-xml2 r-cran-rcpp r-cran-reshape2 && rm -r /var/lib/apt/lists/
RUN R --slave -e "install.packages('pkgdown', lib = '/usr/lib/R/site-library')"
