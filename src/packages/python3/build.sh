#!/bin/sh -e

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

# Stamp: 1640939217
