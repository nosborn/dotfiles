set --global fish_greeting

if type --quiet direnv
    direnv hook fish | source
end

if type --quiet starship
    starship init fish | source
end
