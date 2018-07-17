FROM ubuntu:rolling

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

## Set a default user. Available via runtime flag `--user docker` 
## User should also have & own a home directory. 
RUN useradd travis && mkdir /home/travis && chown travis:travis /home/travis

RUN apt-add-repository -y "deb https://cran.rstudio.com/bin/linux/ubuntu bionic-cran35/"
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E084DAB9

RUN apt update
RUN apt -y install r-base-dev 
RUN rm -r /usr/local/lib/R/site-library/



