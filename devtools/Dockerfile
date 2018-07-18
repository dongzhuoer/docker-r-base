FROM dongzhuoer/rlang:base

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

#                                curl                 openssl
RUN apt update && apt -y install libcurl4-openssl-dev libssl-dev

USER docker

RUN R --slave -e "install.packages('devtools')"

USER root
