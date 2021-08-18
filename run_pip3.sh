#!/bin/sh

set -o errexit
set -o nounset

unset PYTHONPATH # just in case
PATH="$(python3 -msite --user-base)/bin:${PATH}"

python3 -mpip install --user --upgrade --quiet --no-input --disable-pip-version-check \
  'argcomplete' \
  'netaddr' \
  'vim-vint'

if [ "$(chezmoi data | jq -r .where)" = work ]; then
  python3 -mpip install --user --upgrade --quiet --no-input --disable-pip-version-check \
    'ansible>=3.1,<3.2' \
    'datadog' \
    'datadog-checks-dev[cli]' \
    "molecule[docker]==$(brew info --json molecule | jq -r '.[].versions.stable')" \
    'mssql-cli'
fi
