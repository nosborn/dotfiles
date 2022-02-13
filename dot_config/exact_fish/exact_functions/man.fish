function man --wraps man
    set --export LESS_TERMCAP_md (set_color --bold cyan)
    set --export LESS_TERMCAP_me (set_color normal)
    set --export LESS_TERMCAP_se (set_color normal)
    set --export LESS_TERMCAP_so (set_color --reverse yellow)
    set --export LESS_TERMCAP_ue (set_color normal)
    set --export LESS_TERMCAP_us (set_color --underline green)

    command man $argv
end
