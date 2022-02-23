#!/usr/bin/env sh

testName=$(cat TARGETCONTEST.txt)
problemNo=$(cat TARGET_PROBLEM.txt)
testPath="${testName}/${problemNo}"


cppFrom="playground/main.cpp"
cppTo="${testPath}/main.cpp"

echo "=== start preparing to submit [$testPath] ==="
echo "copy from : $cppFrom"
echo "copy to   : $cppTo"
cp $cppFrom $cppTo


cd $testPath || exit 9

echo "=== start compile: $testPath ==="
EXECPATH="main.cpp"
/opt/homebrew/Cellar/gcc/11.2.0_3/bin/g++-11 $EXECPATH

echo "=== start test: $testPath ==="
atcoder-tools test
