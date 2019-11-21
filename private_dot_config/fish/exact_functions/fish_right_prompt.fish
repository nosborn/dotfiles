function fish_right_prompt
  # VPN status
  if test -e /opt/cisco/anyconnect/bin/vpn; then
    set state (/opt/cisco/anyconnect/bin/vpn state | grep -F '>> state:' | tail -1 | awk '{print $4}')
    switch $state
      case Connected Connecting
        set_color blue
        echo -n VPN
        set color normal
      case Disconnected
        echo -n ""
      case '*'
        set_color yellow
        echo -n VPN:$state
        set color normal
    end
  end
end
