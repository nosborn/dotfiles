#!/bin/sh

set -o errexit
set -o nounset

[ -e "$(brew --prefix krew)/bin/kubectl-krew" ] || exit 0
[ -e "$(brew --prefix kubectl)/bin/kubectl" ] || exit 0

PATH="${HOME}/.krew/bin:${PATH}"

"$(brew --prefix kubectl)/bin/kubectl" krew update
"$(brew --prefix kubectl)/bin/kubectl" krew install fields || :
"$(brew --prefix kubectl)/bin/kubectl" krew install get-all || :
# "$(brew --prefix kubectl)/bin/kubectl" krew install topology || :
"$(brew --prefix kubectl)/bin/kubectl" krew install tree || :
# "$(brew --prefix kubectl)/bin/kubectl" krew install unused-volumes || :

exit 0
