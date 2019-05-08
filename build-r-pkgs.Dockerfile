FROM dongzhuoer/rlang:rmarkdown

LABEL maintainer="Zhuoer Dong <dongzhuoer@mail.nankai.edu.cn>"

RUN apt update && apt -y install hugo && rm -r /var/lib/apt/lists/

RUN R --slave -e "install.packages(c('bookdown', 'devtools', 'fs', 'lubridate', 'nycflights13', 'pryr', 'rlang', 'roxygen2', 'stringi', 'testthat', 'tidyverse', 'withr'), lib = '/usr/lib/R/site-library')"
