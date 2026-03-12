#!/bin/bash

# Read JSON input
input="$(cat)"
readonly input

MODEL="$(echo "${input}" | jq -r '.model.display_name')"
DIR="$(echo "${input}" | jq -r '.workspace.current_dir')"
COST="$(echo "${input}" | jq -r '.cost.total_cost_usd // 0')"
PCT="$(echo "${input}" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)"
DURATION_MS="$(echo "${input}" | jq -r '.cost.total_duration_ms // 0')"
readonly MODEL DIR COST PCT DURATION_MS

readonly CYAN='\033[36m'
readonly GREEN='\033[32m'
readonly YELLOW='\033[33m'
readonly RED='\033[31m'
readonly RESET='\033[0m'

if [[ "${PCT}" -ge 90 ]]; then
  BAR_COLOR="${RED}"
elif [[ "${PCT}" -ge 70 ]]; then
  BAR_COLOR="${YELLOW}"
else
  BAR_COLOR="${GREEN}"
fi
readonly BAR_COLOR

readonly FILLED=$((PCT / 10))
readonly EMPTY=$((10 - FILLED))
BAR="$(printf "%${FILLED}s" | tr ' ' '█')$(printf "%${EMPTY}s" | tr ' ' '░')"
readonly BAR

readonly MINS=$((DURATION_MS / 60000))
readonly SECS=$(((DURATION_MS % 60000) / 1000))

BRANCH=""
git rev-parse --git-dir &>/dev/null && BRANCH=" | 🌿 $(git branch --show-current 2>/dev/null)"
readonly BRANCH

echo -e "${CYAN}[${MODEL}]${RESET} 📁 ${DIR##*/}${BRANCH}"
COST_FMT="$(printf '$%.2f' "${COST}")"
echo -e "${BAR_COLOR}${BAR}${RESET} ${PCT}% | ${YELLOW}${COST_FMT}${RESET} | ⏱️ ${MINS}m ${SECS}s"

exit

# Extract current directory
cwd="$(jq -r '.workspace.current_dir' <<<"${input}")"
current_dir="$(basename "${cwd}")"

# Context window usage percentage
context_percent="$(jq -r '.context.percentUsed // empty' <<<"${input}")"
if [[ -n "${context_percent}" ]]; then
  context_info=$(printf " \033[2m[ %s%%]\033[0m" "${context_percent}")
else
  context_info=""
fi

model_id="$(jq -r '.model.id' <<<"${input}")"
if [[ -n "${model_id}" ]]; then
  model_info="$(printf ' \033[2m[ %s]\033[0m' "${model_id}")"
else
  model_info=""
fi

# Git branch and status
git_info=""
if git -C "${cwd}" rev-parse --git-dir &>/dev/null; then
  branch=$(git -C "${cwd}" --no-optional-locks branch --show-current 2>/dev/null)
  if [[ -n "${branch}" ]]; then
    if ! git -C "${cwd}" --no-optional-locks diff --quiet 2>/dev/null || ! git -C "${cwd}" --no-optional-locks diff --cached --quiet 2>/dev/null; then
      status="*"
    else
      status=""
    fi
    git_info="$(printf " \033[2m[ %s%s]\033[0m" "${branch}" "${status}")"
  fi
fi

# Kubernetes context
k8s_info=""
if command -v kubectl &>/dev/null; then
  context="$(kubectl config current-context 2>/dev/null)"
  if [[ -n "${context}" ]]; then
    namespace="$(kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)"
    if [[ -n "${namespace}" ]] && [[ "${namespace}" != default ]]; then
      k8s_info="$(printf " \033[2m[☸ %s (%s)]\033[0m" "${context}" "${namespace}")"
    else
      k8s_info="$(printf " \033[2m[☸ %s]\033[0m" "${context}")"
    fi
  fi
fi

# Build and print status line
printf "\033[2m%s\033[0m%s%s%s%s" "${current_dir:-}" "${git_info:-}" "${k8s_info:-}" "${context_info:-}" "${model_info:-}"
