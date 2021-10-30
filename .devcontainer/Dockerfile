FROM ghcr.io/bottle-garden/devcontainer:main as build

USER root
WORKDIR /tmp

COPY * /tmp/
RUN make clean && make install
