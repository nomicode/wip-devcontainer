#!/bin/sh -e

# https://github.com/pyenv/pyenv/wiki/Common-build-problems
# https://github.com/pyenv/pyenv/wiki#suggested-build-environment

cd "$(dirname "${0}")"

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

PY_MINOR=3.10

# Install the latest patch version
PY_VERSION="$(
    pyenv install --list |
        grep "${PY_MINOR}" | sort -n | tail -n 1 | xargs
)"

PYTHON_CONFIGURE_OPTS="--enable-shared"
export PYTHON_CONFIGURE_OPTS

pyenv install "${PY_MINOR}-dev"
pyenv install "${PY_VERSION}"
pyenv global "${PY_VERSION}"

pip3 install --upgrade pip

# Stamp: 1640947118
