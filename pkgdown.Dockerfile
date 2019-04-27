FROM dongzhuoer/rlang:rmarkdown

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

# roxygen2 builds documentation
# `pkgload::load_all()` would load testthat if `tests/testthat/` exists
RUN R --slave -e "install.packages(c('roxygen2', 'testthat', 'pkgdown'), lib = '/usr/lib/R/site-library')"
