#!/bin/sh

set -o errexit
set -o nounset

command -v colima >/dev/null 2>&1 || exit 0

if [ ! -e "${HOME}/.local/bin/nerdctl" ]; then
  colima nerdctl install --path="${HOME}/.local/bin/nerdctl"
fi

exit 0
