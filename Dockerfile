FROM continuumio/miniconda3
RUN mkdir /climada
COPY . /climada
WORKDIR /climada

# Set up conda
RUN conda init
RUN . /root/.bashrc

# Get CLIMADA requirements file
RUN wget https://github.com/CLIMADA-project/climada_python/raw/main/requirements/env_climada.yml
WORKDIR /

# Install CLIMADA requirements
RUN conda env update -n base --file /climada/env_climada.yml

# Make RUN commands use the conda environment (requires everything to work in a login shell):
SHELL ["/bin/bash", "--login", "-c"]

# Install CLIMADA, clean up
RUN pip install climada
RUN conda clean -afy

# Copy the config file to the home directory
COPY ./climada.conf ~/climada.conf
