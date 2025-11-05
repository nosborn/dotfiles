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

# defaults write -globalDomain NSUserKeyEquivalents -dict-add 'Left' "$(printf '~^\U2190')"
# defaults write -globalDomain NSUserKeyEquivalents -dict-add 'Right' "$(printf '~^\U2192')"
# defaults write -globalDomain NSUserKeyEquivalents -dict-add 'Bottom' "$(printf '~^\U2193')"
# defaults write -globalDomain NSUserKeyEquivalents -dict-add 'Top' "$(printf '~^\U2191')"

find "$(brew --prefix)/Caskroom" -name '*.app' -type l | while read -r link; do
  case "${link}" in
    */OrbStack.app) ;;
    *)
      if xattr "${link}" | grep -Fqx com.apple.quarantine; then
        xattr -d -v com.apple.quarantine "${link}" || :
      fi
      ;;
  esac
done

exit 0
