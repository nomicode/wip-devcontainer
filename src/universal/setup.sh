#!/bin/sh -e

# TODO: Turn this into a makefile so I can see what's happening during the
# build.
#
# More importantly, I can define targets for individual tags. The targets can
# then specify what they want installed. If I set the dependency chains up
# properly, this will mean an efficient way of building exactly what is needed
# for each specific tag without the need for code duplication or a complex web
# of multiple install scripts.

usermod --shell /bin/bash root

# Temporary hack to force the `root` user to pick up environment variables set
# by the Dockerfile when the container is crated. Funnily enough, the
# environment variables set in the Dockerfile are picked up during image
# creation.
#
# TODO: Figure out why the `root` user does not pick up these environment
# variables
cat >> ~/.bashrc <<EOF

set -a
. /etc/environment >> ~/.bashrc
set +a
EOF

# I thought this would fix it, but it doesnt
apk add --no-cache linux-pam

# Or perhaps:
# echo "Defaults env_keep += \"PATH\"" > /etc/sudoers.d/env
# Run `cat /etc/sudoers.d/vscode` for more info
# https://askubuntu.com/questions/161924
# https://stackoverflow.com/questions/66687881
# https://www.thegeekdiary.com/user-environment-variables-with-su-and-sudo-in-linux/
# https://superuser.com/questions/636283
# https://superuser.com/questions/232231
# https://unix.stackexchange.com/questions/8646
# https://unix.stackexchange.com/questions/292815
# https://askubuntu.com/questions/554970
# https://askubuntu.com/questions/1134889

# -----------------------------------------------------------------------------

apk update
apk upgrade

apk add --no-cache \
    tidyhtml \
    github-cli \
    shellcheck \
    shfmt \
    editorconfig-checker \
    htop \
    ncdu \
    make \
    file \
    util-linux \
    diffutils \
    bash-completion \

# TODO: pandoc install fails for some reason
# TODO: prettier install fails for some reason

# -----------------------------------------------------------------------------

apk add --no-cache \
    gcc \
    g++ \
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
pipx install csvkit
pipx install poetry

# TODO: `pipx completions`

# -----------------------------------------------------------------------------

apk add --no-cache npm
npm config set fund false --global
npm install --global npm@latest
npm install --global --prefer-dedupe \
    cspell \
    prettier \
    dockerfilelint \
    markdownlint-cli \
    stylelint \
    stylelint-config-standard \
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

apk add --no-cache go

go install github.com/get-woke/woke@latest
go install github.com/client9/misspell/cmd/misspell@latest
go install github.com/pksunkara/whitespaces@latest

# -----------------------------------------------------------------------------

apk add --no-cache cargo

# https://github.com/lycheeverse/lychee
# TODO: Compiling this from source pulls in a LOT of dependencies. Perhaps it
# would be better to install a pre-compiled binary?
cargo install --no-default-features lychee

# TODO: Clean up rust source files and other caches?

# TODO: Look into setting GitHub token to avoid getting rate limited
# https://github.com/lycheeverse/lychee#github-token

# -----------------------------------------------------------------------------

rm -rf /var/cache/apk/*

rm -rf /root/.cache
rm -rf /root/.config
rm -rf /root/.npm
