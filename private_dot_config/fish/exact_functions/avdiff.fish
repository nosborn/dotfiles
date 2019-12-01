function avdiff
  if test (count $argv) -ne 2
    echo "Usage: (status current-command) FILENAME FILENAME" >&2
    exit 1
  end
  command diff -dy -W$COLUMNS $argv[1..-2] \
    (ansible-vault view "$argv[-2]" | psub) \
    (ansible-vault view "$argv[-1]" | psub)
end

function avdiffs
  avdiff --suppress-common-lines $argv
  # if test (count $argv) -ne 2
  #   echo "Usage: $argv[0] FILENAME FILENAME" >&2
  #   exit 1
  # end
  # command diff -dy -W$COLUMNS --suppress-common-lines \
  #   (ansible-vault view "$argv[1]" | psub) \
  #   (ansible-vault view "$argv[2]" | psub)
end
