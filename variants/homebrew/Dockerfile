# Dockerfile configuration
# https://docs.docker.com/engine/reference/builder/

# Last modified: 2021-09-25 23:37:18

FROM ghcr.io/bottle-garden/github-devcontainer/base:main

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
# hadolint ignore=SC2016
RUN curl -fsSL \
  https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | \
  /bin/bash && \
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> \
  /etc/profile && \
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" && \
  apt-get update && \
  apt-get install -y --no-install-recommends build-essential=12.8ubuntu1.1 && \
  rm -rf /var/lib/apt/lists/* && \
  brew install gcc
