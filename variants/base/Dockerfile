# Dockerfile configuration
# https://docs.docker.com/engine/reference/builder/

# Update timestamp to force a rebuild
# 1632674108503

# Available Ubuntu versions:
#
# - https://hub.docker.com/_/microsoft-vscode-devcontainers
# - https://github.com/actions/virtual-environments

# Pin the VS Code version to match the GitHub version
FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu-21.04

# Run the build
COPY build.sh /tmp/build.sh
RUN /tmp/build.sh && rm /tmp/build.sh
