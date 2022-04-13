#!/bin/sh -ex

DEBIAN_FRONTEND=noninteractive
export DEBIAN_FRONTEND

apt-get update
xargs apt-get install -y --no-install-recommends <dpkg.txt
apt-get clean -y
find /var/lib/apt/lists -mindepth 1 -delete

dpkg -l | grep ii | awk '{print $2" "$3}' > dpkg-lock.txt
