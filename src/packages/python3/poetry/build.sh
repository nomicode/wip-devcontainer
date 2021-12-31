#!/bin/sh -e

apk add --no-cache \
    g++ \
    libffi-dev

pip3 install --verbose "poetry"

# Stamp: 1640939217
