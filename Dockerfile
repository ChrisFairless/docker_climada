FROM continuumio/miniconda3
RUN mkdir /climada
COPY . /climada
WORKDIR /climada

# Save a little space in this image by not writing bytecode. Experimental, feel free to turn off.
# See https://jcristharif.com/conda-docker-tips.html
ENV PYTHONDONTWRITEBYTECODE 1

# Update packages
RUN apt-get update

# Set up conda
RUN conda init
RUN . /root/.bashrc

# Get CLIMADA requirements file
RUN wget https://github.com/CLIMADA-project/climada_python/raw/main/requirements/env_climada.yml
WORKDIR /

# Install CLIMADA requirements
RUN conda env update -n base --file /climada/env_climada.yml && conda clean -afy

# Make RUN commands use the conda environment (requires everything to work in a login shell):
SHELL ["/bin/bash", "--login", "-c"]

# Install CLIMADA, clean up
RUN pip install --no-cache climada

# Copy the config file to the home directory
COPY ./climada.conf /root/climada.conf
