#!/bin/sh

set -o errexit
set -o nounset

[ -e "$(brew --prefix steampipe)/bin/steampipe" ] || exit 0

# "$(brew --prefix steampipe)" plugin install --skip-config
# "$(brew --prefix steampipe)" plugin update --all

exit 0
