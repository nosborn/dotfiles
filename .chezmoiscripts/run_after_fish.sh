#!/bin/sh

set -o errexit
set -o nounset

[ -e "$(brew --prefix fish)/bin/fish" ] || exit 0

grep -Fqx "$(brew --prefix)/bin/fish" /etc/shells || {
  echo "$(brew --prefix)/bin/fish" | sudo tee -a /etc/shells >/dev/null
}

exit 0
