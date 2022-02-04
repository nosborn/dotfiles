if (( ${+commands[colima]} )); then
  DOCKER_CONTEXT="$(docker context use colima)"
  DOCKER_HOST="$(docker context inspect --format '{{.Endpoints.docker.Host}}')"
  export DOCKER_CONTEXT DOCKER_HOST
fi
