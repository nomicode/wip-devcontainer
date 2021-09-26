# Dockerfile configuration
# https://docs.docker.com/engine/reference/builder/

# Last modified: 2021-09-25 23:10:29

# Available Ubuntu versions:
#
# - https://hub.docker.com/_/microsoft-vscode-devcontainers
# - https://github.com/actions/virtual-environments

# Pin the VS Code version to match the GitHub version
FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu-21.04

# Run the build
COPY build.sh /tmp/build.sh
RUN /tmp/build.sh && rm /tmp/build.sh
