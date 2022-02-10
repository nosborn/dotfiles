if (( ${+commands[colima]} )); then
  export DOCKER_HOST="unix://${HOME}/.colima/docker.sock"
fi
