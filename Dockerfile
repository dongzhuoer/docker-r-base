FROM dongzhuoer/ubuntu-cn:rolling

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

## Set a default user. Available via runtime flag `--user docker`. User should also have & own a home directory. 
RUN useradd docker && mkdir /home/docker

RUN apt update && apt -y install add-apt-key software-properties-common \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E084DAB9 \
    && apt-add-repository -y "deb https://mirrors4.tuna.tsinghua.edu.cn/CRAN/bin/linux/ubuntu bionic-cran35/" \
    && apt update && apt -y install r-base-dev && rm -r /usr/local/lib/R/site-library/ \
    && apt -y purge add-apt-key software-properties-common \
    && apt -y autoremove && apt clean && rm -r /var/lib/apt/lists/

RUN echo "options(BioC_mirror = 'https://mirrors4.tuna.tsinghua.edu.cn/bioconductor')" >> /usr/lib/R/etc/Rprofile.site 
RUN echo "options(repos = c('CRAN' = 'https://mirrors4.tuna.tsinghua.edu.cn/CRAN'))" >> /usr/lib/R/etc/Rprofile.site 

RUN echo 'R_LIBS_USER="~/.local/lib/R"' > /home/docker/.Renviron
RUN mkdir -p /home/docker/.local/lib/R
RUN chown -R docker:docker /home/docker
