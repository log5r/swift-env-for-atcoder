#!/usr/bin/env sh

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

cppFrom="${testPath}/main.cpp"
cppTo="playground/main.cpp"

echo "=== start copy [$testPath] to playground ==="
echo "copy from : $cppFrom"
echo "copy to   : $cppTo"
cp $cppFrom $cppTo

exit 0
