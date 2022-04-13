#!/bin/sh -ex

DEBIAN_FRONTEND=noninteractive
export DEBIAN_FRONTEND

PIPX_HOME=/opt/pipx
export PIPX_HOME

PIPX_BIN_DIR=/opt/pipx/bin
export PIPX_BIN_DIR

USE_EMOJI=false
export USE_EMOJI

apt-get update -q
apt-get install -q -y --no-install-recommends python3-venv pipx
apt-get clean -y
find /var/lib/apt/lists -mindepth 1 -delete

xargs -n 1 pipx install <requirements-pipx.txt

pipx list | grep package | sed 's, *package,,' > pipx-lock.txt
