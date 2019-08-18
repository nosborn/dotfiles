#!/bin/sh

set -o errexit
set -o nounset

case "$(uname)" in
  Darwin)
    PATH=/usr/sbin:/usr/bin:/sbin:/bin
    if [ ! -e /usr/local/bin/brew ]; then
      ruby -e "$(curl -fLsS https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    PATH=/usr/local/bin:${PATH}
    if ! command -v chezmoi >/dev/null 2>&1; then
      brew install twpayne/taps/chezmoi
    fi
    ;;
esac

chezmoi init "${CHEZMOI_REPO:-git@github.com:nosborn/dotfiles.git}" --apply
