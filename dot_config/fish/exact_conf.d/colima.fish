if type --quiet colima
    docker context use colima >/dev/null
    # set --export --global DOCKER_CONTEXT (docker context use colima)
    # set --export --global DOCKER_HOST "unix:///$HOME/.colima/docker.sock"
end
