# R language Docker image
[![Build Status](https://travis-ci.com/dongzhuoer/docker-rlang.svg?branch=master)](https://travis-ci.com/dongzhuoer/docker-rlang)

This image mainly serves for Zhuoer Dong's personal use (some setting like mirror & timezone may not suit for everyone)



# featrues 

1. China timezone
1. common system dependencies installed



# structure

```
base --- remotes ---- deverse
            |
            |-------- pkgdown 
            |
            |-------- zhuoerdown 
            |
            |-------- blogdown
```



# detail

- base 

  Basic R installation with some configuration files and common system dependencies.
  
  > Users who need to compile R packages from source [e.g. package maintainers, or anyone installing packages with `install.packages()]` should also install the r-base-dev package
  > 
  > --- https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/linux/ubuntu/README.html  

- remotes

  R with **remotes** and Git installed.

- deverse
  
  R with **dev**lopment uni**verse** packages and Git installed.

- pkgdown
  
  R for building **pkgdown** website.

- blogdown
  
  R with **blogdown**, Hugo (and **remotes**) installed.

- zhuoerdown
  
  R with **zhuoerdown**, Pandoc (and **remotes**) installed.
