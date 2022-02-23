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

testName=$(cat TARGETCONTEST.txt)
problemNo=$(cat TARGET_PROBLEM.txt)
testPath="${testName}/${problemNo}"

cppFrom="${testPath}/main.swift"
cppTo="AtcoderWorkspace/main.swift"

echo "=== start copy [$testPath] to playground ==="
echo "copy from : $cppFrom"
echo "copy to   : $cppTo"
cp $cppFrom $cppTo

exit 0
