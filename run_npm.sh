#!/bin/sh

set -o errexit
set -o nounset

command -v npm >/dev/null 2>&1 || exit 0

packages="
  typescript-language-server
  prettier-plugin-toml
"

for package in ${packages}; do
  if npm ls --location=global --prefix="${HOME}/.local" "${package}" >/dev/null; then
    command=update
  else
    command=install
  fi
  npm "${command}" --location=global --omit=dev --prefix="${HOME}/.local" "${package}"
done

exit 0
