#!/usr/bin/env sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cp "$SCRIPT_DIR/swift-atcodertools.toml" ~/.atcodertools.toml

envdir=~/.atcodertools-env/env
rm -rf $envdir
mkdir -p $envdir
touch $envdir/swift
