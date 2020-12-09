function tfdiff
  diff -dNry --width=$COLUMNS \
    -x '*.rules.tf' \
    -x '*.tfplan' \
    -x '*.tfstate' \
    -x '*.tfstate.\*' \
    -x 'PLAN' \
    --exclude-dir=.terraform \
    $argv
end
