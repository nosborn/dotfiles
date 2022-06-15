if (( ${+commands[lesspipe.sh]} )); then
  export LESSOPEN="|${commands[lesspipe.sh]} %s"
  export LESSQUIET=1
fi

export LESS=-FR
export PAGER=${commands[less]}
