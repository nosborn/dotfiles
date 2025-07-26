#!/bin/sh

set -o errexit
set -o nounset

command -v go >/dev/null 2>&1 || exit 0

if [ "$(go telemetry)" != on ]; then
  go telemetry off
fi

exit 0
