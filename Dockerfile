FROM dongzhuoer/ubuntu-cn:rolling

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

## Set a default user. Available via runtime flag `--user docker`. User should also have & own a home directory. 
RUN useradd docker && mkdir /home/docker

# tzdata is a dependency of r-base-dev, so it's the same as we just install the latter
RUN apt update && apt -y install tzdata add-apt-key software-properties-common \
    && echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E084DAB9 \
    && apt-add-repository -y "deb https://mirrors4.tuna.tsinghua.edu.cn/CRAN/bin/linux/ubuntu bionic-cran35/" \
    && apt update && apt -y install r-base-dev && rm -r /usr/local/lib/R/site-library/ \
    && apt -y purge add-apt-key software-properties-common && apt -y autoremove && rm -r /var/lib/apt/lists/

RUN echo 'R_LIBS_USER="~/.local/lib/R"' > /usr/lib/R/etc/Renviron.site 

RUN echo "options(Ncpus = 2L)" >> /usr/lib/R/etc/Rprofile.site 
RUN echo "options(BioC_mirror = 'https://mirrors4.tuna.tsinghua.edu.cn/bioconductor')" >> /usr/lib/R/etc/Rprofile.site 
RUN echo "options(repos = c('CRAN' = 'https://mirrors4.tuna.tsinghua.edu.cn/CRAN'))" >> /usr/lib/R/etc/Rprofile.site 

RUN mkdir -p /home/docker/.local/lib/R && chown -R docker:docker /home/docker
