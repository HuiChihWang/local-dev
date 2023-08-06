#!/bin/zsh

CURRENT_DIR=$(pwd)
docker run --name debug-dev-osx -it \
  -v "$CURRENT_DIR":/app \
  taya87136/test-mac-dev
