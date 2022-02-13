# # ¯\_(ツ)_/¯
# set --export --global LESS_TERMCAP_ZN (tput ssubm)
# set --export --global LESS_TERMCAP_ZO (tput ssupm)
# set --export --global LESS_TERMCAP_ZV (tput rsubm)
# set --export --global LESS_TERMCAP_ZW (tput rsupm)
# set --export --global LESS_TERMCAP_mh (tput dim)
# set --export --global LESS_TERMCAP_mr (tput rev)

if type --quiet lesspipe.sh
    set --export --global LESSOPEN '| lesspipe.sh %s'
    set --export --global LESSQUIET 1
end

set --export --global LESS -R
set --export --global PAGER less
