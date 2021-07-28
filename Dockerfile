FROM continuumio/miniconda3
RUN mkdir /climada
COPY . /climada
WORKDIR /climada
RUN git clone https://github.com/CLIMADA-project/climada_python
WORKDIR /climada/climada_python
RUN conda env update -n base --file requirements/env_climada.yml
RUN conda install -c conda-forge jupyterlab
RUN python setup.py install
RUN conda clean -afy
