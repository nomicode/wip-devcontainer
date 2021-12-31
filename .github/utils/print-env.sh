#!/bin/sh -e

repository="${1}"
key="${3}"

if test -z "${key}"; then
    exit 1
fi

project() {
    echo "${repository}" | cut -d/ -f2
}

dir() {
    echo "${key}" | sed 's,@,/,'
}

image() {
    echo "${key}" | cut -d/ -f1
}

tag() {
    echo "${key}" | cut -d/ -f2
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
