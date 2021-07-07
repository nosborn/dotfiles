if (( ${+commands[pipx]} )); then
  autoload -U bashcompinit && bashcompinit
  eval "$(register-python-argcomplete pipx)"
fi
