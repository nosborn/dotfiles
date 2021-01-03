if (( ${+commands[terraform]} )); then
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C "${commands[terraform]}" terraform

  alias tfdiff='command diff -dNry -W${COLUMNS} -x .terraform -x \*.tfplan -x \*.rules.tf -x \*.tfstate -x \*.tfstate.\* -x PLAN'
  alias tfdiffs='tfdiff --suppress-common-lines'
fi
