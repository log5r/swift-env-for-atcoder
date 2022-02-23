#!/usr/bin/env sh

sh env-chk.sh
envCheckRes=$?
echo "env check process exited with code $envCheckRes"
if [ $envCheckRes -ne 0 ]; then
    exit $envCheckRes
fi 


arg=$1

if [ $arg ]; then
    echo "submit process does not require arguments! please remove arguments"
    exit 9
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

echo "=== start process to test and submit $testPath ==="


export HERE=`pwd`

cd $testPath

echo "=== start compile $EXECPATH ==="
EXECPATH="main.swift"
swiftc $EXECPATH

echo "=== start test ==="
atcoder-tools test
testRes=$?
echo "test exited with code $testRes"
if [ $testRes -ne 0 ]; then
    exit $testRes
fi 

echo "=== start submit ==="
atcoder-tools submit -u --code ./main.swift

exit 0
