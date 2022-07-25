if (( ${+commands[bat]} )); then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi
