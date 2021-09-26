# Dockerfile configuration
# https://docs.docker.com/engine/reference/builder/

# Update timestamp to force a rebuild
# 1632783354372

FROM ghcr.io/bottle-garden/vscode/gh/brew:main

COPY build.sh /tmp/build.sh
RUN /tmp/build.sh && rm /tmp/build.sh
