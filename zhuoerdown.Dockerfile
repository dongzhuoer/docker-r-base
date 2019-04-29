FROM dongzhuoer/rlang:rmarkdown

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

ARG GITHUB_PAT

RUN apt update && apt -y install r-cran-stringi r-cran-rcpp && rm -r /var/lib/apt/lists/
RUN R --slave -e "remotes::install_github('dongzhuoer/zhuoerdown', lib = '/usr/lib/R/site-library')"
