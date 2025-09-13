if (( ${+commands[colima]} )); then
  export DOCKER_HOST="unix://${HOME}/.config/colima/default/docker.sock"
fi
