#!/bin/sh

set -o errexit
set -o nounset

python3 -mpip install --upgrade --quiet --disable-pip-version-check \
  ansible \
  ansible-lint \
  datadog \
  netaddr \
  molecule \
  vim-vint

if [ "$(hostname -s)" = "19SGD-MAC11" ]; then
  python3 -mpip install --upgrade --quiet --disable-pip-version-check \
    azure \
    jinja2 \
    pykeepass \
    pylint \
    pyaml
fi
