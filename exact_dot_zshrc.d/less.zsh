if (( ${+commands[lesspipe.sh]} )); then
  export LESSOPEN="|${commands[lesspipe.sh]} %s"
  export LESSQUIET=1
fi

if [[ -n "${XDG_CACHE_HOME}" ]]; then
  export LESSHISTFILE="${XDG_CACHE_HOME}/less/history"
  mkdir -p "${LESSHISTFILE:h}"
fi

export LESS=-FR
export PAGER=${commands[less]}
