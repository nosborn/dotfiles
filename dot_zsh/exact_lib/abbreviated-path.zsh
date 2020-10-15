abbreviated_path() {
  case "${PWD}" in
    ${HOME}/src/github.com/*)
      echo "${PWD/#${HOME}\/src\/github.com/~/s/g}"
      ;;
    ${HOME}/src/github.com)
      echo '~/s/github.com'
      ;;
    ${HOME}/*)
      echo "${PWD/#${HOME}/~}"
      ;;
    ${HOME})
      echo '~'
      ;;
    *)
      echo "${PWD}"
      ;;
  esac
}
