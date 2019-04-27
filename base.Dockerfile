FROM dongzhuoer/ubuntu-cn

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"


# Asia/Shanghai doesn't work
# $ docker run --rm dongzhuoer/rlang:base cat /etc/timezone
# Etc/UTC
# you may need `add-apt-key software-properties-common apt ...` if you asked to choose timezone thus timeout
# tzdata is a dependency of r-base-dev, so it's the same as we just install the latter
RUN apt update && apt -y install tzdata add-apt-key software-properties-common \
    && echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E084DAB9 \
    && apt-add-repository -y "deb https://mirrors4.tuna.tsinghua.edu.cn/CRAN/bin/linux/ubuntu bionic-cran35/" \
    && apt update && apt -y install r-base-dev && rm -r /usr/local/lib/R/site-library/ \
    && apt -y purge add-apt-key software-properties-common && apt -y autoremove && rm -r /var/lib/apt/lists/

# common system dependencies for R packages
RUN apt update && apt -y install libcurl4-gnutls-dev libssl-dev libxml2-dev && rm -r /var/lib/apt/lists/

# configuration
RUN echo 'R_LIBS_USER="~/.local/lib/R"' > /usr/lib/R/etc/Renviron.site 

RUN echo "options(BioC_mirror = 'https://mirrors4.tuna.tsinghua.edu.cn/bioconductor')" >> /usr/lib/R/etc/Rprofile.site 
RUN echo "options(repos = c('CRAN' = 'https://mirrors4.tuna.tsinghua.edu.cn/CRAN'))" >> /usr/lib/R/etc/Rprofile.site 
