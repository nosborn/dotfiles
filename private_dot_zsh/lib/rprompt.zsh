autoload -Uz vcs_info

precmd_vcs_info() {
  vcs_info
}
precmd_functions+=(precmd_vcs_info)

setopt prompt_subst
RPROMPT='${vcs_info_msg_0_}'
zstyle ':vcs_info:git:*' formats '%F{3}[%b]%f'

# vim: ft=zsh
