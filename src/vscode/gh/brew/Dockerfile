# Dockerfile configuration
# https://docs.docker.com/engine/reference/builder/

# Update timestamp to force a rebuild
# 1632871338838

FROM ghcr.io/bottle-garden/vscode-gh:main

# Run the build
COPY build.sh /tmp/build.sh
RUN /tmp/build.sh && rm /tmp/build.sh
