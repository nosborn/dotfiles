set --global --export HOMEBREW_BAT 1
set --global --export HOMEBREW_BUNDLE_NO_LOCK 1
set --global --export HOMEBREW_NO_ANALYTICS 1
set --global --export HOMEBREW_NO_INSECURE_REDIRECT 1

if test -e /opt/homebrew/bin/brew
    fish_add_path --path /opt/homebrew/bin /opt/homebrew/sbin
else if test -e /usr/local/bin/brew
    fish_add_path --path /usr/local/bin /usr/local/sbin
end
