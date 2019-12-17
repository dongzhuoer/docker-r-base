FROM dongzhuoer/rlang:rmarkdown

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

ARG GITHUB_PAT
RUN Rscript -e "remotes::install_github('dongzhuoer/zhuoerdown')"
