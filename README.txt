# CLIMADA in a Dockerfile

This takes a Minoconda docker image and clones the CLIMADA impact modelling repository into it, installing all required dependencies.

The container uses the `main` branch of the repository and doesn't copy the additional tools available to CLIMADA in [climada_petals](https://github.com/CLIMADA-project/climada_petals).

This is mostly being built for projects that depend on CLIMADA to have an easy image to build from, for example a simple (container for running CLIMADA tutorials)[https://github.com/ChrisFairless/climada_tutorial_dockerfile], or a containerised calculation and visualisation tool.

## Installation

### Download
The image is currently quite large (a few GB) so make sure you have a reliable internet connection.

- If you don't have Docker installed, download that first. You can get (Docker Desktop)[https://www.docker.com/products/docker-desktop] here
- Launch Docker
- Open a terminal with a command line, and run `docker pull crease/climada`. Depending on your privileges you may need to use `sudo`

### Run
There are two ways to launch the container.
- From the Docker Desktop app, click Images in the left hand side bar
  - Find the crease/climada image and click the RUN button to the right
  - A pop-up will appear for you to set up the container. If you want to make any data available to it from your local machine, do this by setting up a Volume in the Optional Settings. The default location for CLIMADA to save its data and results is in the container's  /climada/data/ folder, making this a good place to mount to. Here you can also give the container you create a name, otherwise it will be assigned a random one
  - Click Run

- Alternately, from the command line, type `docker run −it crease/climada`. If you want to mount a volume and give the container access to files on your local machine, instead run `docker run -it crease/climada -v /path/to/local/directory:/climada/data/`, which will make that directory available within the machine at /climada/data (the default internal save location for the container)


## Usage
- The container is now running. Since this container doesn't provide any functionality to processes outside of itself, you will need to launch the container's command line tool to do anything with it
  - (The container's main purpose is to provide a pre-installed version of CLIMADA that other containers can be built on top of, such as calculation APIs or (tutorial notebooks)[https://github.com/ChrisFairless/climada_tutorial_dockerfile]
- To launch the container with access to its command line, run it instead with `docker run -it crease/climada bash` or from the mouseover 'CLI' button in the list of running Containers/Apps in Docker Desktop 
- This will give you access to the command line within the container. To run CLIMADA scripts using data that is not packaged with the CLIMADA core, you will need to mount a local volume with the instructions above, or download data via the packaged  (CLIMADA Data API)[https://github.com/CLIMADA-project/climada_python/blob/main/doc/tutorial/climada_util_api_client.ipynb].
- To run tutorials, first run `pip install jupyterlab` from within the container. This will install jupyter functionality. Then navigate to /climada/climada_python/doc/tutorial/ and run `jupyter notebook`. The notebook will start and instructions to connect will be printed to the terminal.
- To access the additional functionality and tutorials available in the [CLIMADA petals](https://github.com/CLIMADA-project/climada_petals) repository, navigate to /climada/ within the container and follow the installation instructions for the repository.
- Save any outputs that you want to be able to access once the container is stopped in the mounted volume 
