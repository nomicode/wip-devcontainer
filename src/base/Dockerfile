# Update timestamp to force a build
# 1634420018192

#  https://git.io/JKRAJ
FROM mcr.microsoft.com/vscode/devcontainers/universal:linux

USER root
WORKDIR /tmp

# https://git.io/JK0eh
ARG GITHUB=https://raw.githubusercontent.com
ARG VSCODE=${GITHUB}/microsoft/vscode-dev-containers/main/script-library

# https://git.io/JKRAa
ENV BREW_PREFIX=/home/linuxbrew/.linuxbrew
ENV PATH=${BREW_PREFIX}/sbin:${BREW_PREFIX}/bin:${PATH}
ARG DEBIAN_FRONTEND=noninteractive
RUN bash -c "$(wget -qO- "${VSCODE}/homebrew-debian.sh")"
