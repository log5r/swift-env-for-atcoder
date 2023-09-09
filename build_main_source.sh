#!/usr/bin/env sh

rm -rf ./.build/release/main
swift build -Xswiftc -O -Xlinker -lm -c release
