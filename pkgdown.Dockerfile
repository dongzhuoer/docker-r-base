FROM dongzhuoer/rlang:rmarkdown

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

# pkgdown depends on ragg
RUN apt update && apt -y install libtiff5-dev libharfbuzz-dev libfribidi-dev && rm -r /var/lib/apt/lists/

# roxygen2 builds documentation
# `pkgload::load_all()` would load testthat if `tests/testthat/` exists
RUN Rscript -e "install.packages(c('pkgdown', 'roxygen2', 'pkgload', 'testthat'))"
