#!/usr/bin/env sh

if [ ! -e "$HOME/.atcodertools-env/env/swift" ]; then
    echo "ERROR: atcoder workspace env is not Swift!"
    exit 9
fi
exit 0
