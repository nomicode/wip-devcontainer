#!/bin/bash -e

# TODO: Turn this into a makefile so I can see what's happening during the
# build.
#
# More importantly, I can define targets for individual tags. The targets can
# then specify what they want installed. If I set the dependency chains up
# properly, this will mean an efficient way of building exactly what is needed
# for each specific tag without the need for code duplication or a complex web
# of multiple install scripts.

apk update

# Most of this is needed for building Python packages
apk add --no-cache \
    coreutils \
    gcc \
    libc-dev \
    libxml2 \
    libxml2-dev \
    libxslt \
    libxslt-dev \
    autoconf \
    automake \
    libtool \
    make

apk add --no-cache \
    libffi-dev \
    python3 \
    python3-dev \
    py3-pip \
    black
pip install --upgrade pip
pip install pipx

PIPX_HOME=/usr/local
export PIPX_HOME
pipx install yamllint
pipx install proselint
pipx install snooty
pipx install prospector[with_everything]
pipx install reorder_python_imports
pipx install poetry

apk add --no-cache npm
npm install --global npm@latest
npm install --global --prefer-dedupe \
    editorconfig \
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

# TODO: Can't seem to get remark-lint to work when I install it

# https://github.com/drewbourne/vscode-remark-lint
# https://github.com/remarkjs/remark-validate-links

# remark-cli \
# remark-lint \
# remark-preset-lint-markdown-style-guide \
# remark-stringify \

apk add --no-cache go
mkdir /usr/local/go
go get -u github.com/get-woke/woke
go get -u github.com/client9/misspell/cmd/misspell
go get -u github.com/pksunkara/whitespaces

apk add --no-cache \
    cargo
cargo install --root=/usr/local shellharden

apk add --no-cache \
    ruby \
    tidyhtml \
    github-cli \
    shellcheck \
    shfmt \
    bash-completion
