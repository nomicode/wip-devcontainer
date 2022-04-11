#!/bin/sh -e

apt-get update
xargs apt-get install -y --no-install-recommends <dpkg.txt
apt-get clean -y
dpkg -l | grep ii | awk '{print $2" "$3}' > dpkg-lock.txt
rm -rf /var/lib/apt/lists/*
