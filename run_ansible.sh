#!/bin/sh

set -o errexit
set -o nounset

"$(brew --prefix ansible)/libexec/bin/pip3" install \
  --upgrade \
  --quiet \
  --disable-pip-version-check \
  datadog
