FROM dongzhuoer/rlang:remotes

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

# install latest pandoc
RUN apt update && apt -y install wget gdebi-core \
    && wget -q -O - https://github.com/jgm/pandoc/releases/latest | grep -oP '([^"]+.deb)(?=")' | sed 's/^/https:\/\/github.com/' | xargs wget -q -O pandoc.deb && echo y | gdebi pandoc.deb && rm pandoc.deb \
    && apt -y purge wget gdebi-core && apt -y autoremove && rm -r /var/lib/apt/lists/

RUN R --slave -e "install.packages('rmarkdown', lib = '/usr/lib/R/site-library')"
