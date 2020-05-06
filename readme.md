# Overview
[![Build Status](https://travis-ci.com/dongzhuoer/docker-rlang.svg?branch=master)](https://travis-ci.com/dongzhuoer/docker-rlang)

R language Docker image with following featrues: 

1. common system dependencies installed
1. chinese mirror for installing packages

> This image mainly meets Zhuoer Dong's personal preference, use it with caution.



# Usage

The core idea is to suit for both Travis CI and local debug.

## simple usage

The simplest way is to directly mount current directory into container and run the command, such as [localsite](https://github.com/dongzhuoer/localsite/blob/master/.travis.yml). One additional thing is to change user of output files from root to you.

```yaml
language: minimal
script: 
  - docker run -dt --name rlang0 -w /root -v `pwd`:/root dongzhuoer/rlang:blogdown 2> /dev/null
  - docker exec rlang0 Rscript -e "blogdown::build_site(local = TRUE)"
  - docker exec rlang0 chown -R `id -u`:`id -g` content static public
# `2> /dev/null` avoid a lot of message in Travis job log
```

## build & depoly

1. perfer `docker cp ./. container:/root` to ``-v `pwd`:/root``
1. directory must have meaningful name and be empty:  
   - `/root` for working directory (stores source code)
   - `/output` for result
   - `/git` for deploy (clone remote)

The above principles are best explained by examples:  

- [thesis](https://github.com/dongzhuoer/thesis/blob/master/.travis.yml) render `.Rmd` and deploy one file
- [build-website](https://github.com/dongzhuoer/build-website/blob/master/bookdown.sh) fetch files (not build) and deploy   
  I use `/root/git` since I'm sure it's empty
- [autobookdown](https://github.com/dongzhuoer/autobookdown/blob/master/build.sh) render bookdown and deploy directory
- [minir](https://github.com/dongzhuoer/minir/blob/master/.travis.yml) for R package and `import: dongzhuoer/minir:.travis.yml`  
  for system dependency, set `$apt` in `before_script`



# tag

```
base --- remotes --- deverse
            |
            |------- rmarkdown 
                         |
                         |------ pkgdown 
                         |
                         |------ zhuoerdown 
                         |
                         |------ blogdown 
```

- base 

  Basic R installation with some configuration files and common system dependencies.
  
  > Users who need to compile R packages from source [e.g. package maintainers, or anyone installing packages with `install.packages()]` should also install the r-base-dev package
  > 
  > --- https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/linux/ubuntu/README.html  

- remotes

  R with **remotes** and Git installed. 

  It's the _virtual_ base image, since installing packages from GitHub is a vast demand (and I prefer to use Git inside Docker). 

- deverse
  
  R with **dev**lopment uni**verse** packages installed.

- rmarkdown
  
  R with **rmarkdown** installed.

- pkgdown
  
  R for building **pkgdown** website.

- zhuoerdown
  
  R with **zhuoerdown** installed.

- blogdown
  
  R with **blogdown** installed.



# to do

1.  Asia/Shanghai doesn't work

```bash
$ docker run --rm dongzhuoer/rlang:base cat /etc/timezone
Etc/UTC
```



-----------------------
[![Creative Commons License](https://i.creativecommons.org/l/by-nc/4.0/88x31.png)](http://creativecommons.org/licenses/by-nc/4.0/)  
This work is licensed under a [Creative Commons Attribution-NonCommercial 4.0 International License](http://creativecommons.org/licenses/by-nc/4.0/)
