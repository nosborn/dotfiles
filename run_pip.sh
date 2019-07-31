#!/bin/sh

set -o errexit
set -o nounset

pip3 install --upgrade --no-warn-script-location --quiet --disable-pip-version-check \
  vim-vint

if [ "$(hostname -s)" = "19SGD-MAC11" ]; then
  pip3 install --upgrade --no-warn-script-location --quiet --disable-pip-version-check \
    azure
fi
