#!/bin/sh

set -o errexit
set -o nounset

for add in ~/.vim/spell/*.add; do
  nvim -c "mkspell! ${add}" -c 'quit'
done
