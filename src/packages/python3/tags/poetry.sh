#!/bin/sh -e

apk add --no-cache \
    g++ \
    libffi-dev

PACKAGE="poetry"

pip3 install --verbose pipenv

pipenv install \
    pyinstaller \
    "${PACKAGE}"

venv="$(pipenv --venv)"

pipenv run pyscripts "${PACKAGE}" |
    while read -r script; do
        file="$(pipenv run which "${script}")"
        pipenv run \
            pyinstaller --onefile --strip --path "${venv}" "${file}"
    done

# Stamp: 1640947118
