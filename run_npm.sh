#!/bin/sh

set -o errexit
set -o nounset

command -v npm >/dev/null 2>&1 || exit 0

# Nothing to see here!
packages="
  prettier-plugin-toml
"

for package in ${packages}; do
  if npm ls --global --prefix="${HOME}/.local" "${package}" >/dev/null; then
    command=update
  else
    command=install
  fi
  npm "${command}" --global --prefix="${HOME}/.local" --production "${package}"
done

exit 0
