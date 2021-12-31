#!/bin/sh

print_keys() {
    find src -type f -name 'filter.yaml' |
        while read -r filter; do
            grep -E ':$' <"${filter}" |
                while read -r line; do
                    echo "${line}" | sed 's/:$//'
                done
        done
}

has_unset_var() {
    grep "=$" <"${tmpfile}"
}

test_key() {
    repository="${1}"
    key="${2}"
    tmpfile="$(mktemp)"
    .github/utils/print-env.sh "${repository}" "${key}" |
        sed 's/^/  /' >"${tmpfile}"
    if has_unset_var; then
        printf "\e[31;1m%s\e[0;0m\n" "${key}"
    else
        printf "\e[32;1m%s\e[0;0m\n" "${key}"
    fi
    cat "${tmpfile}"
    rm -f "${tmpfile}"
}

print_seperator() {
    if test -z "${looped}"; then
        looped="true"
    else
        echo
    fi
}

looped=""
print_keys | while read -r key; do
    print_seperator
    test_key "owner/project" "${key}"
done
