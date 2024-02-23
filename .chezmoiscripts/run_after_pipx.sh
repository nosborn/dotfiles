#!/bin/sh

set -o errexit
set -o nounset

[ -e "$(brew --prefix gh)/bin/gh" ] || exit 0

pipx install --quiet --system-site-packages jsonpatch

pipx install --quiet --system-site-packages jsonpointer

pipx install --quiet --system-site-packages mkdocs
pipx inject --quiet --system-site-packages mkdocs mkdocs-material

pipx upgrade-all --quiet

exit 0
