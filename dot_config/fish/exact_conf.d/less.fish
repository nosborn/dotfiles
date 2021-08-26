# set --export LESS_TERMCAP_mb "${fg_bold[red]}"
# set --export LESS_TERMCAP_md "${fg_bold[red]}"
# set --export LESS_TERMCAP_me "${reset_color}"
# set --export LESS_TERMCAP_se "${reset_color}"
# set --export LESS_TERMCAP_so "${fg_bold[yellow]}${bg[blue]}"
# set --export LESS_TERMCAP_ue "${reset_color}"
# set --export LESS_TERMCAP_us "${fg_bold[greeen]}"

# ¯\_(ツ)_/¯
set --export LESS_TERMCAP_ZN (tput ssubm)
set --export LESS_TERMCAP_ZO (tput ssupm)
set --export LESS_TERMCAP_ZV (tput rsubm)
set --export LESS_TERMCAP_ZW (tput rsupm)
set --export LESS_TERMCAP_mh (tput dim)
set --export LESS_TERMCAP_mr (tput rev)

if command -q lesspipe.sh
    # export LESSOPEN="|${commands[lesspipe.sh]} %s"
    set --export LESS_ADVANCED_PREPROCESSOR 1
end

set --export PAGER (command --search less)
