if (( ${+commands[colima]} )); then
  export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"
fi
