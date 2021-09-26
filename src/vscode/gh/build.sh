#!/bin/sh -e


# Container image build script
# =============================================================================


# Update APT
# -----------------------------------------------------------------------------

# Update packages
apt-get update
apt-get dist-upgrade -y


# Create a user for the GitHub-hosted runner
# -----------------------------------------------------------------------------

localedef -i en_US -f UTF-8 en_US.UTF-8
useradd -m -s /bin/bash runner


# Clean up
# -----------------------------------------------------------------------------

apt-get clean
apt-get auto-remove
rm -rf /var/lib/apt/lists/*
