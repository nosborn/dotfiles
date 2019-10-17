#!/bin/sh

set -o errexit
set -o nounset

for add in ~/.vim/spell/*.add; do
  vim -c "mkspell! ${add}" -c 'quit'
done
