keyDown = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(event)
  local characters = event:getCharacters()
  local keyCode = event:getKeyCode()
  print("down", characters, keyCode)
end)
keyDown:start()