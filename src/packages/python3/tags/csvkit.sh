#!/bin/sh -e

pip3 install --verbose pipenv

pipenv install \
    pyinstaller \
    csvkit

venv="$(pipenv --venv)"

pipenv run pyscripts csvkit | while read -r script; do
    file="$(pipenv run which "${script}")"
    pipenv run \
        pyinstaller --onefile --strip --path "${venv}" "${file}"
done

# pip3 install --verbose csvkit

# pyscripts csvkit

# Stamp: 1640947118
