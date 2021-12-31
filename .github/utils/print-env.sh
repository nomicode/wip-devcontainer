#!/bin/sh -e

key="${1}"

if test -z "${key}"; then
    exit 1
fi

dir() {
    echo "${key}" | sed 's,@,/,'
}

image() {
    echo "${key}" | sed -E 's,@.*,,'
}

tag() {
    echo "${key}" | sed -E 's,.*@,,'
}

context() {
    dir | while read -r path; do
        find src -type d -path "*${path}"
    done
}

cat <<EOF
IMAGE=alpine-$(image)
TAG=$(tag)
CONTEXT=$(context)
EOF
