#!/usr/bin/env sh

arg=$1

if [ $arg ]; then
    echo "submit process does not require arguments! please remove arguments"
    exit 9
fi

testName=$(cat TARGETCONTEST.txt)
problemNo=$(cat TARGET_PROBLEM.txt)
testPath="${testName}/${problemNo}"

cppFrom="playground/main.cpp"
cppTo="${testPath}/main.cpp"

echo "=== start preparing to submit [$testPath] ==="
echo "copy from : $cppFrom"
echo "copy to   : $cppTo"
cp $cppFrom $cppTo

echo "=== start process to test and submit $testPath ==="


export HERE=`pwd`

cd $testPath

echo "=== start compile $EXECPATH ==="
EXECPATH="main.cpp"
/opt/homebrew/Cellar/gcc/11.2.0_3/bin/g++-11 $EXECPATH

echo "=== start test ==="
atcoder-tools test
testRes=$?
echo "test exited with code $testRes"
if [ $testRes -ne 0 ]; then
    exit $testRes
fi 

echo "=== start submit ==="
atcoder-tools submit -u --code ./main.cpp --exec ./a.out

exit 0
