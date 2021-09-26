#!/bin/sh -e

BREW="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"

BUILD_ESSENTIAL="build-essential=12.8ubuntu1.1"

curl -fsSL "${BREW}" | /bin/bash

cat > /tmp/shellenv <<EOF

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
EOF

cat /tmp/shellenv >> /etc/bash.bashrc

# shellcheck disable=SC1091
. /tmp/shellenv

apt-get update
apt-get install -y --no-install-recommends "${BUILD_ESSENTIAL}"
rm -rf /var/lib/apt/lists/*

brew install gcc
