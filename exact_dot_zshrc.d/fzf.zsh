[[ "${PATH}" == */opt/homebrew/opt/fzf/bin* ]] || {
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
}

[[ $- == *i* ]] && {
  source /opt/homebrew/opt/fzf/shell/completion.zsh 2>/dev/null
}

source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
