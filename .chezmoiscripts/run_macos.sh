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
  defaults write -app Rectangle disabledApps -string '["com.apple.finder"]'
  defaults write -app Rectangle launchOnLogin -bool true
fi

if [ -d "${HOME}/Library/Screen Savers/Aerial.saver" ]; then
  defaults write com.JohnCoates.Aerial SUEnableAutomaticChecks -bool false
  defaults write com.JohnCoates.Aerial SUSendProfileInfo -bool false
fi

find "$(brew --prefix)/Caskroom" -name '*.app' -type l | while read -r link; do
  if xattr "${link}" | grep -Fqx com.apple.quarantine; then
    xattr -d -v com.apple.quarantine "${link}"
  fi
done

exit 0
