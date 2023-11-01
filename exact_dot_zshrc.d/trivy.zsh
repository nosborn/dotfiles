if (( ${+commands[trivy]} )); then
  source <(trivy completion zsh)
fi
