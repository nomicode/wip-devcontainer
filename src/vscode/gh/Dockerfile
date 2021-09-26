# Dockerfile configuration
# https://docs.docker.com/engine/reference/builder/

# Update timestamp to force a rebuild
# 1632674108503

# Pin the VS Code Ubuntu version to match the GitHub Ubuntu version
FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu-21.04

# Run the build
COPY build.sh /tmp/build.sh
RUN /tmp/build.sh && rm /tmp/build.sh
