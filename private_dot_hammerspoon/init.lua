function battery_watcher()
  if hs.battery.percentage() < 100 or hs.battery.powerSource == 'AC Power' then
    os.execute('defaults write com.apple.menuextra.battery ShowPercent YES')
  else
    os.execute('defaults write com.apple.menuextra.battery ShowPercent NO')
  end
end

hs.battery.watcher.new(battery_watcher):start()
