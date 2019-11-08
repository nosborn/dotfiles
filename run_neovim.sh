#!/bin/sh

set -o errexit
set -o nounset

nvim -n -u NONE +"helptags ALL" +'quit'

for add in ~/.config/nvim/spell/*.add; do
  nvim -n -u NONE +"mkspell! ${add}" +'quit'
done
