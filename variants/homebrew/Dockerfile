# Dockerfile configuration
# https://docs.docker.com/engine/reference/builder/

# Update timestamp to force a rebuild
# 1632674108503

FROM ghcr.io/bottle-garden/github-devcontainer/base:main

# Run the build
COPY build.sh /tmp/build.sh
RUN /tmp/build.sh && rm /tmp/build.sh
