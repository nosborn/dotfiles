#!/bin/sh

set -o errexit
set -o nounset

for add in ~/.config/nvim/spell/*.add; do
  nvim -n -u NONE +"mkspell! ${add}" +'quit'
done
