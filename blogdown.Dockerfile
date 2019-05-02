FROM dongzhuoer/rlang:remotes

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

RUN apt update && apt -y install hugo && rm -r /var/lib/apt/lists/

RUN R --slave -e "install.packages('blogdown', lib = '/usr/lib/R/site-library')"
