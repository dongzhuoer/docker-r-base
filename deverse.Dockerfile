FROM dongzhuoer/rlang:remotes

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

# `pkgload::load_all()`
# `testthat::test_dir()`
RUN apt update && apt -y install r-cran-pkgload r-cran-testthat && rm -r /var/lib/apt/lists/

# `here::here('')` is used to set working directory to project directory
RUN R --slave -e "install.packages(c('here'), lib = '/usr/lib/R/site-library')"
