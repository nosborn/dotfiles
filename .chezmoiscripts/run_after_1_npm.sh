#!/bin/sh

set -o errexit
set -o nounset

command -v npm >/dev/null 2>&1 || exit 0

cd "${CHEZMOI_SOURCE_DIR:?}"
npm install --location=global --omit=dev --prefix="${HOME}/.local"
