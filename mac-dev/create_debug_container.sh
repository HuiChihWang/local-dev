CURRENT_DIR=$(pwd)
docker run --name debug-dev-osx -itd \
  -v "$CURRENT_DIR":/project \
  sickcodes/docker-osx
