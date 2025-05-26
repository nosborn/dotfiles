[[ "${PATH}" == */opt/homebrew/opt/fzf/bin* ]] || {
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
}

source /opt/homebrew/opt/fzf/shell/completion.zsh
source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
