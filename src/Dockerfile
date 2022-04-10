FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu as base

ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /tmp
COPY Makefile /tmp
RUN --mount=type=secret,id=gh_token \
  export GH_TOKEN="$(cat /run/secrets/gh_token)" && \
  apt-get update && \
  apt-get install -y --no-install-recommends make && \
  make && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /root/.npm && \
  rm -rf /root/.cache

COPY --from=hadolint/hadolint:latest /bin/hadolint /usr/local/bin

COPY --from=lycheeverse/lychee:latest /usr/local/bin/lychee /usr/local/bin

COPY --from=mvdan/shfmt:latest /bin/shfmt /usr/local/bin

COPY --from=mstruebing/editorconfig-checker:latest /usr/bin/ec /usr/local/bin

COPY --from=jdkato/vale:latest /bin/vale /usr/local/bin

# Doesn't work
COPY --from=nickg/misspell:latest /go/bin/misspell /usr/local/bin

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

# FROM base AS pipx

# WORKDIR /tmp
# COPY Makefile /tmp
# RUN make pipx

# -----------------------------------------------------------------------------

# FROM base AS go

# WORKDIR /tmp
# COPY Makefile /tmp
# RUN make go

# -----------------------------------------------------------------------------

# FROM rhysd/fixred as fixred

# -----------------------------------------------------------------------------

# FROM base

# COPY --from=pipx /opt/pipx /opt/pipx
# ENV PATH="/opt/pipx/bin:$PATH"

# COPY --from=go /opt/go /opt/go
# ENV PATH="/opt/go/bin:$PATH"

# COPY --from=fixred /usr/local/bin/fixred /usr/local/bin/fixred

# -----------------------------------------------------------------------------

# COPY bashrc.sh /tmp/bashrc.sh
# RUN cat /tmp/bashrc.sh >>/home/vscode/.bashrc

# -----------------------------------------------------------------------------

# haskel

# https://github.com/smallhadroncollider/brok
# https://github.com/hadolint/hadolint

# -----------------------------------------------------------------------------

# rm -rf /root/.cache
# rm -rf /root/.config
# RUN rm -rf /root/.npm
