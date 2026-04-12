#!/usr/bin/env bash

main() {
    local input="$1"
    local output=""
    local len=${#input}

    # Loop backwards from the end of the string to the beginning
    for (( i=len-1; i>=0; i-- )); do
        output+="${input:$i:1}"
    done

    echo "$output"
}

main "$@"