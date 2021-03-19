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
    'ansible>=3.0,<3.1' \
    "ansible-lint==$(brew info ansible-lint --json | jq -r '.[].versions.stable')" \
    "azure-cli==$(brew info azure-cli --json | jq -r '.[].versions.stable')" \
    'datadog' \
    'datadog-checks-dev[cli]' \
    "molecule[docker]==$(brew info molecule --json | jq -r '.[].versions.stable')" \
    'mssql-cli'
fi
