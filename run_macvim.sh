#!/bin/sh

set -o errexit
set -o nounset

[ "$(uname -s)" = Darwin ] || exit

defaults write -app MacVim MMLastWindowClosedBehavior 2
defaults write -app MacVim SUEnableAutomaticChecks 0
defaults write -app MacVim SUSendProfileInfo 0
