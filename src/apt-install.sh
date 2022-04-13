#!/bin/sh -ex

NODESOURCE_SETUP=https://deb.nodesource.com/setup_current.x

DEBIAN_FRONTEND=noninteractive
export DEBIAN_FRONTEND

# Runs `apt-get update` for us
curl -sSL "$(NODESOURCE_SETUP)" | bash -

xargs apt-get install -q -y --no-install-recommends <dpkg.txt
apt-get clean -y
find /var/lib/apt/lists -mindepth 1 -delete

dpkg -l | grep ii | awk '{print $2" "$3}' > dpkg-lock.txt
