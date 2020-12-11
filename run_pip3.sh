#!/bin/sh

set -o errexit
set -o nounset

unset PYTHONPATH # just in case
PATH="$(python3 -msite --user-base)/bin:${PATH}"

python3 -mpip install --user --upgrade --quiet --disable-pip-version-check \
  'argcomplete' \
  'vim-vint'

case "$(hostname -s)" in
  19SGD-*)
    python3 -mpip install --user --upgrade --quiet --disable-pip-version-check \
      'ansible>=2.10,<2.11' \
      'ansible-lint>4.3' \
      'azure-cli>=2.16' \
      'datadog' \
      'datadog-checks-dev[cli]' \
      'molecule[docker]>=3.2'
    ;;
esac
