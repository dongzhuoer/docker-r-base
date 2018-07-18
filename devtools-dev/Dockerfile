FROM dongzhuoer/rlang:devtools

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

USER docker

RUN R --slave -e "devtools::install_github('r-lib/devtools')"

USER root