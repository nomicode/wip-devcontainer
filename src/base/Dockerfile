FROM mcr.microsoft.com/vscode/devcontainers/base:alpine

RUN groupadd docker && \
    usermod -aG docker root && \
    useradd --create-home runner && \
    usermod -aG docker runner && \
    apk update && \
    apk upgrade && \
    apk add --no-cache \
      bash \
      git

# Timestamp: 1640405331
