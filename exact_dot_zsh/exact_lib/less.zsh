# Coloured man pages.
export LESS_TERMCAP_mb="${fg_bold[red]}"
export LESS_TERMCAP_md="${fg_bold[red]}"
export LESS_TERMCAP_me="${reset_color}"
export LESS_TERMCAP_se="${reset_color}"
export LESS_TERMCAP_so="${fg_bold[yellow]}${bg[blue]}"
export LESS_TERMCAP_ue="${reset_color}"
export LESS_TERMCAP_us="${fg_bold[greeen]}"

# ¯\_(ツ)_/¯
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZW=$(tput rsupm)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_mr=$(tput rev)

if (( ${+commands[lesspipe.sh]} )); then
  export LESSOPEN="|${commands[lesspipe.sh]} %s"
  export LESSQUIET=1
fi

# export LESS=-R
export PAGER=${commands[less]}
