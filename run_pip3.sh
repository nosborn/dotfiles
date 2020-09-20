#!/bin/sh

set -o errexit
set -o nounset

unset PYTHONPATH # just in case
PATH="$(python3 -msite --user-base)/bin:${PATH}"

python3 -mpip install --user --upgrade --quiet --disable-pip-version-check \
  'vim-vint'

case "$(hostname -s)" in
  19SGD-*)
    python3 -mpip install --user --upgrade --quiet --disable-pip-version-check \
      'datadog' \
      'molecule[docker]' \
      'msrestazure'
    #  'ansible[azure]==2.9.11' \
    #  'ansible-lint' \
    # # 'datadog-checks-dev[cli]' \
    ;;
esac
