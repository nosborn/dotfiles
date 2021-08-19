#!/bin/bash

set -o errexit
set -o nounset

#_injected_package() {
#  local -r package="$1"
#  local -r dependency="$2"

#  pipx list --json |
#    jq --arg d "${dependency}" --arg p "${package}" '.venvs[$p].metadata.injected_packages[$d]'
#}

_injected_packages() {
  local -r package="${1:-}"

  pipx list --json |
    jq --arg p "${package}" -r '.venvs[$p].metadata.injected_packages|keys[]'
}

_main_package() {
  local -r package="${1:?}"

  pipx list --json |
    jq --arg p "${package}" '.venvs[$p].metadata.main_package'
}

_venvs() {
  pipx list --json 2>/dev/null |
    jq -r '.venvs | keys[]'
}

pipx_inject() {
  local -r package="${1:?}"
  local -r dependency="${2:?}"
  local -r version="${3:-}"

  if ! _injected_packages "${package}" | grep -Fx "${dependency}" >/dev/null; then
    pipx inject "${package}" "${dependency}${version:+==${version}}"
  fi
}

pipx_install() {
  local -r package="${1}"
  local -r version="${2:-}"

  if ! _venvs | grep -Fx "$1" >/dev/null; then
    pipx install --include-deps "${package}${version:+==${version}}"
  else
    if [[ -n "${version}" ]]; then
      if [[ "$(_main_package "${package}" | jq -r .package_version)" != "${version}" ]]; then
        pipx install --force --include-deps "${package}==${version}"
      fi
    fi
  fi
}

brew_version() {
  brew info --json "${1:?}" | jq --raw-output '.[].versions.stable'
}

unset PYTHONPATH # just in case
PIPX_DEFAULT_PYTHON=/usr/bin/python3
PATH="${HOME}/.local.bin:$(${PIPX_DEFAULT_PYTHON} -msite --user-base)/bin:${PATH}"
export PIPX_DEFAULT_PYTHON PATH

if ! command -v pipx; then
  "${PIPX_DEFAULT_PYTHON}" -m pip install --user pipx
else
  "${PIPX_DEFAULT_PYTHON}" -m pip install --user --upgrade pipx
fi
ln -sfv "$(which pipx)" "${HOME}/.local/bin/pipx"

# ansible, awscli, b2-tools, black, diceware, flake8, grc, grip, jinja2-cli,
# ssh-audit, vim and yamllint

pipx install "ansible==$(brew_version ansible)" || :
pipx inject ansible ansible-base || :
pipx inject --include-apps ansible "ansible-lint==$(brew_version ansible-lint)" || :
pipx inject --include-apps ansible "molecule[docker]==$(brew_version molecule)" || :
pipx inject ansible netaddr || :

pipx install "azure-cli==$(brew_version azure-cli)" || :
pipx install "pre-commit==$(brew_version pre-commit)" || :
pipx install vim-vint || :
pipx install "yamllint==$(brew_version yamllint)" || :

if [ "$(chezmoi data | jq -r .where)" = work ]; then
  pipx install datadog || :
  pipx install mssql-cli || :
fi
