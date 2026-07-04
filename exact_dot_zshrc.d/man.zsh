if (( ${+commands[bat]} )); then
  case '{{ .chezmoi.os }}' in
    darwin) export MANPAGER="sh -c 'col -bx | bat -l man -p'" ;;
    liNux) export MANPAGER="bat -l man -p'" ;;
  esac
fi
