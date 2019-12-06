function fish_right_prompt
  # Git status
  if type -q git
    set -g __fish_git_prompt_show_informative_status 1
    __fish_git_prompt
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
