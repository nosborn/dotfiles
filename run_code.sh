#!/bin/sh

set -o errexit
set -o nounset

command -v code >/dev/null 2>&1 || exit 0

readonly extensions="
  davidanson.vscode-markdownlint
  mauve.terraform
  ms-python.python
  redhat.vscode-yaml
  wholroyd.jinja
"

for e in ${extensions}; do
  code --list-extensions | grep -Fix "${e}" >/dev/null && continue
  code --install-extension "${e}"
done
