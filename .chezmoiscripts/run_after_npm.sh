#!/bin/sh

set -o errexit
set -o nounset

[ -e "$(brew --prefix node)/bin/npm" ] || exit 0

packages="
  @mermaid-js/mermaid-cli
  ajv-cli
  neovim
  prettier-plugin-toml
"

for package in ${packages}; do
  if "$(brew --prefix node)/bin/npm" ls --location=global --prefix="${HOME}/.local" "${package}" >/dev/null; then
    command=update
  else
    command=install
  fi
  "$(brew --prefix node)/bin/npm" "${command}" --location=global --omit=dev --prefix="${HOME}/.local" "${package}"
done

exit 0
