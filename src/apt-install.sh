#!/bin/sh -ex

NODESOURCE_SETUP=https://deb.nodesource.com/setup_current.x

DEBIAN_FRONTEND=noninteractive
export DEBIAN_FRONTEND

# Runs `apt-get update` for us
curl -sSL "${NODESOURCE_SETUP}" | bash -

xargs apt-get install -qq -y --no-install-recommends >/dev/null <dpkg.txt
apt-get clean -y
find /var/lib/apt/lists -mindepth 1 -delete
