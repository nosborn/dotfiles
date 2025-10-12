#!/bin/sh

set -o errexit
set -o nounset

[ "$(uname -s)" = Darwin ] || exit 0

launchctl list com.apple.container >/dev/null 2>&1 || {
  launchctl load ~/Library/LaunchAgents/com.apple.container.plist
}

exit 0
