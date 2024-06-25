#!/bin/sh

set -o errexit
set -o nounset

[ -e "$(brew --prefix pipx)/bin/pipx" ] || exit 0

export PIPX_HOME="${HOME}/.local/pipx"
export PIPX_BIN_HOME="${HOME}/.local/bin"
export USE_EMOJI=0

"$(brew --prefix pipx)/bin/pipx" install --quiet --system-site-packages jsonpatch

"$(brew --prefix pipx)/bin/pipx" install --quiet --system-site-packages jsonpointer

"$(brew --prefix pipx)/bin/pipx" install --quiet --system-site-packages mkdocs
"$(brew --prefix pipx)/bin/pipx" inject --quiet --system-site-packages mkdocs mkdocs-d2-plugin
"$(brew --prefix pipx)/bin/pipx" inject --quiet --system-site-packages mkdocs mkdocs-material

"$(brew --prefix pipx)/bin/pipx" upgrade-all --include-injected --quiet

exit 0
