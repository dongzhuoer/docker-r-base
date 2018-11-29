# Overwiew
[![Build Status](https://travis-ci.com/dongzhuoer/docker-r-base.svg?branch=master)](https://travis-ci.com/dongzhuoer/docker-r-base)

R language Docker image

This image mainly serves for Zhuoer Dong's personal use (some setting like mirror & timezone may not suit for everyone)

# featrues 

1. ready for installing packages,
1. China timezone

# structure

```
  ------ bookdown-full
 /
base --- remotes ---- zhuoerdown
 \
  --------devtools 
```

# about this Docker

> Users who need to compile R packages from source [e.g. package maintainers, or anyone installing packages with `install.packages()]` should also install the r-base-dev package
> --- https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/linux/ubuntu/README.html  


