#!/bin/sh

set -o errexit
set -o nounset

python3 -mpip install --upgrade --quiet --disable-pip-version-check \
  vim-vint

if [ "$(hostname -s)" = "19SGD-MAC11" ]; then
  python3 -mpip install --upgrade --quiet --disable-pip-version-check \
    ansible \
    ansible-lint \
    datadog \
    jinja2 \
    packaging
fi
