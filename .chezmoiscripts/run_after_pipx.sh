#!/bin/sh

set -o errexit
set -o nounset

[ -e "$(brew --prefix gh)/bin/gh" ] || exit 0

pipx ensurepath

pipx install --system-site-packages 'jsonpatch==1.33'

pipx install --system-site-packages 'jsonpointer>=1.9'

pipx install --system-site-packages 'mkdocs==1.5.3'
pipx inject --system-site-packages mkdocs 'mkdocs-material==9.5.10'

exit 0
