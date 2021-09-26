# Dockerfile configuration
# https://docs.docker.com/engine/reference/builder/

# Update timestamp to force a rebuild
# 1632701510513

FROM ghcr.io/bottle-garden/vscode/gh/brew:main

COPY build.sh /tmp/build.sh
# Bash needs to run as a login shell so it sources /etc/bash.bashrc which puts
# `brew` on the `PATH`. Docker runs all commands using `/bin/sh`, so it
# necessary to pipe the contents of this script to a bash login shell.
RUN cat /tmp/build.sh | bash --login
