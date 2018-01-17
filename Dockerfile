FROM continuumio/miniconda:4.3.27p0

LABEL maintainer="shaheen2@llnl.gov, zhang40@llnl.gov"

ARG VERSION="v1.1.1"

# RUN git clone --branch $VERSION --depth=1 https://github.com/ACME-Climate/acme_diags.git

# COPY . /src

COPY conda/acme_diags_env.yml acme_diags_env.yml

# WORKDIR /src

RUN conda env create -f acme_diags_env.yml && \
    conda clean --all -y && \
    source activate acme_diags_env

ENTRYPOINT "acme_diags_driver.py"
