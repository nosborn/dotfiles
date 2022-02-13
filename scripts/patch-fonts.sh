#!/bin/bash

set -o nounset

docker system info &>/dev/null || colima start || exit

rm -rf .nerd-fonts/
mkdir -p .nerd-fonts/in/ .nerd-fonts/out/ || exit
trap 'rm -rf .nerd-fonts/' EXIT

cp "${HOME}/Library/Fonts/CascadiaMonoPL-Bold.ttf" .nerd-fonts/in/ || exit
cp "${HOME}/Library/Fonts/CascadiaMonoPL-BoldItalic.ttf" .nerd-fonts/in/ || exit
cp "${HOME}/Library/Fonts/CascadiaMonoPL-Italic.ttf" .nerd-fonts/in/ || exit
cp "${HOME}/Library/Fonts/CascadiaMonoPL-Regular.ttf" .nerd-fonts/in/ || exit

docker run --rm \
  --mount "type=bind,source=${PWD}/.nerd-fonts/in,target=/in,readonly" \
  --mount "type=bind,source=${PWD}/.nerd-fonts/out,target=/out" \
  --user "$(id -u):$(id -g)" \
  nerdfonts/patcher:latest \
  --careful --complete --mono --no-progressbars --quiet

mv -fv .nerd-fonts/out/*.ttf "${HOME}/Library/Fonts/" || exit
rm -rf .nerd-fonts/
