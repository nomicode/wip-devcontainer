#!/bin/sh -e

repository="${1}"
tag="${2}"

if test -z "${repository}" -o -z "${tag}"; then
    exit 1
fi

project() {
    echo "${repository}" | cut -d/ -f2
}

context() {
    find src -type f -name "${tag}.sh" -print0 |
        xargs -0 dirname | xargs dirname
}

dir() {
    context | cut -d/ -f2
}

cat <<EOF
IMAGE=$(project)-$(dir)
CONTEXT=$(context)
EOF
