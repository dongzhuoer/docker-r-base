FROM dongzhuoer/rlang:base

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

RUN apt update && apt -y install git && rm -r /var/lib/apt/lists/

RUN Rscript -e "install.packages('remotes')"
