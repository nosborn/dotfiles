#!/bin/sh

set -o errexit
set -o nounset

[ "$(uname -s)" = Darwin ] || exit 0

if [ -d ~/bin ]; then
  SetFile -a V ~/bin
fi

cp -R /System/Applications/Utilities/Terminal.app/Contents/Resources/Fonts/* /Library/Fonts/

defaults write -app Rectangle launchOnLogin -int 1
