function __tf_workspace() {
  if [ -d .terraform ]; then
    workspace=$(command terraform workspace show 2>/dev/null)
    echo -n "🄣 ${workspace}"
  fi
}
