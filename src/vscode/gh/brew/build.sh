#!/bin/sh -ex

# Container image build script
# =============================================================================

# Install APT dependencies
# -----------------------------------------------------------------------------

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get dist-upgrade -y

apt-get install -y --no-install-recommends build-essential

# Install Homebrew
# -----------------------------------------------------------------------------

BREW="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"

curl -fsSL "${BREW}" > /tmp/install.sh
/bin/bash /tmp/install.sh
rm /tmp/install.sh

cat > /etc/profile.d/02-brew.sh <<EOF
eval "\$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
EOF

# https://github.com/koalaman/shellcheck/wiki/SC1091
# shellcheck disable=SC1091
. /etc/profile.d/02-brew.sh

brew doctor
brew update

brew install gcc

# Clean up
# -----------------------------------------------------------------------------

apt-get clean
apt-get auto-remove
rm -rf /var/lib/apt/lists/*

brew cleanup -v -s --prune=all
