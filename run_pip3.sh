#!/bin/sh

set -o errexit
set -o nounset

python3 -mpip install --user --upgrade --quiet --disable-pip-version-check \
  'vim-vint'

if [ "$(hostname -s)" = "19SGD-MAC11" ]; then
  python3 -mpip install --user --upgrade --quiet --disable-pip-version-check \
    'datadog-checks-dev[cli]'
fi
