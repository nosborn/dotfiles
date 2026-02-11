if (( ${+commands[terraform]} )); then
  alias tfdiff='command diff -dNry -W${COLUMNS} -x .terraform -x .terraform.lock.hcl -x \*.bak -x \*.tfplan -x \*.tfstate -x \*.tfstate.\* -x PLAN'
  alias tfdiffs='tfdiff --suppress-common-lines'
fi
