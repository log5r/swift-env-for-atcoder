#!/usr/bin/env sh

ACT_TOML_FILE="$(pwd)/env/swift-atcodertools.toml"
sed -i '' "s|YOUR_WORKSPACE_DIR|$(pwd)|g" $ACT_TOML_FILE
sh env/copy_swift_env.sh
