autoload -Uz vcs_info

precmd_vcs_info() {
  vcs_info
}
precmd_functions+=(precmd_vcs_info)

setopt prompt_subst
RPROMPT='${vcs_info_msg_0_}'
zstyle ':vcs_info:git:*' actionformats '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f'
zstyle ':vcs_info:git:*' formats '%F{5}[%F{2}%b%F{5}]%f'

# vim: ft=zsh
