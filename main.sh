#!/bin/bash
set -ex

if [[ $RUNNER_OS == Windows ]]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
  old_node_version=$(node --version)
  old_node_version=${old_node_version:1}
  nvm install 16
  nvm use 16
  old_script_shell=$(npm config get script-shell)
  # https://github.com/actions/runner-images/blob/main/images/win/Windows2022-Readme.md#shells
  npm config set script-shell 'C:\Windows\System32\bash.exe'
  npm install --global "code-server@$INPUT_CODE_SERVER_VERSION" --unsafe-perm
  npm config set script-shell "$old_script_shell"
  nvm use "$old_node_version"
else
  if [[ $INPUT_CODE_SERVER_VERSION == latest ]]; then
    curl -fsSL https://code-server.dev/install.sh | sh -s -- \
      --prefix=/usr/local
  else
    curl -fsSL https://code-server.dev/install.sh | sh -s -- \
      --prefix=/usr/local --version "$INPUT_CODE_SERVER_VERSION"
  fi
fi
