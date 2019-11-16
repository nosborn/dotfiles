function __direnv_export_eval --on-event fish_prompt
  status --is-command-substitution; and return
  direnv export fish | source
end
