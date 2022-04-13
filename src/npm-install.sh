#!/bin/sh -ex

npm update
npm install
npm dedupe
npm cache clean --force

mkdir -p /opt/npm
mv /tmp/node_modules /opt/npm
ln -s /opt/npm/node_modules/.bin /opt/npm/bin
