#!/bin/env bash
export AWS_PROFILE=vcosmos

CURRENT_DIR=$(readlink -f "$(dirname "$0")")

SshCommand=$(node "$CURRENT_DIR"/query-ssh-tunnel.js)
echo "$SshCommand"
$SshCommand

unset AWS_PROFILE
