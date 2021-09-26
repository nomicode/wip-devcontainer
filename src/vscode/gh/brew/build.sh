#!/bin/sh -e


# Install dependencies
# -----------------------------------------------------------------------------

apt-get update
apt-get dist-upgrade -y

apt-get install -y --no-install-recommends build-essential

apt-get clean
apt-get auto-remove
rm -rf /var/lib/apt/lists/*


# Install Homebrew
# -----------------------------------------------------------------------------

BREW="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"

set -eo pipefail

curl -fsSL "${BREW}" | /bin/bash 

cat > /tmp/shellenv <<EOF

eval "\$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
EOF

cat /tmp/shellenv >> /home/.profile
. /tmp/shellenv 
rm /tmp/shellenv 

brew doctor
brew update
brew install gcc
brew cleanup -v -s --prune=all
