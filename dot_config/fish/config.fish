set --global fish_greeting

fish_add_path --global --prepend "$HOME/.local/bin"
fish_add_path --global --prepend "$HOME/bin"

if type --quiet direnv
    direnv hook fish | source
end

if type --quiet starship
    starship init fish | source
end
