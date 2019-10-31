#!/bin/sh

set -o errexit
set -o nounset

[ -e "$(brew --prefix ruby)/bin/gem" ] || exit 0
PATH=$(brew --prefix ruby)/bin:${PATH}

for p in github-linguist; do
  gem list "${p}" --installed --silent && continue
  gem install "${p}" --no-document --minimal-deps --quiet
done
