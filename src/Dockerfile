FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu as base

WORKDIR /tmp
COPY dpkg.txt apt-install.sh /tmp/
RUN /tmp/apt-install.sh

# apt
# linkchecker
# w3c-linkchecker
# linklint
# misspell-fixer
# mwic

# not apt
# brok
# ec
# hadolint
# imgdup2go
# misspell
# vale
# vale-server

# -----------------------------------------------------------------------------

FROM base AS node

WORKDIR /tmp
COPY vendor/nodesource-setup.sh npm-install.sh /tmp/
RUN /tmp/nodesource-setup.sh && \
  /tmp/npm-install.sh && \
  mkdir -p /opt/npm && \
  mv /tmp/node_modules /opt/npm && \
  ln -s /opt/npm/node_modules/.bin /opt/npm/bin

# -----------------------------------------------------------------------------

FROM base

COPY --from=node /opt/npm /opt/npm
ENV PATH="/opt/npm/bin:$PATH"

# -----------------------------------------------------------------------------

# poetry
# shfmt

# -----------------------------------------------------------------------------

# COPY bashrc.sh /tmp/bashrc.sh
# RUN cat /tmp/bashrc.sh >>/home/vscode/.bashrc

# -----------------------------------------------------------------------------

# WTF_BIN="wtf"
# WTF_URL="https://git.io/vqosc"

# curl -fsSL "${WTF_URL}" >"${WTF_BIN}"
# chmod 755 "${WTF_BIN}"
# mv "${WTF_BIN}" /tmp/dist

# TODO: `complete -o default -o bashdefault wtf`

# -----------------------------------------------------------------------------

# LABEL description="npm"
# RUN apk add --no-cache npm
# RUN npm config set fund false --global

# LABEL description="npm@latest"
# RUN npm install --global npm@latest

# LABEL description="strip-ansi-cli"
# RUN  npm install --global --prefer-dedupe strip-ansi-cli

# LABEL description="cspell"
# RUN npm install --global --prefer-dedupe cspell

# LABEL description="prettier"
# RUN npm install --global --prefer-dedupe prettier

# LABEL description="lintspaces-cli"
# RUN npm install --global --prefer-dedupe lintspaces-cli

# LABEL description="dockerfilelint"
# RUN npm install --global --prefer-dedupe dockerfilelint

# LABEL description="markdownlint-cli"
# RUN npm install --global --prefer-dedupe markdownlint-cli

# LABEL description="markdown-link-check"
# RUN npm install --global --prefer-dedupe markdown-link-check

# LABEL description="jscpd"
# RUN npm install --global --prefer-dedupe jscpd

# -----------------------------------------------------------------------------

# Golang
# apk add --no-cache go

# -----------------------------------------------------------------------------

# Rust
# apk add --no-cache cargo

# -----------------------------------------------------------------------------

# Avoid installing Go and compiling from source, which pulls in a lot of
# dependencies and takes a lot of time

# LYCHEE_BIN="lychee"
# LYCHEE_PKG="${LYCHEE_BIN}-v0.8.1-x86_64-unknown-linux-musl"
# LYCHEE_TGZ="${LYCHEE_PKG}.tar.gz"
# LYCHEE_URL="https://git.io/JDvLb"

# curl -fsSL "${LYCHEE_URL}" >"${LYCHEE_TGZ}"
# tar -xzf "${LYCHEE_TGZ}"
# chown root:root "${LYCHEE_BIN}"
# chmod 755 "${LYCHEE_BIN}"
# mv "${LYCHEE_BIN}" /tmp/dist

# TODO: Look into setting GitHub token to avoid getting rate limited
# https://github.com/lycheeverse/lychee#github-token

# -----------------------------------------------------------------------------

# Avoid installing Rust and compiling from source, which pulls in a lot of
# dependencies and takes a lot of time

# MISSPELL_BIN="misspell"
# MISSPELL_PKG="${MISSPELL_BIN}_0.3.4_linux_64bit"
# MISSPELL_TGZ="${MISSPELL_PKG}.tar.gz"
# MISSPELL_URL="https://git.io/JDvms"

# curl -fsSL "${MISSPELL_URL}" >"${MISSPELL_TGZ}"
# tar -xzf "${MISSPELL_TGZ}"
# chown root:root "${MISSPELL_BIN}"
# chmod 755 "${MISSPELL_BIN}"
# mv "${MISSPELL_BIN}" /tmp/dist

# -----------------------------------------------------------------------------

# https://github.com/smallhadroncollider/brok
# editorconfig-checker
# shfmt
# https://github.com/rhysd/fixred
# https://github.com/hadolint/hadolint
# https://github.com/rif/imgdup2go
# https://github.com/client9/misspell
# https://github.com/mvdan/sh#shfmt
# https://github.com/errata-ai/vale

# -----------------------------------------------------------------------------

# rm -rf /root/.cache
# rm -rf /root/.config

# -----------------------------------------------------------------------------

# RUN npm dedupe
# RUN npm prune
# RUN npm cache clean --force
# RUN rm -rf /root/.npm
