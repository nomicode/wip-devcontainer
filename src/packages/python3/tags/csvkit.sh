#!/bin/sh -e

pip3 install --verbose pipenv

pipenv install \
    pyinstaller \
    csvkit

# venv="$(pipenv --venv)"

pipenv run pyscripts csvkit

# pipenv run \
#    pyinstaller --onefile --strip --path "${venv}" "${yamllint}"

# pip3 install --verbose csvkit

pyscripts csvkit

# Stamp: 1640947118
