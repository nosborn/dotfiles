#!/bin/sh

set -o errexit
set -o nounset

readonly extensions="
  actions/gh-actions-cache
  dlvhdr/gh-dash
  matt-bartel/gh-clone-org
  rnorth/gh-combine-prs
"

command -v gh >/dev/null 2>&1 || exit 0

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
