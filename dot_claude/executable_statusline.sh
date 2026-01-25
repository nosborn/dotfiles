#!/bin/bash

# Read JSON input
input="$(cat)"
readonly input

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
