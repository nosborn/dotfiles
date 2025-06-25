#!/bin/sh

set -o errexit
set -o nounset

command -v kubectl >/dev/null 2>&1 || exit 0
command -v kubectl-krew >/dev/null 2>&1 || exit 0

PATH="${HOME}/.krew/bin:${PATH}"

"$(brew --prefix kubectl)/bin/kubectl" krew update
"$(brew --prefix kubectl)/bin/kubectl" krew install fields || :
"$(brew --prefix kubectl)/bin/kubectl" krew install get-all || :
# "$(brew --prefix kubectl)/bin/kubectl" krew install topology || :
"$(brew --prefix kubectl)/bin/kubectl" krew install tree || :
# "$(brew --prefix kubectl)/bin/kubectl" krew install unused-volumes || :

exit 0
