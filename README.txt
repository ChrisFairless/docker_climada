# CLIMADA in a Dockerfile

This takes a small Ubuntu installation and clones the CLIMADA impact modelling repository into it, installing all required dependencies.

The container uses the `main` branch of the repository and doesn't copy the additional tools available to CLIMADA in [climada_petals](https://github.com/CLIMADA-project/climada_petals).

This is mostly being built for projects that depend on CLIMADA to have an easy image to build from, for example a simple environment for running CLIMADA tutorials [https://github.com/ChrisFairless/climada_tutorial_dockerfile], or a containerised calculation and visualisation tool.
