#!/bin/sh

set -o errexit
set -o nounset

command -v pip3 >/dev/null 2>&1 || exit

pip3_install() {
  pip3 install --upgrade --quiet --disable-pip-version-check "$@"
}

pip3_install vim-vint

if [ "$(hostname -s)" = "19SGD-MAC11" ]; then
  pip3_install azure
fi
