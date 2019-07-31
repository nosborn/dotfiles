#!/bin/sh

set -o errexit
set -o nounset

for p in markdownlint-cli; do
  npm list --global "${p}" >/dev/null && continue
  npm install --global --no-optional --no-package-lock --only=production "${p}"
done
