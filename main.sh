#!/bin/bash
set -ex

if [[ $RUNNER_OS == Windows ]]; then
  echo "There is no official way to run code-server on Windows. Try using "
  echo "'runs-on: ubuntu-latest' if you encounter problems."
  pushd "$(mktemp -d)"
  npm install -g node-gyp
  export FORCE_NODE_VERSION=$(node -p process.versions.node)
  old_script_shell=$(npm config get script-shell)
  npm config set script-shell 'C:\Program Files\Git\bin\bash.exe'
  npm install --global "code-server@$INPUT_CODE_SERVER_VERSION" --unsafe-perm
  npm config set script-shell "$old_script_shell"
  popd
else
  if [[ $INPUT_CODE_SERVER_VERSION == latest ]]; then
    curl -fsSL https://code-server.dev/install.sh | sh -s -- \
      --prefix=/usr/local
  else
    curl -fsSL https://code-server.dev/install.sh | sh -s -- \
      --prefix=/usr/local --version "$INPUT_CODE_SERVER_VERSION"
  fi
fi
