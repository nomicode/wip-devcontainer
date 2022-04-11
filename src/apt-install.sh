#!/bin/sh -e

apt-get update
dpkg --set-selections <dselect.txt
apt-get dselect-upgrade
apt-get clean -y
rm -rf /var/lib/apt/lists/*
