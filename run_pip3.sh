#!/bin/sh

set -o errexit
set -o nounset

python3 -mpip install --user --upgrade --quiet --disable-pip-version-check \
  'jinja2' \
  'vim-vint'

if [ "$(hostname -s)" = "19SGD-MAC11" ]; then
  python3 -mpip install --user --upgrade --quiet --disable-pip-version-check \
    'ansible' \
    'ansible-lint' \
    'datadog-checks-dev[cli]' \
    'molecule'
fi
