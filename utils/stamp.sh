#!/bin/sh -e

find src -type f -name 'build.sh' | while read -r file; do
    tmp_file="$(mktemp)"
    head -n -1 "${file}" >"${tmp_file}"
    cat <"${tmp_file}" >"${file}"
    echo "# Stamp: $(date +%s)" >>"${file}"
    chmod 755 "${file}"
    echo "Stamped: ${file}"
done
