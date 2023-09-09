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

echo "=== start compile: $testPath ==="
sh build_main_source.sh
cp "./.build/release/main" "$testPath/main"

# process at problem directory
cd $testPath || exit 9

echo "=== start test: $testPath ==="
atcoder-tools test -e "./main"
