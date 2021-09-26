#!/bin/sh -e

BREW="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"

# Install Homebrew
curl -fsSL "${BREW}" | /bin/bash

# Set up Homebrew `shellenv` snippet
cat > /tmp/shellenv <<EOF

eval "\$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
EOF

# Copy the `shellenv` snippet to the system environment configuration, so that
# `brew` is on the `PATH` for every user
cat /tmp/shellenv >> /etc/environment

# Source the `shellenv` snippet and then remove
# shellcheck disable=SC1091
. /tmp/shellenv
rm /tmp/shellenv

# Update packages
apt-get update
apt-get dist-upgrade -y

# Install build tools
apt-get install -y --no-install-recommends build-essential
brew install gcc

# Clean up APT
apt-get clean
apt-get auto-remove
rm -rf /var/lib/apt/lists/*

# Clean up Homebrew
brew cleanup -v -s --prune=all
