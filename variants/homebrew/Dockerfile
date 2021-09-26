# Dockerfile configuration
# https://docs.docker.com/engine/reference/builder/

# Last modified: 2021-09-25 23:37:18

FROM ghcr.io/bottle-garden/github-devcontainer/base:main

COPY build.sh /tmp/build.sh
RUN /tmp/build.sh && rm /tmp/build.sh
