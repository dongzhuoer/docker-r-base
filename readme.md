# R language Docker image
[![Build Status](https://travis-ci.com/dongzhuoer/docker-rlang.svg?branch=master)](https://travis-ci.com/dongzhuoer/docker-rlang)

This image mainly meets Zhuoer Dong's personal preference, use it with caution.



# featrues 

1. common system dependencies installed
1. chinese mirror for installing packages
1. ready for using by normal user (`R_LIBS_USER="~/.local/lib/R"`)



# tag

```
base --- remotes --- deverse
            |
            |------- rmarkdown 
                         |
                         |--- pkgdown 
                         |
                         |--- zhuoerdown 
                         |
                         |--- blogdown 
```

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

- blogdown
  
  R with **blogdown** installed.



# Usage

I mainly use it on Travis CI.

## simple usage

see `localsite`, directly run as root.

## normal user & cache packages

```yaml
dist: xenial
language: minimal
git:
  depth: false
  submodules: false
cache: 
  directories: [$HOME/.local/lib/R/]

install:
  # create container
  - docker run -dt --name rlang0 -w $HOME -u `id -u`:`id -g` -e CI=true -e GITHUB_PAT=$GITHUB_PAT -v $TRAVIS_BUILD_DIR:$HOME -v $HOME/.local/lib/R:$HOME/.local/lib/R dongzhuoer/rlang:rmarkdown 2> /dev/null
  # add user & group (assuming the image contains no user)
  - docker exec -u root rlang0 groupadd `id -gn` -g `id -g`
  - docker exec -u root rlang0 useradd $USER -u `id -u` -g `id -g`
  # (optional) install additional software & packages
  - docker exec -u root rlang0 bash -c "apt update && apt -y install hugo"
  - docker exec -u root rlang0 R --slave -e "remotes::update_packages(c('magrittr'))"
script: docker exec rlang0 R --slave -e "rmarkdown::render('main.Rmd')"
```

## test package

see `minir`, it also demonstrates how to deploy output (it's much easy if you run as normal user).

## tips

1. install some pkg quietly to reduce log

```r
remotes::update_packages(c('RcppEigen', 'igraph', 'ggforce', 'RSQLite', 'Rhdf5lib'), upgrade = TRUE, quiet = TRUE)
```

# to do

1.  Asia/Shanghai doesn't work

```bash
$ docker run --rm dongzhuoer/rlang:base cat /etc/timezone
Etc/UTC
```