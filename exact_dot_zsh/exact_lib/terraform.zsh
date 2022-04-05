if (( ${+commands[terraform]} )); then
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C "${commands[terraform]}" terraform

  alias tfdiff='command diff -dNry -W${COLUMNS} -x .terraform -x .terraform.lock.hcl -x \*.bak -x \*.tfplan -x \*.tfstate -x \*.tfstate.\* -x PLAN'
  alias tfdiffs='tfdiff --suppress-common-lines'
fi
