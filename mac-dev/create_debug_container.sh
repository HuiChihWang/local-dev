#!/bin/sh

CURRENT_DIR=$(dirname "$(readlink -f "$0")")
CONTAINER_NAME="debug-dev-osx"
IMAGE_NAME="taya87136/test-mac-dev"
DOCKERFILE_PATH="$CURRENT_DIR/Dockerfile"

echo "Working directory: $CURRENT_DIR"

docker rm -f $CONTAINER_NAME

echo "Building image $IMAGE_NAME from $DOCKERFILE_PATH"
docker build -t $IMAGE_NAME $CURRENT_DIR

echo "Running container $CONTAINER_NAME"
docker run --name debug-dev-osx -it -v "$CURRENT_DIR":/app $IMAGE_NAME
