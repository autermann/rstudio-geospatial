FROM rocker/rstudio:3.5.2

LABEL maintainer="Christian Autermann <c.autermann@52north.org>"

# install python and dependencies required for R
RUN  apt-get update \
  && apt-get install --no-install-recommends --yes \
        lbzip2 \
        libcairo-dev \
        libfftw3-dev \
        libgdal-dev \
        libgeos-dev \
        libgit2-dev \
        libgl1-mesa-dev \
        libglu1-mesa-dev \
        libgsl-dev \
        libhdf4-alt-dev \
        libhdf5-dev \
        libjq-dev \
        liblwgeom-dev \
        libnetcdf-dev \
        libproj-dev \
        libprotobuf-dev \
        libsqlite3-dev \
        libssl-dev \
        libudunits2-dev \
        netcdf-bin \
        protobuf-compiler \
        python-dev \
        python-pip \
        tk-dev \
        unixodbc-dev \
  # clean-up apt
  && apt-get clean && rm -rf /var/lib/apt/lists

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    lbzip2 \
    libfftw3-dev \
    libgdal-dev \
    libgeos-dev \
    libgsl0-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libhdf4-alt-dev \
    libhdf5-dev \
    libjq-dev \
    liblwgeom-dev \
    libproj-dev \
    libprotobuf-dev \
    libnetcdf-dev \
    libsqlite3-dev \
    libssl-dev \
    libudunits2-dev \
    netcdf-bin \
    protobuf-compiler \
    tk-dev \
    unixodbc-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists

RUN install2.r --error \
    RColorBrewer \
    RandomFields \
    RNetCDF \
    classInt \
    deldir \
    gstat \
    hdf5r \
    lidR \
    mapdata \
    maptools \
    mapview \
    ncdf4 \
    proj4 \
    raster \
    rgdal \
    rgeos \
    rlas \
    sf \
    sp \
    spacetime \
    spatstat \
    spdep \
    geoR \
    geosphere \
    BiocManager \
    ## from bioconductor
  && R -e "BiocManager::install('rhdf5')" \
  && rm -rf /tmp/downloaded_packages \
  && rm -rf /tmp/repos_*.rds
