#!/usr/bin/env sh

testName=$(cat TARGETCONTEST.txt)

testPath="${testName}"

atcoder-tools gen --lang cpp --template mytemplate/default_template.cpp "$testPath"

# A問題はもうコピーしてしまう
echo "A" > TARGET_PROBLEM.txt
sh asd.sh a
