#!/bin/ash -ex
# shellcheck shell=dash

# TODO: Turn this into a makefile so I can see what's happening during the
# build

apk update

apk add --no-cache \
    libffi-dev \
    python3 \
    python3-dev \
    py3-pip \
    black
pip install --upgrade pip
pip install pipx

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
    jscpd \
    snyk

# TODO: Can't seem to get remark-lint to work when I install it

# https://github.com/drewbourne/vscode-remark-lint
# https://github.com/remarkjs/remark-validate-links

    # remark-cli \
    # remark-lint \
    # remark-preset-lint-markdown-style-guide \
    # remark-stringify \

echo "${PATH}"
echo "${GOPATH}"

apk add --no-cache go
mkdir /usr/local/go
go get -u github.com/get-woke/woke
go get -u github.com/client9/misspell/cmd/misspell

apk add --no-cache \
    ruby \
    tidyhtml \
    github-cli \
    shellcheck \
    bash-completion
