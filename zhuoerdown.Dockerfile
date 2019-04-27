FROM dongzhuoer/rlang:remotes

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

ARG GITHUB_PAT

# install latest pandoc
RUN apt update && apt -y install wget gdebi-core \
    && wget -q -O - https://github.com/jgm/pandoc/releases/latest | grep -oP '([^"]+.deb)(?=")' | sed 's/^/https:\/\/github.com/' | xargs wget -q -O pandoc.deb && echo y | gdebi pandoc.deb && rm pandoc.deb \
    && apt -y purge wget gdebi-core && apt -y autoremove && rm -r /var/lib/apt/lists/

# install zhuoerdown
RUN R --slave -e "remotes:::github_pat(); message('debug GITHUB_PAT, should not be b2b7***')"  
RUN R --slave -e "remotes::install_github('dongzhuoer/zhuoerdown', lib = '/usr/lib/R/site-library')"

# common system dependencies for R packages
RUN apt update && apt -y install libcurl4-openssl-dev libssl-dev libxml2-dev && rm -r /var/lib/apt/lists/
