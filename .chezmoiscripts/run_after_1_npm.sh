#!/bin/sh

set -o errexit
set -o nounset

command -v npm >/dev/null 2>&1 || exit 0

cd "${CHEZMOI_SOURCE_DIR:?}"

if [ ! -e package-lock.json ]; then
  npm install --omit=dev --no-fund --package-lock-only
fi

INSTALLED="$(npm list --depth=0 --json --location=global --prefix="${HOME}/.local")"
WANTED="$(jq -r '.dependencies | to_entries | .[] | .key + "@" + .value' package.json)"

for pkg_spec in ${WANTED}; do
  pkg_name=${pkg_spec%@*}
  wanted=${pkg_spec##*@}
  installed=$(echo "${INSTALLED}" | jq -r ".dependencies.\"${pkg_name}\".version // \"\"")

  if [ "${installed}" != "${wanted}" ]; then
    npm install --location=global --no-fund --omit=dev --prefix="${HOME}/.local" "${pkg_spec}"
  fi
done
