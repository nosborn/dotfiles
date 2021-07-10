#!/bin/bash

set -o errexit
set -o nounset

#_injected_package() {
#  local -r package="$1"
#  local -r dependency="$2"

#  pipx list --json |
#    jq --arg d "${dependency}" --arg p "${package}" '.venvs[$p].metadata.injected_packages[$d]'
#}

#_injected_packages() {
#  local -r package="$1"

#  pipx list --json |
#    jq --arg p "${package}" -r '.venvs[$p].metadata.injected_packages|keys[]'
#}

#_main_package() {
#  local -r package="$1"

#  pipx list --json |
#    jq --arg p "${package}" '.venvs[$p].metadata.main_package'
#}

#_venvs() {
#  pipx list --json 2>/dev/null |
#    jq -r '.venvs|keys[]'
#}

#pipx_inject() {
#  local -r package="${1}"
#  local -r dependency="${2}"
#  local -r version_spec="${3:-}"

#  if ! _injected_packages "${package}" | grep -Fx "${dependency}" >/dev/null; then
#    pipx inject "${package}" "${dependency}${version_spec}"
#  fi
#}

#pipx_install() {
#  local -r package="${1}"
#  local -r version_spec="${2:-}"

#  if ! _venvs | grep -Fx "$1" >/dev/null; then
#    pipx install --include-deps "${package}${version_spec}"
#  else
#    if [[ -n "${version_spec}" ]]; then
#      _main_package "${package}" | jq -r .package_or_url
#      if [[ "$(_main_package "${package}" | jq -r .package_or_url)" != "${version_spec}" ]]; then
#        pipx install --force --include-deps "${package}${version_spec}"
#      fi
#    fi
#  fi
#}

#brew_version() {
#  brew info --json ansible | jq --raw-output '.[].versions.stable'
#}

#ansible_version="$(brew info --json ansible | jq -r '.[].versions.stable')"
#unset PYTHONPATH # just in case
#PATH="${HOME}/.local.bin:$(python3 -msite --user-base)/bin:${PATH}"

## python3 -mpip install --user --upgrade --quiet --no-input --disable-pip-version-check \
##   'argcomplete' \
##   'netaddr' \
##   'vim-vint'

## if [ "$(chezmoi data | jq -r .where)" = work ]; then
##   python3 -mpip install --user --upgrade --quiet --no-input --disable-pip-version-check \
##     'ansible>=3.1,<3.2' \
##     "ansible-lint==$(brew info ansible-lint --json | jq -r '.[].versions.stable')" \
##     "azure-cli==$(brew info azure-cli --json | jq -r '.[].versions.stable')" \
##     'datadog' \
##     'datadog-checks-dev[cli]' \
##     "molecule[docker]==$(brew info molecule --json | jq -r '.[].versions.stable')" \
##     'mssql-cli'
## fi

## ansible_version="$(brew_version ansible)"
## ansible_lint_version="$(brew info --json ansible-lint | jq -r '.[].versions.stable')"
## azure_cli_version="$(brew info --json azure-cli | jq -r '.[].versions.stable')"
## molecule_version="$(brew info --json molecule | jq -r '.[].versions.stable')"

##if ! pipx list --json | jq -r '.venvs|keys[]' | grep -Fx ansible >/dev/null; then
##  pipx install --include-deps 'ansible>=3.1,<3.2'
##fi
##if ! pipx list --json | jq -r '.venvs["ansible"].metadata.injected_packages|keys[]' | grep -Fx ansible-lint >/dev/null; then
##  pipx inject ansible "ansible-lint==$(brew_version ansible-lint)"
##fi
##pipx inject ansible "molecule==$(brew_version molecule)" ansible

#pipx_install ansible '>=3.1,<3.3'
##pipx_inject ansible ansible-base
