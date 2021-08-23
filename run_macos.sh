#!/bin/sh

set -o errexit
set -o nounset

[ "$(uname -s)" = Darwin ] || exit 0

if [ -d ~/bin ]; then
  SetFile -a V ~/bin
fi

if [ -d /Applications/MacVim.app ]; then
  defaults write -app MacVim MMLastWindowClosedBehavior -int 2
  defaults write -app MacVim SUEnableAutomaticChecks -bool false
  defaults write -app MacVim SUHasLaunchedBefore -bool true
  defaults write -app MacVim SUSendProfileInfo -bool false
fi

if [ -d /Applications/Rectangle.app ]; then
  defaults write -app Rectangle SUEnableAutomaticChecks -bool false
  defaults write -app Rectangle SUHasLaunchedBefore -bool true
  defaults write -app Rectangle SUSendProfileInfo -bool false
  defaults write -app Rectangle launchOnLogin -bool true
fi

if [ -d "${HOME}/Library/Screen Savers/Aerial.saver" ]; then
  defaults write com.JohnCoates.Aerial SUEnableAutomaticChecks -bool false
  defaults write com.JohnCoates.Aerial SUSendProfileInfo -bool false
fi

if [ -d /Applications/Docker.app/Contents/Resources/etc ]; then
  for cmd in docker docker-compose; do
    [ -e "$(brew --prefix)/share/zsh/site-functions/_${cmd}" ] || {
      ln -sv /Applications/Docker.app/Contents/Resources/etc/${cmd}.zsh-completion \
        "$(brew --prefix)/share/zsh/site-functions/_${cmd}"
    }
  done
fi

find "$(brew --prefix)/Caskroom" -name '*.app' -type l | while read -r link; do
  if xattr "${link}" | grep -Fqx com.apple.quarantine; then
    xattr -d -v com.apple.quarantine "${link}"
  fi
done

if [[ -e "$(brew --prefix)/bin/fish" ]]; then
  if ! grep -Fqx "$(brew --prefix)/bin/fish" /etc/shells; then
    echo "$(brew --prefix)/bin/fish" | tee -a /etc/shells >/dev/null
  fi
fi

if [ "$(chezmoi data | jq -r .where)" = work ]; then
  [ $(pmset -g live | awk '$1=="disksleep" {print $2}') -eq 10 ] || sudo pmset -a disksleep 10
  [ $(pmset -g live | awk '$1=="displaysleep" {print $2}') -eq 60 ] || sudo pmset -c displaysleep 60
  [ $(pmset -g live | awk '$1=="sleep" {print $2}') -eq 0 ] || sudo pmset -c sleep 0
fi
