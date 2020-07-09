#!/bin/sh

set -o errexit
set -o nounset

PATH="$(python3 -msite --user-base)/bin:${PATH}"

python3 -mpip install --user --upgrade --quiet --disable-pip-version-check \
  'jinja2' \
  'vim-vint'

if [ "$(hostname -s)" = "19SGD-MAC11" ]; then
  python3 -mpip install --user --upgrade --quiet --disable-pip-version-check \
    'ansible[azure]' \
    'ansible-lint' \
    'datadog-checks-dev[cli]'
fi
