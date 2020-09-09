#!/bin/sh

set -o errexit
set -o nounset

PATH="$(python3 -msite --user-base)/bin:${PATH}"

python3 -mpip install --user --upgrade --quiet --disable-pip-version-check \
  pip

python3 -mpip install --user --upgrade --quiet \
  'vim-vint'

case "$(hostname -s)" in
  19SGD-*)
    python3 -mpip install --user --upgrade --quiet \
      datadog \
      msrest
    # 'ansible[azure]==2.9.11' \
    # 'ansible-lint' \
    # 'datadog' \
    # 'molecule[docker]'
    # # 'datadog-checks-dev[cli]' \
    ;;
esac
