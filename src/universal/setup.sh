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
    snyk

echo "${PATH}"
echo "${GOPATH}"

apk add --no-cache go
mkdir /usr/local/go
go get -u github.com/get-woke/woke

apk add --no-cache \
    ruby \
    github-cli \
    shellcheck \
    bash-completion
