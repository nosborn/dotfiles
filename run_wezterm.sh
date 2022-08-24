#!/bin/sh

set -o errexit
set -o nounset

[ -e "$(brew --prefix)/bin/wezterm" ] || exit 0

tempfile="$(mktemp)"
trap 'rm "${tempfile}"' EXIT

curl -fLsS -o "${tempfile}" https://raw.githubusercontent.com/wez/wezterm/main/termwiz/data/wezterm.terminfo
tic -o ~/.local/share/terminfo -x "${tempfile}"

exit 0
