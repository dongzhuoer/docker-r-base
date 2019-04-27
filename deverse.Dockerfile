FROM dongzhuoer/rlang:remotes

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

# `pkgload::load_all()`
# `here::here('')` is used to set working directory to project directory
RUN R --slave -e "install.packages(c('pkgload', 'here', 'testthat'), lib = '/usr/lib/R/site-library')"

