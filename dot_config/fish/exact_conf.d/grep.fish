if status --is-login
  set --export GREP_OPTIONS ''

  if echo '' | grep --color=auto '' >/dev/null 2>&1
    set --append GREP_OPTIONS '--color=auto'
  end

  set --local EXCLUDE "{CVS,.bzr,.git,.hg,.svn}"

  if echo "" | grep --exclude-dir=.git "" >/dev/null 2>&1
    set --append GREP_OPTIONS "--exclude-dir=$EXCLUDE"
  else if echo "" | grep --exclude=.git "" >/dev/null 2>&1
    set --append GREP_OPTIONS "--exclude=$EXCLUDE"
  end
end
