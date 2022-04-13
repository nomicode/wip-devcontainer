#!/bin/sh -e

DEBIAN_FRONTEND=noninteractive
export DEBIAN_FRONTEND

apt-get update
apt-get install -y --no-install-recommends nodejs
apt-get clean -y
rm -rf /var/lib/apt/lists/*

npm update
npm install
npm dedupe
npm cache clean --force
