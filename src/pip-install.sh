#!/bin/sh -ex

DEBIAN_FRONTEND=noninteractive
export DEBIAN_FRONTEND

apt-get update
apt-get install -y --no-install-recommends python3-venv
apt-get clean -y
find /var/lib/apt/lists -mindepth 1 -delete

python3 -m venv /opt/pip
/opt/pip/bin/pip install -r requirements.txt
