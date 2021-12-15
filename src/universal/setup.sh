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
    moreutils \
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
    python3 \
    python3-dev \
    py3-pip

# -----------------------------------------------------------------------------

# echo "Setting up pyenv..."
# curl -fsSL https://pyenv.run | bash

# # Reserved for Python specific images
# # pyenv install 3.7.12
# # pyenv install 3.8.12
# pyenv install 3.9.9
# pyenv global 3.9.9

(
    pip install --upgrade pip
    pip install pipx
) 2>&1 | grep -v "WARNING: Running pip as the 'root' user"

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
# TODO: Adding `--no-audit` prevents these commands from printing information
# about which packages are installed
echo "Installing Node packages..."
npm install --global --no-audit npm@latest
npm install --global --no-audit --prefer-dedupe \
    cspell \
    prettier \
    lintspaces \
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

# Avoid installing Go and compiling from source, which pulls in a lot of
# dependencies and takes a lot of time

WOKE_PKG="woke-0.17.1-linux-amd64"
WOKE_TGZ="${WOKE_PKG}.tar.gz"
WOKE_URL="https://git.io/JDvO1"
echo "Downloading ${WOKE_TGZ}..."
curl -fsSL "${WOKE_URL}" > "${WOKE_TGZ}"
echo "Installing ${WOKE_PKG}..."
tar -xzf "${WOKE_TGZ}"
chmod 755 "${WOKE_PKG}/woke"
mv "${WOKE_PKG}/woke" /usr/local/bin

MISSPELL_PKG="misspell_0.3.4_linux_64bit"
MISSPELL_TGZ="${MISSPELL_PKG}.tar.gz"
MISSPELL_URL="https://git.io/JDvms"
echo "Downloading ${MISSPELL_TGZ}..."
curl -fsSL "${MISSPELL_URL}" > "${MISSPELL_TGZ}"
echo "Installing ${MISSPELL_PKG}..."
tar -xzf "${MISSPELL_TGZ}"
chmod 755 misspell
mv misspell /usr/local/bin

# -----------------------------------------------------------------------------

# Avoid installing Rust and compiling from source, which pulls in a lot of
# dependencies and takes a lot of time

LYCHEE_PKG="lychee-v0.8.1-x86_64-unknown-linux-musl"
LYCHEE_TGZ="${LYCHEE_PKG}.tar.gz"
LYCHEE_URL="https://git.io/JDvLb"
echo "Downloading ${LYCHEE_TGZ}..."
curl -fsSL "${LYCHEE_URL}" > "${LYCHEE_TGZ}"
echo "Installing ${LYCHEE_PKG}..."
tar -xzf "${LYCHEE_TGZ}"
chmod 755 lychee
mv lychee /usr/local/bin

# TODO: Look into setting GitHub token to avoid getting rate limited
# https://github.com/lycheeverse/lychee#github-token

# -----------------------------------------------------------------------------

rm -rf /var/cache/apk/*

rm -rf /root/.cache
rm -rf /root/.config
rm -rf /root/.npm
