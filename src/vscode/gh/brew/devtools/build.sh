#!/bin/sh -e


# Container image build script
# =============================================================================


# Setup
# -----------------------------------------------------------------------------

apt-get update
apt-get dist-upgrade -y

# https://formulae.brew.sh/formula/node
brew install node

# Not needed for now
# https://formulae.brew.sh/formula/go
# brew install go


# Install development tools
# -----------------------------------------------------------------------------

# https://formulae.brew.sh/formula/act
brew install act

# https://www.npmjs.com/package/editorconfig
npm install -g editorconfig

# https://formulae.brew.sh/formula/prettier
brew install prettier

# https://formulae.brew.sh/formula/hadolint
brew install hadolint

# https://www.npmjs.com/package/dockerfilelint
npm install -g dockerfilelint

# https://formulae.brew.sh/formula/shellcheck
brew install shellcheck

# https://formulae.brew.sh/formula/checkbashisms
brew install checkbashisms

# https://www.npmjs.com/package/cspell
npm install -g cspell

# https://formulae.brew.sh/formula/markdownlint-cli
brew install markdownlint-cli

# https://github.com/get-woke/woke
brew install get-woke/tap/woke

# https://www.npmjs.com/package/markdown-link-check
npm install -g markdown-link-check


# Clean up
# -----------------------------------------------------------------------------

apt-get clean
apt-get auto-remove
rm -rf /var/lib/apt/lists/*

brew cleanup -v -s --prune=all

# Remove the Homebrew repository to substantially reduce the size of the image.
# As consequence, users of this container will not be able to use the `brew`
# command.
rm -rf "$(brew --repo)"
