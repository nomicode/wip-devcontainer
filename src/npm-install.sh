#!/bin/sh -e

npm update
npm install
npm dedupe
npm cache clean --force
