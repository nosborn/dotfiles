function tfdiff
  command diff -dNry -W$COLUMNS -x .terraform -x *.rules.tf $argv
end
