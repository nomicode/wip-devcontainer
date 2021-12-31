#!/bin/sh -e

groupadd docker
usermod -aG docker root
useradd --create-home runner
usermod -aG docker runner

apk update
apk upgrade

apk add --no-cache \
    bash

# Stamp: 1640933730
