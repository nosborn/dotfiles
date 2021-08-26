function tfdiff
    command diff -dNry -W $COLUMNS -x .terraform -x .terraform.lock.hcl -x \*.bak -x \*.tfplan -x \*.tfstate -x \*.tfstate.\* -x PLAN $argv
end
