#!/usr/bin/env sh

if [ -z $1 ]; then
    echo "path not specified! eg. abc123/A"
    exit 9
fi

export HERE=`pwd`
TEMPLATEPATH="$HERE/mytemplate/"

cd $1

atcoder-tools submit -u --code ./main.cpp --exec ./a.out
