#!/bin/bash
set -ex

if [[ $RUNNER_OS == Windows ]]; then
  export FORCE_NODE_VERSION=1
  old_script_shell=$(npm config get script-shell)
  npm config set script-shell 'C:\Program Files\Git\bin\bash.exe'
  npm install --global "code-server@$INPUT_CODE_SERVER_VERSION" --unsafe-perm
  npm config set script-shell "$old_script_shell"
else
  if [[ $INPUT_CODE_SERVER_VERSION == latest ]]; then
    curl -fsSL https://code-server.dev/install.sh | sh -s -- \
      --prefix=/usr/local
  else
    curl -fsSL https://code-server.dev/install.sh | sh -s -- \
      --prefix=/usr/local --version "$INPUT_CODE_SERVER_VERSION"
  fi
fi
