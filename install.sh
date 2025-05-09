#!/bin/sh

case "$(uname)" in
Darwin)
  case "$(uname -m)" in
  arm64) readonly PREFIX=/opt/homebrew ;;
  x86_64) readonly PREFIX=/usr/local ;;
  esac
  PATH=/usr/sbin:/usr/bin:/sbin:/bin
  if [ ! -e "${PREFIX:?}/bin/brew" ]; then
    install="$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    bash -c "${install}"
  fi
  PATH="${PREFIX:?}/bin:${PATH}"
  if ! command -v chezmoi >/dev/null 2>&1; then
    brew install chezmoi
  fi
  ;;
esac

chezmoi init "${CHEZMOI_REPO:-nosborn}" --apply --keep-going
