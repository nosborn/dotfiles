# Coloured man pages.
set --export LESS_TERMCAP_mb (set_color -o red)
set --export LESS_TERMCAP_md (set_color -o red)
set --export LESS_TERMCAP_me (set_color normal)
set --export LESS_TERMCAP_se (set_color normal)
set --export LESS_TERMCAP_so (set_color -o yellow)(set_color -b blue)
set --export LESS_TERMCAP_ue (set_color normal)
set --export LESS_TERMCAP_us (set_color -o green)

# ¯\_(ツ)_/¯
set --export LESS_TERMCAP_ZN (tput ssubm)
set --export LESS_TERMCAP_ZO (tput ssupm)
set --export LESS_TERMCAP_ZV (tput rsubm)
set --export LESS_TERMCAP_ZW (tput rsupm)
set --export LESS_TERMCAP_mh (tput dim)
set --export LESS_TERMCAP_mr (tput rev)

if type --quiet lesspipe.sh
    set --export LESSOPEN "| lesspipe.sh %s"
    set --export LESSQUIET 1
end

set --export LESS -R
set --export PAGER less
