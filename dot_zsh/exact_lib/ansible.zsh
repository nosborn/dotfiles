if (( ${+commands[ansible]} )); then
  avdiff() {
    [[ $# -eq 2 ]] || { echo "Usage: $0 FILENAME FILENAME" >&2; exit 1 }
    command diff -dy -W${COLUMNS} \
      =(command ansible-vault view "$1") \
      =(command ansible-vault view "$2")
  }

  avdiffs() {
    [[ $# -eq 2 ]] || { echo "Usage: $0 FILENAME FILENAME" >&2; exit 1 }
    command diff -dy -W${COLUMNS} --suppress-common-lines \
      =(command ansible-vault view "$1") \
      =(command ansible-vault view "$2")
  }
fi
