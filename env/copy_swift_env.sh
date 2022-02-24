#!/usr/bin/env sh

cp swift-atcodertools.toml ~/.atcodertools.toml

envdir=~/.atcodertools-env/env
rm -rf $envdir
mkdir -p $envdir
touch $envdir/swift
