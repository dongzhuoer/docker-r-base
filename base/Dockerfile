FROM dongzhuoer/ubuntu-cn:rolling

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

RUN apt update && apt -y install locales tzdata software-properties-common add-apt-key && rm -r /var/lib/apt/lists/

## Configure default locale, see https://github.com/rocker-org/rocker/issues/19
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen && update-locale LC_ALL=en_US.UTF-8
RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

## Set a default user. Available via runtime flag `--user docker`. User should also have & own a home directory. 
RUN useradd docker && mkdir /home/docker && chown docker:docker /home/docker
COPY --chown=docker:docker .R* /home/docker/

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E084DAB9
RUN apt-add-repository -y "deb https://mirrors4.tuna.tsinghua.edu.cn/CRAN/bin/linux/ubuntu bionic-cran35/"
RUN apt update && apt -y install r-base-dev && rm -r /usr/local/lib/R/site-library/ && rm -r /var/lib/apt/lists/

