FROM dongzhuoer/rlang:rmarkdown

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

# install hugo (hugo is relatively new so we won't download GitHub release)
RUN apt update && apt -y install hugo && rm -r /var/lib/apt/lists/

# install blogdown
RUN R --slave -e "install.packages('blogdown', lib = '/usr/lib/R/site-library')"
