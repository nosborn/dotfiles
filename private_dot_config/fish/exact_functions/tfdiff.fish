function tfdiff
  command diff -dNry -W$COLUMNS -x .terraform -x '*.rules.tf' -x '*.tfstate' $argv
end

function tfdiffs
  tfdiff --suppress-common-lines $argv
end
