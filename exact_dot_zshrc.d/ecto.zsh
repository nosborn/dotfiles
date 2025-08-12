cd() {
  local ecto_vol=ecto-19990426
  local ecto_mp="/Volumes/${ecto_vol}"
  if [[ $1 == ${ecto_mp} ]] || [[ $1 == ${ecto_mp}/* ]]; then
    if [[ ! -d "${ecto_mp}" ]]; then
      local ecto_dmg="${HOME}/Downloads/${ecto_vol}.dmg"
      if [[ -e "${ecto_dmg}" ]]; then
        hdiutil attach -readonly -quiet -nobrowse "${ecto_dmg}"
      fi
    fi
  fi
  builtin cd "$@"
}
