#!/bin/sh

set -o errexit
set -o nounset

command -v vim >/dev/null 2>&1 || exit 0

vim \
  -c 'helptags ALL' \
  -c 'quit'

for add in ~/.vim/spell/*.add; do
  vim --noplugin \
    -c "mkspell! ${add}" \
    -c 'quit'
done

exit 0
