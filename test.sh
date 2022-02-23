#!/usr/bin/env sh

sh env-chk.sh
envCheckRes=$?
echo "env check process exited with code $envCheckRes"
if [ $envCheckRes -ne 0 ]; then
    exit $envCheckRes
fi 

testName=$(cat TARGETCONTEST.txt)
problemNo=$(cat TARGET_PROBLEM.txt)
testPath="${testName}/${problemNo}"

cppFrom="AtcoderWorkspace/main.swift"
cppTo="${testPath}/main.swift"

echo "=== start preparing to submit [$testPath] ==="
echo "copy from : $cppFrom"
echo "copy to   : $cppTo"
cp $cppFrom $cppTo


cd $testPath || exit 9

echo "=== start compile: $testPath ==="
EXECPATH="main.swift"
swiftc $EXECPATH

echo "=== start test: $testPath ==="
atcoder-tools test
