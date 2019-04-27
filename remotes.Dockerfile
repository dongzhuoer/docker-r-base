FROM dongzhuoer/rlang:base

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

RUN apt update && apt -y install git && rm -r /var/lib/apt/lists/

RUN R --slave -e "install.packages('remotes', lib = '/usr/lib/R/site-library')"
