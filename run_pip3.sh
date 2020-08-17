#!/bin/sh

set -o errexit
set -o nounset

PATH="$(python3 -msite --user-base)/bin:${PATH}"

python3 -mpip install --user --upgrade --quiet --disable-pip-version-check \
  'jinja2' \
  'vim-vint'

case "$(hostname -s)" in
  19SGD-*)
    python3 -mpip install --user --upgrade --quiet --disable-pip-version-check \
      'ansible[azure]>=2.9.0,<2.10.0' \
      'ansible-lint' \
      'datadog' \
      'datadog-checks-dev[cli]'
    ;;
esac
