function avdiffs
    # [[ $# -eq 2 ]] || { echo "Usage: $0 FILENAME FILENAME" >&2; exit 1 }
    command diff -dy -W$COLUMNS --suppress-common-lines \
        (command ansible-vault view "$argv[1]" | psub) \
        (command ansible-vault view "$argv[2]" | psub)
end
