FROM dongzhuoer/rlang:rmarkdown

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

# roxygen2 builds documentation
# `pkgload::load_all()` would load testthat if `tests/testthat/` exists
RUN Rscript -e "install.packages(c('pkgdown', 'roxygen2', 'pkgload', 'testthat'))"
