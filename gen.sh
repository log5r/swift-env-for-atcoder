#!/usr/bin/env sh

sh env-chk.sh
envCheckRes=$?
echo "env check process exited with code $envCheckRes"
if [ $envCheckRes -ne 0 ]; then
    exit $envCheckRes
fi 


testName=$(cat TARGETCONTEST.txt)

testPath="${testName}"

atcoder-tools gen --lang swift --template mytemplate/default_template.swift "$testPath"

# A問題はもうコピーしてしまう
echo "A" > TARGET_PROBLEM.txt
sh asd.sh a
