#!/bin/sh

set -o errexit
set -o nounset

readonly extensions="
  dlvhdr/gh-dash
"

[ -e "$(brew --prefix gh)/bin/gh" ] || exit 0

installed="$(mktemp)"
readonly installed
trap 'rm -f "${installed}"' EXIT
gh extension list >"${installed}"

for extension in ${extensions}; do
  if ! grep -Eqw "${extension}" "${installed}"; then
    gh extension install "${extension}"
  else
    gh extension upgrade "${extension}"
  fi
done

exit 0
