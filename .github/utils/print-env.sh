#!/bin/sh -e

repository="${1}"
key="${2}"

if test -z "${repository}" -o -z "${key}"; then
    exit 1
fi

project() {
    echo "${repository}" | cut -d/ -f2
}

dir() {
    echo "${key}" | sed 's,@,/,'
}

component() {
    echo "${key}" | cut -d@ -f1
}

tag() {
    echo "${key}" | cut -d@ -f2
}

context() {
    find src -type d -path "*/$(component)/*" -path "*/$(tag)"
}

cat <<EOF
IMAGE=$(project)-$(component)
TAG=$(tag)
CONTEXT=$(context)
EOF
