#!/bin/sh

set -o errexit
set -o nounset

command -v pipx >/dev/null 2>&1 || exit 0

export PIPX_HOME="${HOME}/.local/pipx"
export PIPX_BIN_HOME="${HOME}/.local/bin"
export USE_EMOJI=0

install_if_needed() {
  if ! pipx list | grep -q "package $1"; then
    pipx install --quiet --system-site-packages "$1"
  fi
}

inject_if_needed() {
  if ! pipx runpip "$1" show "$2" >/dev/null 2>&1; then
    pipx inject --quiet --system-site-packages "$1" "$2"
  fi
}

install_if_needed jsonpatch

install_if_needed jsonpointer

install_if_needed mkdocs
inject_if_needed mkdocs mkdocs-d2-plugin
inject_if_needed mkdocs mkdocs-material

pipx upgrade-all --include-injected --quiet

exit 0
