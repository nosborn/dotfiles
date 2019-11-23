function fish_right_prompt
  # Git status
  if type -q git
    set git_topdir (git rev-parse --show-topdir . 2>/dev/null)
    if test -n "$git_topdir"
      set_color normal
      echo -n '['
      set_color blue
      echo -n 'GIT' # TODO
      set_color normal
      echo -n ']'
    end
  end
  # VPN status
  if type -q /opt/cisco/anyconnect/bin/vpn
    set state (/opt/cisco/anyconnect/bin/vpn state | grep -F '>> state:' | tail -1 | awk '{print $4}')
    switch $state
      case Connected Connecting
        set_color normal
        echo -n '['
        set_color blue
        echo -n 'VPN'
        set_color normal
        echo -n ']'
      case Disconnected
        echo -n ""
      case '*'
        set_color normal
        echo -n '['
        set_color yellow
        echo -n "VPN:$state"
        set_color normal
        echo -n ']'
    end
  end
end
