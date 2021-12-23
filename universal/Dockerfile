FROM mcr.microsoft.com/vscode/devcontainers/base:alpine

# Last updated: 2021-12-23 21:33:28


# TODO: The following two commands create two layers. Use a multistage build to
# copy files on top of base alpine image as a single layer.
#
# - https://pythonspeed.com/articles/multi-stage-docker-python/
COPY * /tmp/
# RUN make clean && make install
RUN /tmp/setup.sh
