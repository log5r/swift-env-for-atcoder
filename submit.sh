#!/usr/bin/env sh

sh env-chk.sh
envCheckRes=$?
echo "env check process exited with code $envCheckRes"
if [ $envCheckRes -ne 0 ]; then
    exit $envCheckRes
fi 


if [ -z $1 ]; then
    echo "path not specified! eg. abc123/A"
    exit 9
fi

export HERE=`pwd`
TEMPLATEPATH="$HERE/mytemplate/"

cd $1

atcoder-tools submit -u --code ./main.cpp --exec ./a.out
