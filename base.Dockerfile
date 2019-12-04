FROM dongzhuoer/ubuntu-cn:eoan

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

# prepare
## add CRAN source for latest R
RUN apt update && apt -y install add-apt-key software-properties-common \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 \
    && apt-add-repository -y "deb https://mirrors4.tuna.tsinghua.edu.cn/CRAN/bin/linux/ubuntu eoan-cran35/" \
    && apt -y purge add-apt-key software-properties-common && apt -y autoremove && rm -r /var/lib/apt/lists/
## if you install r-base-dev directly, it would ask you to choose timezone and cause timeout
RUN apt update && apt -y install tzdata && rm -r /var/lib/apt/lists/
RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

# install
RUN apt update && apt -y install r-base-dev && rm -r /usr/local/lib/R/site-library/

# post
## common system dependencies for R packages
RUN apt update && apt -y install libcurl4-openssl-dev libssl-dev libxml2-dev libcairo2-dev && rm -r /var/lib/apt/lists/
## configuration
RUN echo 'R_LIBS_USER="~/.local/lib/R"' > /usr/lib/R/etc/Renviron.site 
RUN echo "options(BioC_mirror = 'https://mirrors4.tuna.tsinghua.edu.cn/bioconductor')" >> /usr/lib/R/etc/Rprofile.site 
RUN echo "options(repos = c('CRAN' = 'https://mirrors4.tuna.tsinghua.edu.cn/CRAN'))" >> /usr/lib/R/etc/Rprofile.site 
