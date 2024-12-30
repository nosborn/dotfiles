#!/bin/sh

set -o errexit
set -o nounset

fish="$(command -v fish 2>/dev/null)"
test -n "${fish}" || exit 0

grep -Fqx "${fish}" /etc/shells || {
  printf '%s\n' "${fish}" | sudo tee -a /etc/shells >/dev/null
}

exit 0
