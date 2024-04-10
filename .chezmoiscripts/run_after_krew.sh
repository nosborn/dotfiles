#!/bin/sh

set -o errexit
set -o nounset

[ -e "$(brew --prefix krew)/bin/kubectl-krew" ] || exit 0
[ -e "$(brew --prefix kubectl)/bin/kubectl" ] || exit 0

"$(brew --prefix kubectl)/bin/kubectl" krew update
"$(brew --prefix kubectl)/bin/kubectl" krew install tree || :

exit 0
