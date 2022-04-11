#!/bin/sh -e

# Install man pages without unminimizing image
sed -i -r 's,(path-exclude=/usr/share/man/\*),# \1,' \
    /etc/dpkg/dpkg.cfg.d/excludes
