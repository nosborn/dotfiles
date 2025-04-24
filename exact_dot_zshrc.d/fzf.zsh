[[ "${PATH}" == */opt/homebrew/opt/fzf/bin* ]] || {
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
}

[[ $- == *i* ]] && {
  source /opt/homebrew/opt/fzf/shell/completion.zsh 2>/dev/null
}

source "${HOME}/.config/nvim/pack/bluz71/start/vim-moonfly-colors/extras/moonfly-fzf.sh"
source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
