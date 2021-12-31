#!/bin/sh -e

key="${1}"

if test -z "${key}"; then
    exit 1
fi

image() {
    echo "${key}" | sed 's,@.*,,' | sed 's,-,/,g'
}

tag() {
    echo "${key}" | sed -E 's,[^@]+@?,,' | sed -E 's,^$,latest,'
}

context() {
    image | while read -r path; do
        find src -type d -path "*${path}"
    done
}

cat <<EOF
IMAGE=alpine-$(image)
TAG=$(tag)
CONTEXT=$(context)/$(tag)
EOF
