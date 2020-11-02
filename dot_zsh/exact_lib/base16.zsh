if [ -n "${PS1}" ]; then
  if [ -s "${HOME}/.config/base16-shell/profile_helper.sh" ]; then
    eval "$("${HOME}/.config/base16-shell/profile_helper.sh")"
    base16_tomorrow-night
  fi
fi
