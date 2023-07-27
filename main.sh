#!/bin/bash
set -e

if [[ $RUNNER_OS == Windows ]]; then
  old_script_shell=$(npm config get script-shell)
  npm config set script-shell 'C:\Program Files\git\bin\bash.exe'
  npm install --global "code-server@$INPUT_VERSION" --unsafe-perm
  npm config set script-shell "$old_script_shell"
else
  curl -fsSL https://code-server.dev/install.sh | sh -s -- \
    --prefix=/usr/local --version "$INPUT_VERSION"
fi
