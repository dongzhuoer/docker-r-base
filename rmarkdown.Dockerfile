FROM dongzhuoer/rlang:remotes

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

# install latest pandoc
    ## pandoc 2.4 introduce many new feature
    ## and it serves as an example, showing the code for installing GitHub release does work
RUN apt update && apt -y install wget gdebi-core \
    && wget -q -O pandoc.deb https://github.com/jgm/pandoc/releases/download/2.10.1/pandoc-2.10.1-1-amd64.deb && echo y | gdebi pandoc.deb && rm pandoc.deb \
    && apt -y purge wget gdebi-core && apt -y autoremove && rm -r /var/lib/apt/lists/

RUN Rscript -e "install.packages('rmarkdown')"
