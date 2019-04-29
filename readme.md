# R language Docker image
[![Build Status](https://travis-ci.com/dongzhuoer/docker-rlang.svg?branch=master)](https://travis-ci.com/dongzhuoer/docker-rlang)

This image mainly meets Zhuoer Dong's personal preference, use it with caution.



# featrues 

1. common system dependencies installed
1. chinese mirror for installing packages
1. ready for using by normal user (`R_LIBS_USER="~/.local/lib/R"`)



# structure

```
base --- remotes --- deverse
            |
            |------- rmarkdown 
                         |
                         |--- pkgdown 
                         |
                         |--- zhuoerdown 
```



# detail

- base 

  Basic R installation with some configuration files and common system dependencies.
  
  > Users who need to compile R packages from source [e.g. package maintainers, or anyone installing packages with `install.packages()]` should also install the r-base-dev package
  > 
  > --- https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/linux/ubuntu/README.html  

- remotes

  R with **remotes** and Git installed. 

  It's the _virtual_ base image, since installing packages from GitHub is a vast demand.

- deverse
  
  R with **dev**lopment uni**verse** packages installed.

- rmarkdown
  
  R with **rmarkdown** installed.

- pkgdown
  
  R for building **pkgdown** website.

- zhuoerdown
  
  R with **zhuoerdown** installed.



# Travis usage

1. see `localsite` for simple usage, directly run as root
1. see `minir` for comprehensive usage, including multiple jobs, as normal user, deploy output.



# to do

1.  Asia/Shanghai doesn't work

```bash
$ docker run --rm dongzhuoer/rlang:base cat /etc/timezone
Etc/UTC
```