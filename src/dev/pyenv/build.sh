#!/bin/sh -e

# https://github.com/pyenv/pyenv/wiki/Common-build-problems
# https://github.com/pyenv/pyenv/wiki#suggested-build-environment

apk add --no-cache \
    linux-headers \
    libffi-dev \
    openssl-dev \
    bzip2-dev \
    zlib-dev \
    readline-dev \
    sqlite-dev \
    bash

curl -fsSL https://pyenv.run | bash

# Stamp: 1640935557
