#!/bin/sh -e

# Avoid installing Rust and compiling from source, which pulls in a lot of
# dependencies and takes a lot of time

MISSPELL_BIN="misspell"
MISSPELL_PKG="${MISSPELL_BIN}_0.3.4_linux_64bit"
MISSPELL_TGZ="${MISSPELL_PKG}.tar.gz"
MISSPELL_URL="https://git.io/JDvms"

curl -fsSL "${MISSPELL_URL}" >"${MISSPELL_TGZ}"
tar -xzf "${MISSPELL_TGZ}"
chmod 755 "${MISSPELL_BIN}"
mv "${MISSPELL_BIN}" /tmp/dist

# Stamp: 1640961879
