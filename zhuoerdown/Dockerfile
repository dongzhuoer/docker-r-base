FROM dongzhuoer/rlang:devtools-dev

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

USER docker

RUN R --slave -e "source('http://bioconductor.org/biocLite.R')"
