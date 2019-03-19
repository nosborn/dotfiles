#!/bin/sh

set -o errexit
set -o nounset

chezmoi init git@github.com:nosborn/dotfiles.git
chezmoi source -- submodule update --init
chezmoi apply
