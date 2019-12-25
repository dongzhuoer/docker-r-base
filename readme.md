# R language Docker image
[![Build Status](https://travis-ci.com/dongzhuoer/docker-rlang.svg?branch=master)](https://travis-ci.com/dongzhuoer/docker-rlang)

This image mainly meets Zhuoer Dong's personal preference, use it with caution.



# featrues 

1. common system dependencies installed
1. chinese mirror for installing packages



# Usage

I mainly use it on Travis CI. Note that `.travis.yml` in the following is not complete (to save space).

- 能 `cp` 就不要 `-v`
- `/root/` 作为 project folder，用 `git/`，`output/` 等完成特定任务（有时也用 `/git`, `/output`）。
  

## simple usage

The simplest way is to directly run as root. The drawback is that output files belongs to root, thus very hard to manipulate outside the container (when you test on local or debug on Travis).

```yaml
language: minimal
install: docker run -dt --name rlang0 -w /root -v `pwd`:/root dongzhuoer/rlang:blogdown 2> /dev/null
script: docker exec rlang0 Rscript -e "blogdown::build_site(local = TRUE)"
```

- `-dt` keeps the container running
- `2> /dev/null` avoid a lot of message in Travis job log  
- `-v` mount current directory to `/root` and works (`-w`) there, which must be empty (you may use consider `$TRAVIS_REPO_SLUG`).

## build & depoly

- mount `wd/` to `/root` (or copy `./.`)
- `repo/` for source code, `output/` for result, `git` for deploy

## testthat

see `minir`, it also demonstrates how to deploy output (it's much easy if you run as normal user).



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