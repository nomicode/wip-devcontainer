#!/bin/sh -e

# TODO: Turn this into a makefile so I can see what's happening during the
# build.
#
# More importantly, I can define targets for individual tags. The targets can
# then specify what they want installed. If I set the dependency chains up
# properly, this will mean an efficient way of building exactly what is needed
# for each specific tag without the need for code duplication or a complex web
# of multiple install scripts.

apk update
apk upgrade

apk add --no-cache \
    tidyhtml \
    github-cli \
    shellcheck \
    shfmt \
    htop \
    ncdu \
    make \
    file \
    bash-completion \

# -----------------------------------------------------------------------------

apk add --no-cache \
    gcc \
    libc-dev \
    libxml2 \
    libxml2-dev \
    libxslt \
    libxslt-dev \
    libffi-dev \
    libtool \
    bzip2-dev \
    readline-dev \
    openssl-dev \
    sqlite-dev \
    autoconf \
    automake \
    python3-dev \
    go

# -----------------------------------------------------------------------------

curl https://pyenv.run | bash

# Reserved for Python specific images
# pyenv install 3.7.12
# pyenv install 3.8.12
pyenv install 3.9.9
pyenv global 3.9.9

pip install --upgrade pip
pip install pipx

pipx install yamllint
pipx install proselint
pipx install snooty
pipx install prospector[with_everything]
pipx install reorder_python_imports
pipx install poetry

# -----------------------------------------------------------------------------

apk add --no-cache npm
npm config set fund false --global
npm install --global npm@latest
npm install --global --prefer-dedupe \
    cspell \
    prettier \
    dockerfilelint \
    markdownlint-cli \
    markdown-link-check \
    stylelint \
    stylelint-config-standard \
    pandoc \
    jscpd \
    snyk

# -----------------------------------------------------------------------------

# TODO: Can't seem to get remark-lint to work when I install it

# https://github.com/drewbourne/vscode-remark-lint
# https://github.com/remarkjs/remark-validate-links

# remark-cli \
# remark-lint \
# remark-preset-lint-markdown-style-guide \
# remark-stringify \

# -----------------------------------------------------------------------------

# mkdir "${GOPATH}"
go get -u gitlab.com/greut/eclint/cmd/eclint
go get -u github.com/get-woke/woke
go get -u github.com/client9/misspell/cmd/misspell
go get -u github.com/pksunkara/whitespaces

# -----------------------------------------------------------------------------

rm -rf /var/cache/apk/*

rm -rf /root/.cache
rm -rf /root/.config
rm -rf /root/.npm
