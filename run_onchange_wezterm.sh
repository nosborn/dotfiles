#!/bin/sh

set -o errexit
set -o nounset

tempfile="$(mktemp)"
trap 'rm "${tempfile}"' EXIT

curl -fsS -o "${tempfile}" https://raw.githubusercontent.com/wez/wezterm/master/termwiz/data/wezterm.terminfo
tic -o "${HOME}/.terminfo" -x "${tempfile}"

exit 0
