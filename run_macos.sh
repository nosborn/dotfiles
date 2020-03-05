#!/bin/sh

set -o errexit
set -o nounset

[ "$(uname -s)" = Darwin ] || exit 0

if [ -d ~/bin ]; then
  SetFile -a V ~/bin
fi

cp -R /System/Applications/Utilities/Terminal.app/Contents/Resources/Fonts/* \
  /Library/Fonts/

defaults write -app BitBar SUSendProfileInfo -bool false
defaults write -app BitBar pluginsDirectory "${HOME}/.local/libexec/bitbar"

# defaults write -app Rectangle alternateDefaultShortcuts -bool true
defaults write -app Rectangle launchOnLogin -bool true
# defaults write -app Rectangle subsequentExecutionMode -int 2

defaults write com.JohnCoates.Aerial SUEnableAutomaticChecks -bool false
defaults write com.JohnCoates.Aerial SUSendProfileInfo -bool false

readonly username=$(id -un)
test -e /etc/sudoers.d/${username}-openconnect || {
  sudo tee /etc/sudoers.d/${username}-openconnect >/dev/null <<EOF
${username} ALL=(ALL) NOPASSWD: /usr/bin/killall openconnect
${username} ALL=(ALL) NOPASSWD: /usr/local/bin/openconnect
EOF
  sudo chown root:wheel /etc/sudoers.d/${username}-openconnect
  sudo chmod 0440 /etc/sudoers.d/${username}-openconnect
}
