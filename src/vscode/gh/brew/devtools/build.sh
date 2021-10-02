#!/bin/sh -ex

# Container image build script
# =============================================================================

# Setup
# -----------------------------------------------------------------------------

# Manually put `brew` on the `PATH`
cat /etc/profile.d/02-brew.sh

# https://github.com/koalaman/shellcheck/wiki/SC1091
# shellcheck disable=SC1091
. /etc/profile

# Update APT
# -----------------------------------------------------------------------------

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get dist-upgrade -y

# Install additional package managers
# -----------------------------------------------------------------------------

# https://nodejs.org/en/
# https://formulae.brew.sh/formula/node
brew install node

# Not needed for now
# https://golang.org/
# https://formulae.brew.sh/formula/go
# brew install go

# Install development tools
# -----------------------------------------------------------------------------

# Git
# '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

# https://github.com/cli/cli
# https://formulae.brew.sh/formula/gh
brew install gh

# https://github.com/nektos/act
# https://formulae.brew.sh/formula/act
brew install act

# Formatting
# '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

# https://editorconfig.org/
# https://github.com/editorconfig/editorconfig-core-js
# https://www.npmjs.com/package/editorconfig
npm install -g editorconfig

# https://prettier.io/
# https://github.com/prettier/prettier
# https://formulae.brew.sh/formula/prettier
brew install prettier

# Docker
# '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

# https://github.com/hadolint/hadolint
# https://formulae.brew.sh/formula/hadolint
brew install hadolint

# https://github.com/replicatedhq/dockerfilelint
# https://www.npmjs.com/package/dockerfilelint
npm install -g dockerfilelint

# Shell scripts
# '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

# https://www.shellcheck.net/
# https://github.com/koalaman/shellcheck
# https://formulae.brew.sh/formula/shellcheck
brew install shellcheck

# https://sourceforge.net/projects/checkbaskisms/
# https://formulae.brew.sh/formula/checkbashisms
brew install checkbashisms

# Markdown
# '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

# https://github.com/DavidAnson/markdownlint
# https://github.com/igorshubovych/markdownlint-cli
# https://formulae.brew.sh/formula/markdownlint-cli
brew install markdownlint-cli

# https://github.com/tcort/markdown-link-check
# https://www.npmjs.com/package/markdown-link-check
npm install -g markdown-link-check

# Natural language
# '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

# https://streetsidesoftware.github.io/cspell/
# https://github.com/streetsidesoftware/cspell
# https://www.npmjs.com/package/cspell
npm install -g cspell

# https://getwoke.tech/
# https://github.com/get-woke/woke
brew install get-woke/tap/woke

# Clean up
# -----------------------------------------------------------------------------

apt-get clean
apt-get auto-remove
rm -rf /var/lib/apt/lists/*

brew cleanup -v -s --prune=all

# TODO:

# Move this step to a separate container variant OR move it to a different tag
# (e.g., `minified`). Perhaps normal version could be used for VS Code, and the
# `lite` version could be used for GitHub Actions?

# Remove the Homebrew repository to substantially reduce the size of the image.
# As consequence, users of this container will not be able to use the `brew`
# command.
# rm -rf "$(brew --repo)"
