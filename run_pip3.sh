#!/bin/sh

set -o errexit
set -o nounset

unset PYTHONPATH # just in case
PATH="$(python3 -msite --user-base)/bin:${PATH}"

python3 -mpip install --user --upgrade --quiet --no-input --disable-pip-version-check \
  'argcomplete'

python3 -mpip uninstall --yes --quiet --no-input --disable-pip-version-check \
  'netaddr' \
  'vim-vint'

if [ "$(chezmoi data | jq -r .where)" = work ]; then
  python3 -mpip install --user --upgrade --quiet --no-input --disable-pip-version-check \
    'datadog-checks-dev[cli]'

  python3 -mpip uninstall --yes --quiet --no-input --disable-pip-version-check \
    'ansible' \
    'ansible-lint' \
    'datadog' \
    'molecule' \
    'mssql-cli'
fi
