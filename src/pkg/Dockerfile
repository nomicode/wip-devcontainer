FROM mcr.microsoft.com/vscode/devcontainers/base:alpine as build

RUN groupadd docker && \
    usermod -aG docker root && \
    useradd --create-home runner && \
    usermod -aG docker runner && \
    apk update && \
    apk upgrade && \
    apk add --no-cache \
      bash \
      git

FROM scratch
COPY --from=build / /

# Timestamp: 1640390615
