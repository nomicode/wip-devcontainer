# Dockerfile configuration
# https://docs.docker.com/engine/reference/builder/

# Update timestamp to force a rebuild
# 1632698678990

FROM ghcr.io/bottle-garden/vscode/gh/brew:main

COPY build.sh /tmp/build.sh
RUN /tmp/build.sh
