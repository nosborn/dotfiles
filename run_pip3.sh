#!/bin/sh

set -o errexit
set -o nounset

python3 -mpip install --upgrade --quiet --disable-pip-version-check \
  ansible \
  ansible-lint \
  black \
  datadog \
  jinja2 \
  netaddr \
  molecule \
  vim-vint \
  yamllint

if [ "$(hostname -s)" = "19SGD-MAC11" ]; then
  python3 -mpip install --upgrade --quiet --disable-pip-version-check \
    azure \
    azure-cli \
    pykeepass \
    pyaml
fi
