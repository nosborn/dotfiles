# https://dgl.cx/2024/12/ghostty-terminal-title

function skip-osc-sequence() {
  local key
  while read -sk key && (( $((#key)) != 0x1B && $((#key)) != 0x07 )); do
    # empty body
  done
  if [[ $((#key)) = 27 ]]; then
    # ^[\
    read -sk key
  fi
}

zle -N skip-osc-sequence
bindkey '\e]' skip-osc-sequence
