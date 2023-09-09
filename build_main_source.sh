#!/usr/bin/env sh

swift build -Xswiftc -O -Xlinker -lm -c release
