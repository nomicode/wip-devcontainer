FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu as base

WORKDIR /tmp
COPY Makefile /tmp
RUN make apt npm

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

FROM base AS pipx

WORKDIR /tmp
COPY Makefile /tmp
RUN make pipx

# -----------------------------------------------------------------------------

FROM base AS go

WORKDIR /tmp
COPY Makefile /tmp
RUN make go

# -----------------------------------------------------------------------------

FROM base

COPY --from=pipx /opt/pipx /opt/pipx
ENV PATH="/opt/pipx/bin:$PATH"

COPY --from=go /opt/go /opt/go
ENV PATH="/opt/go/bin:$PATH"

# -----------------------------------------------------------------------------

# COPY bashrc.sh /tmp/bashrc.sh
# RUN cat /tmp/bashrc.sh >>/home/vscode/.bashrc

# -----------------------------------------------------------------------------

# Rust

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

# https://github.com/rhysd/fixred

# -----------------------------------------------------------------------------

# haskel

# https://github.com/smallhadroncollider/brok
# https://github.com/hadolint/hadolint

# -----------------------------------------------------------------------------

# rm -rf /root/.cache
# rm -rf /root/.config
# RUN rm -rf /root/.npm
