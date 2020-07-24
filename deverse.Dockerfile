FROM dongzhuoer/rlang:remotes

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

# `pkgload::load_all()`
# `testthat::test_dir()`
# `here::here('')` is used to set working directory to project directory
RUN Rscript -e "install.packages(c('pkgload', 'testthat', 'here'))"
