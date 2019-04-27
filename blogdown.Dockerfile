FROM dongzhuoer/rlang:remotes

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

ARG GITHUB_PAT

# install latest hugo
RUN apt update && apt -y install wget gdebi-core \
    && wget -q -O - https://github.com/gohugoio/hugo/releases/latest | grep -oP '([^"]+Linux-64bit.deb)(?=")' | head -n 1 | sed 's/^/https:\/\/github.com/' | xargs wget -q -O hugo.deb && echo y | gdebi hugo.deb && rm hugo.deb \
    && apt -y purge wget gdebi-core && apt -y autoremove && rm -r /var/lib/apt/lists/

# install blogdown
RUN R --slave -e "install.packages('blogdown', lib = '/usr/lib/R/site-library')"
