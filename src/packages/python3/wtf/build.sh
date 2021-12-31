#!/bin/sh -e

WTF_BIN="wtf"
WTF_URL="https://git.io/vqosc"

curl -fsSL "${WTF_URL}" >"${WTF_BIN}"
chmod 755 "${WTF_BIN}"
mv "${WTF_BIN}" /usr/local/bin

# TODO: `complete -o default -o bashdefault wtf`

# Stamp: 1640938148
