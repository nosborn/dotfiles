#!/bin/sh

set -o errexit
set -o nounset

[ "$(uname -s)" = Darwin ] || exit 0

if [ -d "${HOME}/Applications/Rectangle.app" ]; then
  defaults write -app Rectangle SUEnableAutomaticChecks -bool false
  defaults write -app Rectangle SUHasLaunchedBefore -bool true
  defaults write -app Rectangle alternateDefaultShortcuts -bool true
  defaults write -app Rectangle disabledApps -string '["com.apple.finder"]'
  defaults write -app Rectangle launchOnLogin -bool true
  defaults write -app Rectangle subsequentExecutionMode -bool true
fi

find "$(brew --prefix)/Caskroom" -name '*.app' -type l | while read -r link; do
  if xattr "${link}" | grep -Fqx com.apple.quarantine; then
    xattr -d -v com.apple.quarantine "${link}" || :
  fi
done
find "$(brew --prefix)/Caskroom/claude-code" -type f | while read -r file; do
  if xattr "${file}" | grep -Fqx com.apple.quarantine; then
    xattr -d -v com.apple.quarantine "${file}" || :
  fi
done

exit 0
