# Start from a core stack version
FROM jupyter/r-notebook:70178b8e48d7
LABEL maintainer="Socorro Domiguez"

# Install package
RUN R -e "install.packages('plotly', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('devtools', repos='http://cran.rstudio.com/')"
RUN R -e "devtools::install_github('NeotomaDB/neotoma2')"

ENV JUPYTER_ENABLE_LAB=yes
