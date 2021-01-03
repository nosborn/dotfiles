if (( ${+commands[molecule]} )); then
  eval "$(_MOLECULE_COMPLETE=source "${commands[molecule]}")"
fi
