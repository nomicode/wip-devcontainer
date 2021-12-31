#!/bin/sh -e

cd /tmp

pip3 install --verbose pipenv

pipenv install \
    pyinstaller \
    yamllint

venv="$(pipenv --venv)"
yamllint="$(pipenv run which yamllint)"

pipenv run \
    pyinstaller --onefile --strip --path "${venv}" "${yamllint}"

# Stamp: 1640947118
