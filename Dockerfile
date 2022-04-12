# Start from a core stack version
FROM jupyter/r-notebook:70178b8e48d7
LABEL maintainer="Socorro Domiguez"

# Install package
RUN Rscript -e 'install.packages(c("sf", "lwgeom", "covr", "raster"), dependencies = TRUE, repos = "https://cloud.r-project.org")'
RUN git clone   https://github.com/r-spatial/sf.git
RUN R CMD build --no-build-vignettes sf
RUN R CMD INSTALL sf_*tar.gz
RUN R CMD check --as-cran sf_*tar.gz

RUN R -e "install.packages('devtools', repos='http://cran.rstudio.com/')"
RUN R -e "devtools::install_github('NeotomaDB/neotoma2')"

RUN R CMD INSTALL neotoma2_*tar.gz
RUN R CMD check --as-cran neotoma2_*tar.gz

ENV JUPYTER_ENABLE_LAB=yes
CMD ["/bin/bash"]
