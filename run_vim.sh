#!/bin/sh

set -o errexit
set -o nounset

for f in ~/.vim/spell/*.add; do
  if test "${f}" -nt "${f}.spl"; then
    vim -c "mkspell! ${f}" -c "quit" -n -u NONE
  fi
done
