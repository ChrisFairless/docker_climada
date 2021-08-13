FROM continuumio/miniconda3
RUN mkdir /climada
COPY . /climada
WORKDIR /climada
RUN git clone https://github.com/CLIMADA-project/climada_python
RUN conda env update -n base --file ./climada_python/requirements/env_climada.yml
RUN pip install -e climada_python
RUN python -c 'import climada; climada.setup_climada_data(reload=True)'
RUN python setup.py install
RUN conda clean -afy
