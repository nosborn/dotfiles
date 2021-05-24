#!/bin/bash

set -o errexit
set -o nounset

case "$(uname)" in
  Darwin)
    case "$(uname -m)" in
      arm64) readonly PREFIX=/opt/homebrew ;;
      x86_64) readonly PREFIX=/usr/local ;;
    esac
    PATH=/usr/sbin:/usr/bin:/sbin:/bin
    if [[ ! -e "${PREFIX}/bin/brew" ]]; then
      bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    PATH="${PREFIX}/bin:${PATH}"
    if ! command -v chezmoi >/dev/null 2>&1; then
      brew install chezmoi
    fi
    if ! command -v jq >/dev/null 2>&1; then
      brew install jq
    fi
    ;;
esac

chezmoi init "${CHEZMOI_REPO:-nosborn}" --apply
