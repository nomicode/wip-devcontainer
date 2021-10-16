FROM ghcr.io/bottle-garden/devcontainer:main as build

USER root
WORKDIR /tmp

COPY * .
RUN brew bundle && \
    npm install -g --verbose

FROM scratch
COPY --from=build / /
