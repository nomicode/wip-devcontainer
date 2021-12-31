#!/bin/sh -e

apk update
apk upgrade

apk add --no-cache \
    alpine-sdk

# Stamp: 1640935675
