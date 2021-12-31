#!/bin/sh -e

# Avoid installing Rust and compiling from source, which pulls in a lot of
# dependencies and takes a lot of time

LYCHEE_BIN="lychee"
LYCHEE_PKG="${LYCHEE_BIN}-v0.8.1-x86_64-unknown-linux-musl"
LYCHEE_TGZ="${LYCHEE_PKG}.tar.gz"
LYCHEE_URL="https://git.io/JDvLb"

curl -fsSL "${LYCHEE_URL}" >"${LYCHEE_TGZ}"
tar -xzf "${LYCHEE_TGZ}"
chmod 755 "${LYCHEE_BIN}"
mv "${LYCHEE_BIN}" /usr/local/bin

# TODO: Look into setting GitHub token to avoid getting rate limited
# https://github.com/lycheeverse/lychee#github-token

# Stamp: 1640939217
