#!/bin/sh

set -o errexit
set -o nounset

command -v gem >/dev/null 2>&1 || exit 0

for p in github-linguist; do
  gem list --installed --silent "${p}" && continue
  sudo gem install "${p}"
done
