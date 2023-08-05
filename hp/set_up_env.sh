#!/usr/bin/env bash

docker run -itd \
  -p 5555:5566 \
  -v ~/Developer/hp/BPS-Validation/back-end:/project \
  -v ~/.aws:/root/.aws \
  --name test taya87136/node-dev
