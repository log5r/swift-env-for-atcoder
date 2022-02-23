#!/usr/bin/env sh

sh env-chk.sh
envCheckRes=$?
echo "env check process exited with code $envCheckRes"
if [ $envCheckRes -ne 0 ]; then
    exit $envCheckRes
fi 


arg=$1

if [ -z $arg ]; then
    echo "problem name not specified! eg. A / a"
    exit 9
fi
echo "=== change current problem [$arg] ==="
echo "${arg}" > TARGET_PROBLEM.txt
