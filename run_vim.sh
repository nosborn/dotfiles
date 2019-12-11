#!/bin/sh

set -o errexit
set -o nounset

for add in ~/.vim/spell/*.add; do
  command vim -n -u NONE +"mkspell! ${add}" +'quit'
done
