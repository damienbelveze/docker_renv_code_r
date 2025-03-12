#FROM ubuntu:20.04
FROM r-base:4.4.1
#MAINTAINER Damien Belvèze <damien.belveze@univ-rennes.fr>

ENV RENV_VERSION=1.0.7
#RUN apt update && apt install -y curl
#RUN RENV_WATCHDOG_ENABLED = FALSE

RUN mkdir /home/code_r
RUN R -e "install.packages('renv', repos = c(CRAN = 'https://cloud.r-project.org'))"
WORKDIR /home/code_r/

RUN mkdir -p renv
COPY code_r/war_cemeteries.Rmd war_cemeteries.Rmd
COPY code_r/renv.lock renv.lock
COPY code_r/.Rprofile .Rprofile
COPY code_r/renv/activate.R renv/activate.R
COPY code_r/renv/settings.json renv/settings.json

RUN R -e "renv::restore()"





#ENV RENV_VERSION 1.0.7
#RUN RENV_WATCHDOG_ENABLED = FALSE
#RUN Rscript -e "install.packages('renv', repos = 'https://cloud.r-project.org', version='$RENV_VERSION')"
#RUN Rscript -e "renv::diagnostics()"
#RUN Rscript -e "options(warn=2); renv::restore(repos='https://cloud.r-project.org');"
 
