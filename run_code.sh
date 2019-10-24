#!/bin/sh

set -o errexit
set -o nounset

[ -e /usr/local/bin/code ] || exit

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
