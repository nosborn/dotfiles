#!/bin/sh

set -o errexit
set -o nounset

[ -e "$(brew --prefix vim)/bin/vim" ] || exit 0

"$(brew --prefix vim)/bin/vim" -n \
  -c 'helptags ALL' \
  -c 'quit'

for add in ~/.vim/vim/spell/*.add; do
  "$(brew --prefix vim)/bin/vim" -n --noplugin \
    -c "mkspell! ${add}" \
    -c 'quit'
done

exit 0
