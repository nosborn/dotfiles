function diff --wraps='command diff -W $COLUMNS -x .terraform -d' --description 'alias diff=command diff -W $COLUMNS -x .terraform -d'
    command diff -W $COLUMNS -x .terraform -d $argv
end
