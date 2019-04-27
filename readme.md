# R language Docker image

This image mainly serves for Zhuoer Dong's personal use (some setting like mirror & timezone may not suit for everyone)



# featrues 

1. China timezone
1. common system dependencies installed



# structure

```
base --- remotes ---- zhuoerdown
            |
            |-------- deverse 
            |
            |-------- pkgdown
```



# detail

- base [![Build Status](https://travis-ci.com/dongzhuoer/docker-rlang.svg?branch=base)](https://travis-ci.com/dongzhuoer/docker-rlang)

  Basic R installation with some configuration files and common system dependencies.
  
  > Users who need to compile R packages from source [e.g. package maintainers, or anyone installing packages with `install.packages()]` should also install the r-base-dev package
  > 
  > --- https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/linux/ubuntu/README.html  

- remotes [![Build Status](https://travis-ci.com/dongzhuoer/docker-rlang.svg?branch=remotes)](https://travis-ci.com/dongzhuoer/docker-rlang)

  R with **remotes** and Git installed.

- deverse [![Build Status](https://travis-ci.com/dongzhuoer/docker-rlang.svg?branch=deverse)](https://travis-ci.com/dongzhuoer/docker-rlang)
  
  R with **dev**lopment uni**verse** packages and Git installed.

- pkgdown [![Build Status](https://travis-ci.com/dongzhuoer/docker-rlang.svg?branch=pkgdown)](https://travis-ci.com/dongzhuoer/docker-rlang)
  
  R for building **pkgdown** website.

- zhuoerdown [![Build Status](https://travis-ci.com/dongzhuoer/docker-rlang.svg?branch=zhuoerdown)](https://travis-ci.com/dongzhuoer/docker-rlang)
  
  R with **zhuoerdown** (and **remotes**) installed.

