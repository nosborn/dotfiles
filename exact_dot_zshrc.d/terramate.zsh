if (( ${+commands[terramate]} )); then
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C "${commands[terramate]}" terramate
fi
