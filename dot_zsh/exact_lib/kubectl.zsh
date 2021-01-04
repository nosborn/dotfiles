if (( ${+commands[kubectl]} )); then
  source <("${commands[kubectl]}" completion zsh)
fi
