#!/usr/bin/env sh

arg=$1

if [ -z $arg ]; then
    echo "problem name not specified! eg. A / a"
    exit 9
fi
echo "=== change current problem [$arg] ==="
echo "${arg}" > TARGET_PROBLEM.txt
