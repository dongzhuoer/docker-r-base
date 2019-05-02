FROM dongzhuoer/rlang:rmarkdown

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

ARG GITHUB_PAT

RUN R --slave -e "remotes::install_github('dongzhuoer/zhuoerdown', lib = '/usr/lib/R/site-library')"
