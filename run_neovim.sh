#!/bin/sh

set -o errexit
set -o nounset

nvim -n -u NONE +"helptags ALL" +'quit'

for add in ~/.config/nvim/spell/*.add; do
  nvim -n -u NONE +"mkspell! ${add}" +'quit'
done

yarn install \
  --cwd ~/.config/nvim/pack/iamcco/start/markdown-preview.nvim/app \
  --emoji false \
  --no-default-rc \
  --non-interactive \
  --production
