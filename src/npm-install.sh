#!/bin/sh -ex

npm update
npm install
npm dedupe
npm cache clean --force
