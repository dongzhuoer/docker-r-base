FROM dongzhuoer/rlang:rmarkdown

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

RUN apt update && apt -y install hugo && rm -r /var/lib/apt/lists/

RUN Rscript -e "install.packages('blogdown', lib = '/usr/lib/R/site-library')"
