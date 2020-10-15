grep-flag-available() {
  echo | grep $1 "" >/dev/null 2>&1
}

GREP_OPTIONS=""

if grep-flag-available --color=auto; then
    GREP_OPTIONS+=" --color=auto"
fi

VCS_FOLDERS="{CVS,.bzr,.git,.hg,.svn}"

if grep-flag-available --exclude-dir=.git; then
  GREP_OPTIONS+=" --exclude-dir=${VCS_FOLDERS}"
elif grep-flag-available --exclude=.git; then
  GREP_OPTIONS+=" --exclude=${VCS_FOLDERS}"
fi

unset VCS_FOLDERS

#alias grep="grep ${GREP_OPTIONS}"
#unset GREP_OPTIONS
export GREP_OPTIONS

unfunction grep-flag-available
