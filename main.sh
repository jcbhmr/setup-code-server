#!/bin/bash
set -e

if [[ $RUNNER_OS == Windows ]]; then
  npm install --global "code-server@$INPUT_VERSION" --unsafe-perm
else
  curl -fsSL https://code-server.dev/install.sh | sh -s -- \
    --prefix=/usr/local --version "$INPUT_VERSION"
fi
