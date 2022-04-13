#!/bin/sh -e

DEBIAN_FRONTEND=noninteractive
export DEBIAN_FRONTEND

apt-get update
xargs apt-get install -y --no-install-recommends <dpkg.txt
apt-get clean -y
rm -rf /var/lib/apt/lists/*

dpkg -l | grep ii | awk '{print $2" "$3}' > dpkg-lock.txt
