#!/bin/sh

set -o errexit
set -o nounset

[ "$(uname -s)" = Darwin ] || exit 0

if [ -d ~/bin ]; then
  SetFile -a V ~/bin
fi

cp -R /System/Applications/Utilities/Terminal.app/Contents/Resources/Fonts/* \
  /Library/Fonts/

# defaults write -app Rectangle alternateDefaultShortcuts -bool true
defaults write -app Rectangle launchOnLogin -bool true
# defaults write -app Rectangle subsequentExecutionMode -int 2
