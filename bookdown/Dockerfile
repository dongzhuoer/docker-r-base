FROM dongzhuoer/rlang:devtools

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

USER docker

RUN R --slave -e "install.packages('bookdown')"

USER root
