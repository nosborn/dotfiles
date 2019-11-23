#!/bin/sh

set -o errexit
set -o nounset

[ "$(uname -s)" = Darwin ] || exit 0

if [ -d ~/bin ]; then
  SetFile -a V ~/bin
fi

_fish_shell="$(brew --prefix)/bin/fish"
if [ -e "${_fish_shell}" ]; then
  if ! grep -Fqx "${_fish_shell}" /etc/shells; then
    echo "${_fish_shell}" | sudo tee -a /etc/shells >/dev/null
  fi
  if [ "${SHELL}" != "${_fish_shell}" ]; then
    echo chpass -s "${_fish_shell}"
  fi
fi
unset _fish_shell
