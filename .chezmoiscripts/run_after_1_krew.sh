#!/bin/sh

set -o errexit
set -o nounset

command -v kubectl >/dev/null 2>&1 || exit 0
command -v kubectl-krew >/dev/null 2>&1 || exit 0

PATH="${HOME}/.krew/bin:${PATH}"

installed="$(kubectl krew list)"
for name in fields get-all tree vpa-recommendation; do
  if ! echo "${installed}" | grep -Eq "^${name}\>"; then
    kubectl krew install "${name}"
  fi
done
kubectl krew upgrade --no-update-index

exit 0
