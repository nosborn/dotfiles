# setopt prompt_subst

# function _rprompt_info() {
#   if [ -e $(brew --prefix zsh-git-prompt)/zshrc.sh ]; then
#     git_super_status
#   else
#     vcs_info
#     printf '%s' "${vcs_info_msg_0_}"
#   fi
# }

# RPROMPT='$(_rprompt_info)'

autoload -Uz vcs_info

precmd_vcs_info() {
  vcs_info
}
precmd_functions+=(precmd_vcs_info)

setopt prompt_subst
RPROMPT='${vcs_info_msg_0_}'
zstyle ':vcs_info:git:*' formats '%F{3}%b'

# vim: ft=zsh
