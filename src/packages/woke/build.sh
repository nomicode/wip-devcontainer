#!/bin/sh -e

# Avoid installing Rust and compiling from source, which pulls in a lot of
# dependencies and takes a lot of time

WOKE_BIN="woke"
WOKE_PKG="${WOKE_BIN}-0.17.1-linux-amd64"
WOKE_TGZ="${WOKE_PKG}.tar.gz"
WOKE_URL="https://git.io/JDvO1"

curl -fsSL "${WOKE_URL}" >"${WOKE_TGZ}"
tar -xzf "${WOKE_TGZ}"
chmod 755 "${WOKE_PKG}/${WOKE_BIN}"
mv "${WOKE_PKG}/${WOKE_BIN}" /usr/local/bin

# Stamp: 1640936315
