#!/bin/sh

set -o errexit
set -o nounset

readonly plugins="
  aws
  github
  splunk
  steampipe
"

[ -e "$(brew --prefix steampipe)/bin/steampipe" ] || exit 0

for plugin in ${plugins}; do
  steampipe plugin install "${plugin}" || steampipe plugin update "${plugin}"
done

exit 0
