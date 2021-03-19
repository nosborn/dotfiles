#!/bin/sh

set -o errexit
set -o nounset

unset PYTHONPATH # just in case
PATH="$(python3 -msite --user-base)/bin:${PATH}"

python3 -mpip install --user --upgrade --quiet --disable-pip-version-check \
  'argcomplete' \
  'netaddr' \
  'vim-vint'

if [ "$(chezmoi data | jq -r .where)" = work ]; then
  python3 -mpip install --user --upgrade --quiet --disable-pip-version-check \
    'ansible>=2.10.7,<2.11' \
    'ansible-lint>=5.0.0' \
    'azure-cli>=2.19' \
    'datadog' \
    'datadog-checks-dev[cli]' \
    'molecule[docker]>=3.2.3' \
    'mssql-cli'
fi
