#!/bin/sh

set -o errexit
set -o nounset

python3 -mpip install --upgrade --quiet --disable-pip-version-check \
  vim-vint

#   datadog \
#   jinja2 \
#   netaddr \

# if [ "$(hostname -s)" = "19SGD-MAC11" ]; then
#   python3 -mpip install --upgrade --quiet --disable-pip-version-check \
#     azure \
#     pykeepass \
#     pyaml
# fi
